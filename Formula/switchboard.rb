class Switchboard < Formula
  desc "Native macOS GUI for Granted AWS profile management"
  homepage "https://github.com/clarkemn/switchboard"
  url "https://github.com/clarkemn/switchboard/releases/download/v1.0.0/switchboard-1.0.0-darwin-arm64.tar.gz"
  sha256 "d83460543be4118155ec7f84dab4a040316ebd2b4a8f2e2b5e48bb5ff9d7cb7a"
  version "1.0.0"

  def install
    prefix.install "Switchboard.app"
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
