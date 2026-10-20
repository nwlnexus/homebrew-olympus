class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.37.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.1/atlas-darwin-aarch64.tar.gz"
      sha256 "16036863866ff379884898aef06bbeab7078053d0929fe22b7357a3a7a650a92"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.1/atlas-darwin-x86_64.tar.gz"
      sha256 "8729ae6f10ac4c056d2de924a119bea1f65591ac2d13ff95d4b6f10bcaf1ec21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.1/atlas-linux-aarch64.tar.gz"
      sha256 "01719ca4c07d9fa588432de6049d291d2624c05a45f9e0025482b96dfae00bc9"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.1/atlas-linux-x86_64.tar.gz"
      sha256 "ecb62e7f55d8d0799a5a88c062acfdf036f61b6b975b1acf87a51d8e544689b6"
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
