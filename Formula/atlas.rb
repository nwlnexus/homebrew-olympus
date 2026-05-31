class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.0/atlas-darwin-aarch64.tar.gz"
      sha256 "6b4bdb3ad60f55d5e07b4ff754df3dd9029245870f56137cd71afe9a791942a2"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.0/atlas-darwin-x86_64.tar.gz"
      sha256 "f5736e2cdd0c32abca21227854a648d3f7479b1121c0f7ae420069d95c89ea1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.0/atlas-linux-aarch64.tar.gz"
      sha256 "ba999819a840a56cb5d205c583f317ebc158370b4188384ed79a2340587bc3a5"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.0/atlas-linux-x86_64.tar.gz"
      sha256 "bd8932dad5fecda4ec58ab37cb33c073201ef8aa76d62f69ea3010fe2c5bdb47"
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
