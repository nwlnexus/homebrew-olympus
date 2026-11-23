class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.98.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.98.0/atlas-darwin-aarch64.tar.gz"
      sha256 "59b18d04f1652095673ac67ba4c4d5254525b18464576c97b20176732cb86034"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.98.0/atlas-darwin-x86_64.tar.gz"
      sha256 "9344b1ef58502ea4719df7038d27849a296638f42597c3bcdcc9bffcc407bd32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.98.0/atlas-linux-aarch64.tar.gz"
      sha256 "16c2855ab493febe646041cdf7e836ace44f7f286ab9b23e2bfee817ebc2b643"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.98.0/atlas-linux-x86_64.tar.gz"
      sha256 "5443fc1d90b89e98d9f52d4440e99d34ffc0ee26e050a794e93c4c0e0abbcbed"
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
