class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.95.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.95.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f7018bcba9d23bc45a274c126e12412b8097a24d0ce015f7b2179a376b1b920c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.95.0/atlas-darwin-x86_64.tar.gz"
      sha256 "6d8e6fe6fb61d781a5958468cac6fe8e381aa5675cadf181fd89ec891da3ad81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.95.0/atlas-linux-aarch64.tar.gz"
      sha256 "60acd3f6f05e7024736b680a0003913a0c36ae05474c98b23a3bb5d208c16b3c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.95.0/atlas-linux-x86_64.tar.gz"
      sha256 "87ff2f0cc1a1544035ee337246e42110ee43d8e68b1b2f9ba1a0278123057604"
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
