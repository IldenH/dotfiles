{
  inputs,
  pkgs,
}:
# https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json?ref_type=heads
with inputs.firefox-addons.packages."${pkgs.system}"; [
  bitwarden
  clearurls
  darkreader
  # df-youtube # ublock filters work better
  enhanced-h264ify
  facebook-container
  i-dont-care-about-cookies
  privacy-badger
  # simplelogin # don't really use
  sponsorblock
  #	stylus # userContent works better
  # tampermonkey # unfree might change to grease monkey
  ublock-origin
  yomitan
  youtube-shorts-block
]
