{ config, pkgs, ... }:
{
  programs.mbsync = {
    enable = true;

    extraConfig = ''
      IMAPAccount imt
      Host z.imt.fr
      SSLType IMAPS
      CertificateFile /etc/ssl/certs/ca-certificates.crt
      User ouail.derghal@imt-atlantique.fr
      PassCmd "pass phd/z.imt.fr | grep -oP '(?<=password: ).*'"

      IMAPStore imt-remote
      Account imt

      MaildirStore imt-local
      SubFolders Verbatim
      Path ~/Mail/imt/
      Inbox ~/Mail/imt/Inbox

      Channel imt
      Far :imt-remote:
      Near :imt-local:
      Patterns *
      Create Both
      Expunge Both
      SyncState *
    '';
  };
}
