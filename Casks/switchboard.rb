cask "switchboard" do
  version "1.1.2"
  sha256 "793c216c8012779d1b832660dd233de2902a93c0faeafddf03e8b6e292b68b19"

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
