class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.66.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f5ebf33d8e06382f8cd503ebc0e2f1e676eb57a99644b365cdc3782c428e5294"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.0/atlas-darwin-x86_64.tar.gz"
      sha256 "42da7e3b82e5d0ccfe520cef8fd8f37a21ccb297fc3f5480e1c23bd152954a3e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.0/atlas-linux-aarch64.tar.gz"
      sha256 "ebc58384053933842841ff2ead9ecf60981299749395b1606745432200fc603e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.0/atlas-linux-x86_64.tar.gz"
      sha256 "d22856b1cfbdd903f00ceb149a3dd483467055a0fd3bb31fe0cad87bd6b4a485"
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
