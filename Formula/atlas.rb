class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.85.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.85.0/atlas-darwin-aarch64.tar.gz"
      sha256 "3a89e744f0e87ccaa82d7fb6f7b962f7e1902e400355b63c2d359e0766150b3e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.85.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8606a7a9b847c3aa36d566b49f814810d0604ddc4adbbdbdd804c4e6f6f8cdc9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.85.0/atlas-linux-aarch64.tar.gz"
      sha256 "41620a723f0b51786cd15391ee32aafbb5c15a5ce18ce852b61e758cf4d10367"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.85.0/atlas-linux-x86_64.tar.gz"
      sha256 "b3a926fc5949c73934b7d8207c98204123a5aa952589fdc7e7dbc5894be8b471"
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
