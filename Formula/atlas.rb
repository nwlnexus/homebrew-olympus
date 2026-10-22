class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.44.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.1/atlas-darwin-aarch64.tar.gz"
      sha256 "d656d0d5e2461b1c2e59d056c188ccf8707f59d0fd5d94e28d161f11323e72ae"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.1/atlas-darwin-x86_64.tar.gz"
      sha256 "42776b1a120fb87fb1b835cd5025d3e6d6aa7f809da4f8b4472a284c00cc8470"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.1/atlas-linux-aarch64.tar.gz"
      sha256 "2acb5e2591825837485ca9d3de1d33bc7c774dace349fa9ca6d66b8072caf255"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.1/atlas-linux-x86_64.tar.gz"
      sha256 "429f9e7ef8bd193fd4ee96b1eb2b18f58a9584383ac93d5745d2454593795dc8"
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
