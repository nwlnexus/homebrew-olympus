class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.2/atlas-darwin-aarch64.tar.gz"
      sha256 "b0f0bc8775e1a8a9f341ad7c6d2c37187fc5041ff5d5064acf9fd514ec428db3"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.2/atlas-darwin-x86_64.tar.gz"
      sha256 "cfb7373931e6c0ccc33ac97a7ee2751d2d51a1bea22ce0312277c902b13c974b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.2/atlas-linux-aarch64.tar.gz"
      sha256 "2588cd68e191687d016eae96daf356ab2f6742f63401ab2cece07c421a9c194c"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.2/atlas-linux-x86_64.tar.gz"
      sha256 "ba084dc38a440dfc3ad56476fc32314c2449990e7f30539a0bd491a32fe51673"
    end
  end

  def install
    bin.install "atlas"
    (etc/"atlas").mkpath
    File.write("#{etc}/atlas/install-method", "brew")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atlas --version")
  end
end
