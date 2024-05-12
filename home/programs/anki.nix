{pkgs, ...}: {
  # fetching works, but anki says it is incompatible, I don't know why
  # TODO: fix this

  # home.file.".local/share/Anki2/addons21/review-heatmap".source = pkgs.fetchFromGitHub {
  #   owner = "glutanimate";
  #   repo = "review-heatmap";
  #   rev = "b796468e99037726c4e46740e3c6dd3b6d80df34";
  #   hash = "sha256-B43z4frHH8SQqHZ6bxp3PCyvibziZZkFdF7ubvq8rHs=";
  # } + "/src/review_heatmap";
}
