{
  description = "Nixos config flake";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #impermanence = {
    #  url = "github:nix-community/impermanence";
    #};

    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    #lanzaboote = {
    #  url = "github:nix-community/lanzaboote/v0.4.1";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    
    #hyprland = {
    #  url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = {self, nixpkgs, lanzaboote, home-manager, ...} @ inputs:
  {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = with self.nixosModules; [
        inputs.disko.nixosModules.default
        (import ./disko.nix { device = "/dev/nvme0n1"; })
        #lanzaboote.nixosModules.lanzaboote

        #inputs.impermanence.nixosModules.impermanence
        ./configuration.nix
        #traits.workstation
	      #traits.gaming
	      home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user1 = import ./home.nix;
        }
      ];
    };

    #nixosModules = {
    #    traits.workstation = ./workstation.nix;
	  #    traits.gaming = ./gaming.nix;
    #};
  };
}
