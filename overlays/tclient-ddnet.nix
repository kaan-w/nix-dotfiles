final: prev: {
	tclient-ddnet = prev.ddnet.overrideAttrs (previousAttrs: {
		src = final.fetchFromGitHub {
			owner = "sjrc6";
			repo = "TaterClient-ddnet";
			rev = "8.6.0";
			hash = "sha256-IfTQRMC2wcEH+KhlADHVIhfavlTN4mfTtlN5+/KojA0=";
		};
		# https://github.com/NixOS/nixpkgs/pull/346915/files#diff-72eb7c26aa34edbee908c3d58399b8157d106be7801feded7422af20c5df525fR95-R100
		patches = [];
	});
}
