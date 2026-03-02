cask "switchboard" do
  version "1.1.2"
  sha256 "e041a02bb8870f18a324a9af507aa98d499e81b3cf9f2ac325f13f302fa7aae3"

  url "https://github.com/clarkemn/switchboard/releases/download/v1.1.2/switchboard-1.1.2-darwin-arm64.tar.gz"
  name "Switchboard"
  desc "Native GUI for Granted AWS profile management"
  homepage "https://github.com/clarkemn/switchboard"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Switchboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Switchboard.app"]
  end

  caveats <<~EOS
    Switchboard has been installed to your Applications folder.

    Note: This is an ARM64-only build for Apple Silicon Macs.
  EOS
end
