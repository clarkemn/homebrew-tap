cask "switchboard" do
  version "1.0.0"
  sha256 "58db37a2410387b32d76343f6611521b6ce437c31798273903eb20fd22544840"

  url "https://github.com/clarkemn/switchboard/releases/download/v#{version}/switchboard-#{version}-darwin-arm64.tar.gz"
  name "Switchboard"
  desc "Native macOS GUI for Granted AWS profile management"
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
