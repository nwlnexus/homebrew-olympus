class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.10/atlas-darwin-aarch64.tar.gz"
      sha256 "d18368ad1868e8360de221f4b874dc90388543f109d63d7b727d31572af5dd5d"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.10/atlas-darwin-x86_64.tar.gz"
      sha256 "2b061b1dd94a24c2e058783c152d53a52f307e34408021a8f29656baf1da9702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.10/atlas-linux-aarch64.tar.gz"
      sha256 "658534ff3036dee0c5b478aa10db39a3de16b8236e80349d866405befb3ff879"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.10/atlas-linux-x86_64.tar.gz"
      sha256 "930eb0bdf38750d0c215b9bd15541cea90ed87c32e3a849b518e0c03dda313f1"
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
