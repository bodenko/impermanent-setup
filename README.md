## You can find all files in /final

## downloading disko.nix
```bash
curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/disko.nix -o /tmp/disko.nix
```
## disko formatting command
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix --arg device '"/dev/nvme0n1"'
```
## generate nixos config
```bash
sudo nixos-generate-config --no-filesystems --root /mnt
```
or
```bash
curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/configuration-inital.nix -o configuration.nix
```
```bash
sudo mv /tmp/disko.nix /mnt/etc/nixos/
```
```bash
cd /mnt/etc/nixos
curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/flake.nix -o flake.nix
```
```bash
cp -r /mnt/etc/nixos /mnt/persist
```
## installing nixos
```bash
nixos-install --root /mnt --flake /mnt/etc/nixos#default
```
## enable persistance
uncomment in flakes.nix
replace configuration.nix
```bash
sudo curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/configuration.nix -o configuration.nix
```
```bash
sudo curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/home.nix -o home.nix
```

```bash
sudo rm -r /etc/nixos/*
sudo nixos-rebuild boot --flake /persist/nixos#default
sudo mkdir /persist/system
sudo mkdir /persist/system/var
sudo mkdir /persist/system/var/log
sudo mkdir /persist/system/var/lib
sudo mkdir /persist/system/var/lib/nixos
sudo mkdir /persist/home
reboot
```

```bash
sudo mkdir -p /etc/
sudo cp -r /persist/nixos /etc
reboot
```


```bash
sudo nixos-rebuild switch --flake /etc/nixos#default
```
