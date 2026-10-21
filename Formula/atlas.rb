class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.40.0/atlas-darwin-aarch64.tar.gz"
      sha256 "7b9deac810a8527f5d8a16d96262dd841d24ce833e3d3d39c4647e553d6e8ecb"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.40.0/atlas-darwin-x86_64.tar.gz"
      sha256 "830f25ffb869c21f8818f9bb44b60912c9773501cea416fc14eafc6b5c4b5a81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.40.0/atlas-linux-aarch64.tar.gz"
      sha256 "2bbd33d2af3958ed1ac23c895569437425b1166a321f78f7fe38fb64b950f38f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.40.0/atlas-linux-x86_64.tar.gz"
      sha256 "1addc2ded0d0d23e61c4db1d2e1c33b1dc5d9f277a4f1b14a92844389e676df0"
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
