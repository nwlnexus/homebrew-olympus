class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.0/atlas-darwin-aarch64.tar.gz"
      sha256 "4dd440d9dec67428688082120b1d95506e507a99c597f7047e1e508d67a951dd"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.0/atlas-darwin-x86_64.tar.gz"
      sha256 "4d946c7efce1b9d41e3b12646abb69b7706740e5b39990d02583de66b9b2b282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.0/atlas-linux-aarch64.tar.gz"
      sha256 "c7c3826c6836e3a15235e7a61ebdbff6f04c77f7f098e8a199ed3794c0039222"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.0/atlas-linux-x86_64.tar.gz"
      sha256 "35e7605c515888926a905c134a2fe61522918958877062d307bc9505226a63c1"
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
