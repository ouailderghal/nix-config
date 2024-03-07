{ config, pkgs, ...}:
{
  users.users.ouail = {
    isNormalUser = true;
    description = "Ouail Derghal";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
