class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.104.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.0/atlas-darwin-aarch64.tar.gz"
      sha256 "91c0f667a56a0f7db7594d7bb4bf31a7095a5d7a9ea54cd4f92c31d96d5814d2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.0/atlas-darwin-x86_64.tar.gz"
      sha256 "155016104d19f63b0288fe55ee92a767459c3b2326ffff2745724dfd16504eb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.0/atlas-linux-aarch64.tar.gz"
      sha256 "3d74005af8ef84e425cc5ed8650b937b24a3de1ee00c53c68b38f75b262c33b5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.104.0/atlas-linux-x86_64.tar.gz"
      sha256 "9864a53b947a86e634a9beab52818baa42628bc1f80b23768a84db6a301ada47"
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
