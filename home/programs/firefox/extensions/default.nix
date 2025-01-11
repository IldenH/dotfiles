{
  inputs,
  pkgs,
}:
# https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json?ref_type=heads
with inputs.firefox-addons.packages."${pkgs.system}"; [
  ublock-origin
  darkreader
  bitwarden

  clearurls
  facebook-container
  i-dont-care-about-cookies
  privacy-badger

  enhanced-h264ify
  sponsorblock
  dearrow

  yomitan
]
