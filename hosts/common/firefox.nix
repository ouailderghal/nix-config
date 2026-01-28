{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-US"
      "fr"
    ];

    policies = {
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "DisableFormHistory" = true;
      "DisablePocket" = true;
      "DisableProfileImport" = true;
      "OfferToSaveLoginsDefault" = false;
      "PasswordManagerEnabled" = false;
      "SanitizeOnShutdown" = {
        "Cache" = true;
        "Cookies" = false;
        "FormData" = true;
        "History" = false;
        "Sessions" = false;
        "SiteSettings" = false;
        "Locked" = false;
      };

      "SearchEngines" = {
        "Add" = [
          {
            "Name" = "Nixpkgs (unstable)";
            "URLTemplate" = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
            "Method" = "GET";
            "IconURL" = "https://nixos.org/favicon.ico";
            "Alias" = "@nix";
            "Description" = "Search in nixpkgs (unstable)";
          }
          {
            "Name" = "NixOS Wiki";
            "URLTemplate" = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            "Method" = "GET";
            "IconURL" = "https://wiki.nixos.org/favicon.ico";
            "Alias" = "@nixwiki";
            "Description" = "Search the NixOS Wiki";
          }
          {
            "Name" = "Amazon France";
            "URLTemplate" = "https://www.amazon.fr/s?k={searchTerms}";
            "Method" = "GET";
            "IconURL" = "https://www.amazon.fr/favicon.ico";
            "Alias" = "@amazonfr";
            "Description" = "Search Amazon France";
          }
          {
            "Name" = "Google Scholar";
            "URLTemplate" = "https://scholar.google.com/scholar?q={searchTerms}";
            "Method" = "GET";
            "IconURL" = "https://scholar.google.com/favicon.ico";
            "Alias" = "@scholar";
            "Description" = "Search Google Scholar";
          }
        ];
      };
    };
  };
}
