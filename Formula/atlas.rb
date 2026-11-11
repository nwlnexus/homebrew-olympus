class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.59.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.59.0/atlas-darwin-aarch64.tar.gz"
      sha256 "1d1be3f56d994c407863314e40948485ebf46d95d0b3152d4fd827b5e86f53f5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.59.0/atlas-darwin-x86_64.tar.gz"
      sha256 "2da274c175146e903e912810f323c3ecda23dd9c23bdb450fcd9a03986f73244"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.59.0/atlas-linux-aarch64.tar.gz"
      sha256 "e89a796e7248b9a43d2459ff0e5f93080dfc97997808ea1675c97b7526aa64ac"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.59.0/atlas-linux-x86_64.tar.gz"
      sha256 "e3ee5d6355749a68bb971ddf21690c4c7bc31424d940334f9abbd01a46c48a0d"
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
