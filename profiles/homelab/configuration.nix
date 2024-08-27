{ userSettings, ... }:

{
  imports = [ ./base.nix
              ( import ../../system/security/sshd.nix {
                authorizedKeys = [ userSettings.sshAuthorizedKey ];
                inherit userSettings; })
            ];
}
