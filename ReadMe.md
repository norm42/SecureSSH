### Secure SSH 
This folder contains instructions and sample key files to configure the raspberry pi for secure ssh.  There is also a script that can be used to install the public key or update the public key.

Secure SSH works by having using an asymmetric encryption algorithm for authentication, a public key and a private key.  The public key is stored on the raspberry pi in the ~/.ssh directory.  The file authorized_keys contains the public key.  While the public key can be "public", care must be taken that a malicious user does not overwrite the public key in the pi home directory.  Thus allowing their own private key to work.

The computer that is logging into the pi has a private key that is used to authorize login.  This key needs to be kept private as it allows a user to authenticate with a remote login.

An optional passphrase can be included to add a level of security.  This pass phrase is required at login in addition to having the encryption keys set up.
##### Folder contents
Note there are key files included here for testing only.  New keys should be generated for production use.  In particular, the private key should have restricted access as ownership of that file will allow anyone with the private key (and passphrase) to remote login.

| File | Description |
|--------|--------|
| configssh.sh       |   This file configures the pi user account to enable secure ssh. In addition sshd_config is updated to restrict remote logins.  Console logins are still enabled.  The script is run on the pi with a user that has sudo privileges, in a directory that contains the sshd_config and authorized_keys files.|
|authorized_keys| This file contains a SAMPLE public key that can be used for testing.|
|norm256private.ppk| This file contains the SAMPLE private key in a format that is compatible with PuTTY on windows.  This file has a passcode as well (norm256).  This file needs to be on the windows machine that is remote logging into the pi|
|sshd_config| Updated sshd configuration file set to restrict remote logins to the use pi, disallow password and root remote login.|
|ssh pc-putty instructions.pdf| Instructions on how to generate keys with the puttygen windows tool, how to format the public key for the pi, and how to use with PuTTY on windows to login to the pi.|




