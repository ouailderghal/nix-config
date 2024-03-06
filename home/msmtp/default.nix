{ config, pkgs, ... }:
{
  programs.msmtp = {
    enable = true;

    extraConfig = ''
      defaults
      auth on
      tls on
      tls_trust_file /etc/ssl/certs/ca-certificates.crt
      logfile ~/.config/msmtp/msmtp.log

      account ouail.derghal@imt-atlantique.fr
      host z.imt.fr
      port 587
      tls_starttls on
      from ouail.derghal@imt-atlantique.fr
      user ouail.derghal@imt-atlantique.fr
      passwordeval "pass z.imt.fr"
    '';
  };
}
