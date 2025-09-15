{ pkgs, ...}: {
  force = true;
  packages = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    material-icons-for-github
    wappalyzer
    terms-of-service-didnt-read
    wayback-machine
    clearurls
    return-youtube-dislikes
    sponsorblock
    privacy-badger
    istilldontcareaboutcookies
    unpaywall
    violentmonkey
  ];
}