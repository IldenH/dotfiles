{ ... }:

{
	programs.git = {
		enable = true;
		userName = "IldenH";
		userEmail = "IldenH.1" + "@" + "proton.me";
		extraConfig = {
			credential.helper = "store"; # I should probably switch to ssh
		};
	};
}
