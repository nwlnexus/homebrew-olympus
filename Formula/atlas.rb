class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.84.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.84.0/atlas-darwin-aarch64.tar.gz"
      sha256 "c930c551a3daa506bfda892c1ab7be2bb72a4e33ede6424a52a9c0aa5b4d5a6b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.84.0/atlas-darwin-x86_64.tar.gz"
      sha256 "091e1fa6ca5bac290b43bc966b13e9127cbb6e1c4d811b745095a8374526fb79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.84.0/atlas-linux-aarch64.tar.gz"
      sha256 "2b863f437747ccbeedb2897aef262534428e876cd40336a6fce5cc289cb8a1e6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.84.0/atlas-linux-x86_64.tar.gz"
      sha256 "f45d6982443703e3066dede4139731f854a21a3c29d8778aa6fc204cd3aa1b30"
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
