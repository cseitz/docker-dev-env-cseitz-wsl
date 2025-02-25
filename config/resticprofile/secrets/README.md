# Secrets

- `ssh/id_rsa`: SSH Private Key
- `ssh/id_rsa.pub`: SSH Public Key
- `ssh/config`: SSH Config to set up SSH credentials for `remote.txt`
- `remote.txt`: Remote to copy repositories to
- `passwords`: See [Passwords](./passwords/README.md)

Credentials are located in 1Password under `docker-dev-env-cseitz-wsl denv config`

## Examples

```bash
# create ssh directory
mkdir -p ./config/resticprofile/secrets/ssh
# copy private key
cp ~/.ssh/id_rsa ./config/resticprofile/secrets/ssh
# copy public key
cp ~/.ssh/id_rsa.pub ./config/resticprofile/secrets/ssh
```

`ssh/config`:
```
Host remote-backup-host
  HostName example.com
  User username
  IdentityFile ~/.ssh/id_rsa
```

`remote.txt`:
```
sftp:remote-backup-host:data/cseitz-wsl/docker-dev-env-cseitz-wsl/resticprofile/repos/local
```
