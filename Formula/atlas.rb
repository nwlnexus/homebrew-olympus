class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.1/atlas-darwin-aarch64.tar.gz"
      sha256 "efaa843234bdb7885b29bfa41bdadf4b7150ce90b4a3d1265fc1429714fb2f23"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.1/atlas-darwin-x86_64.tar.gz"
      sha256 "15a61cff56ec6fa5d953aa264865ff862a0e6840258408474a052cb29c87f786"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.1/atlas-linux-aarch64.tar.gz"
      sha256 "6b681850c486dd941cd2709637aac8a256c8acf6b5361f2ce4ed115bf1b82cf9"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.1/atlas-linux-x86_64.tar.gz"
      sha256 "6526d8c4a08b63624576aa6a7e1669b04d9395c4b8cbc4be2e6f5c9cc6ac09ec"
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
