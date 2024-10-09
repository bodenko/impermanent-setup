## You can find all files in /final

## downloading disko.nix
```bash
curl https://raw.githubusercontent.com/bodenko/impermanent-setup/main/final/disko.nix -o /tmp/disko.nix
```

## disko formatting command
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix --arg device '"/dev/nvme0n1"'
```

## initialize flake
```bash
nix flake init --template github:bodenko/impermanent-setup
```

## installing nixos
```bash
nixos-install --root /mnt --flake /mnt/etc/nixos#default
```
