class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.12/atlas-darwin-aarch64.tar.gz"
      sha256 "4a5c9dd5412f0570a2812a6e0adff4c6753d1676ad60c03afe778bd86aef7a19"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.12/atlas-darwin-x86_64.tar.gz"
      sha256 "944a0a4ba42c378c03ce40f4e3f50cf2f2fb33a1dc67dbfc4b2defc519d4641e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.12/atlas-linux-aarch64.tar.gz"
      sha256 "9c710cb14be3ae0eaa252f562fbe71b53e7e52e45aea6777e0b598b38b3ab075"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.12/atlas-linux-x86_64.tar.gz"
      sha256 "722c6ab64845bacba557d11162a39076d15ea1d66f0a9256f60a5b5b55654d0c"
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
