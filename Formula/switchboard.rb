class Switchboard < Formula
  desc "Native macOS GUI for Granted AWS profile management"
  homepage "https://github.com/clarkemn/switchboard"
  version "1.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/clarkemn/switchboard/releases/download/v1.0.0/switchboard-1.0.0-darwin-arm64.tar.gz"
    sha256 "PLACEHOLDER_ARM64_SHA256"
  else
    url "https://github.com/clarkemn/switchboard/releases/download/v1.0.0/switchboard-1.0.0-darwin-amd64.tar.gz"
    sha256 "PLACEHOLDER_AMD64_SHA256"
  end

  def install
    prefix.install "Switchboard.app"
  end

  def caveats
    <<~EOS
      Switchboard has been installed to:
        #{prefix}/Switchboard.app

      To use Switchboard, you can:
        1. Open it from Applications folder (if linked)
        2. Run: open #{prefix}/Switchboard.app
        3. Create an alias in /Applications:
           ln -s #{prefix}/Switchboard.app /Applications/Switchboard.app
    EOS
  end
end
