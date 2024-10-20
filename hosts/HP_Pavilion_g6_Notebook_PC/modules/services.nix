{pkgs, ...}:
{

   services = {
     gvfs.enable = true;

     openssh = {
       enable = true;
       settings = {
         PasswordAuthentication = false;
         KbdInteractiveAuthentication = false;
       };
     };
     flatpak.enable = true;
  };

}

