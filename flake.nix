{

inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    ayugram-desktop.url = "github:kaeeraa/ayugram-desktop/release?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

outputs = {nixpkgs, home-manager, ...}@inputs:
  let 
    system = "x86_64-linux";
  in {
        nixosConfigurations.hp = nixpkgs.lib.nixosSystem {
          system = { inherit system; };
          modules = [ 
            ./hosts/HP_Pavilion_g6_Notebook_PC
            home-manager.nixosModules.home-manager {
              home-manager = {
                backupFileExtension = "backup";
                useUserPackages = true;
                users.lulu = import ./home/lulu;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
  };
}
