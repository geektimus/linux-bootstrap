# Linux Setup Repo

This repo will include all the configurations used on my linux boxes

## Useful Instructions

### Configure git-crypt on a repo

Initialize git-crypt

``` sh
git-crypt init
```

Import public keys to our gpg keyring
``` sh
// Export (Collaborator)
gpg --armor --export --output /home/<username>/user_pubkey.gpg <gpg_id>
// Import (Repo Owner)
gpg --import user_pubkey.gpg
// Trust the keys (cmds: trust -> save)
gpg ––edit–key <gpg_id>
```

Add the user to the git-crypt repo

``` sh
git-crypt add-gpg-user <gpg_id>
```
