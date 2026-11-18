class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.80.0/atlas-darwin-aarch64.tar.gz"
      sha256 "6df9dbdac75a0026aaadf8f76b1d33b9a8fd506a85cff6acb7821612e6535f1d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.80.0/atlas-darwin-x86_64.tar.gz"
      sha256 "677b6722f65e8763a58a40e9ddf285042ef0740a13e232cc589c0636810314a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.80.0/atlas-linux-aarch64.tar.gz"
      sha256 "0a0e92600a84b3357e20079712f335a681f6e6a5868ac3b60eadaec7b39e7edc"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.80.0/atlas-linux-x86_64.tar.gz"
      sha256 "642d9021d088842640a3cdddbce3db37f8365e36ca85a78259c8f202ab615a85"
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
