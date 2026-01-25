class Switchboard < Formula
  desc "Native macOS GUI for Granted AWS profile management"
  homepage "https://github.com/clarkemn/switchboard"
  url "https://github.com/clarkemn/switchboard/releases/download/v1.0.0/switchboard-1.0.0-darwin-arm64.tar.gz"
  version "1.0.0"
  sha256 "58db37a2410387b32d76343f6611521b6ce437c31798273903eb20fd22544840"

  bottle :unneeded

  depends_on arch: :arm64
  depends_on :macos

  def install
    prefix.install "Switchboard.app"
  end

  def post_install
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "#{prefix}/Switchboard.app"]
  end

  def caveats
    <<~EOS
      Switchboard has been installed to:
        #{prefix}/Switchboard.app

      Note: This is an ARM64-only build for Apple Silicon Macs.

      To use Switchboard, you can:
        1. Open it from Applications folder (if linked)
        2. Run: open #{prefix}/Switchboard.app
        3. Create an alias in /Applications:
           ln -s #{prefix}/Switchboard.app /Applications/Switchboard.app
    EOS
  end
end
