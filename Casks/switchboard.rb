cask "switchboard" do
  version "1.2.0"
  sha256 "eb2b5df299463fd75d36b5ec57da8f42670cfe2795e6d1bf027e1eb06ed94e0b"

  url "https://github.com/clarkemn/switchboard/releases/download/v#{version}/switchboard-#{version}-darwin-arm64.tar.gz"
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
