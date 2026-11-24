class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.104.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.1/atlas-darwin-aarch64.tar.gz"
      sha256 "e5769a2de7e0df8b8411fc681a43a7a67e3115d65a9f016d2bafa0a3f0df91b2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.1/atlas-darwin-x86_64.tar.gz"
      sha256 "69ade04bc912c441c7a5532d6a190ce768eb63e9412a6436d1c74f86f14d824d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.1/atlas-linux-aarch64.tar.gz"
      sha256 "5fd1b241efae4830988a060eb4bdb01e374f574e49b78a44b7a61c2e0f9a51f2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.1/atlas-linux-x86_64.tar.gz"
      sha256 "441231031eb78b2aea8c4d70cb89f0f78e8f86cd248db69c68142f0ad56498d3"
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
