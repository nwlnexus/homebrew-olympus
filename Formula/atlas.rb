class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-darwin-aarch64.tar.gz"
      sha256 "0307675f1931c073b3fe9c4cce11faee947faf44c75fc1edad433e506d1a16bc"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-darwin-x86_64.tar.gz"
      sha256 "eca353946cebfdfc266849d05b708abd5d0bfee175d60d6fc9e0eb41778e4893"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-linux-aarch64.tar.gz"
      sha256 "24c1fdaf541af6da7573c943e50bbb0c078db57a97091780891d42e780623392"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-linux-x86_64.tar.gz"
      sha256 "34a6add0d88d2d08e01251066b69c28338da78276d5f6ce9ffa9e2866986a093"
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
