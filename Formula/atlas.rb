class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.92.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.92.0/atlas-darwin-aarch64.tar.gz"
      sha256 "4acd3c2a0b1af5a171a62b819d516cd12c52b5e8b558ab130025e65ce4d59b61"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.92.0/atlas-darwin-x86_64.tar.gz"
      sha256 "34aa0f4d98d97ac6576c26c05287661b897114e2d33b8f178ba3713dd582f1d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.92.0/atlas-linux-aarch64.tar.gz"
      sha256 "e189da0a11297333773a722f2c08d2ee41ffe30a92fd013965553f192664b92e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.92.0/atlas-linux-x86_64.tar.gz"
      sha256 "4481cf9347aa9d1a9ead14de5120c11c0a653b9f5f52f54f79f6c7c246917849"
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
