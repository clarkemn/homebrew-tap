cask "switchboard" do
  version "1.1.5"
  sha256 "ce8c95e542b7b5eafc6f02f6f66c148d33eabf96a630ff5f70c1ddad384b6dde"

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
