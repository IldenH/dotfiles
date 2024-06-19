{
  stdenv,
  fetchFromGitHub,
  colorScheme,
}:
# TODO: nix-color this:
# https://github.com/sandesh236/sleek--themes/blob/master/Sleek%20theme-dark/sleek/theme.txt
stdenv.mkDerivation {
  name = "grub-theme-${colorScheme.slug}";
  src = fetchFromGitHub {
    owner = "sandesh236";
    repo = "sleek--themes";
    rev = "0a680163a0711c4ed23d5d3b1b9a0f67115cb6d8";
    hash = "sha256-bof/4Ab9XmhlG7kRQfVGzsyClAW2bctHn4kdcIJox9o=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/

    cp -r "Sleek theme-dark"/sleek/* $out/
    sed -i "s/Grub Bootloader//" $out/theme.txt

    runHook postInstall
  '';
}
