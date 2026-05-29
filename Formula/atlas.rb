class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.8/atlas-darwin-aarch64.tar.gz"
      sha256 "dabf875a10067d7b4ec967f4c1ff748a19dd22e812a7de9560a21aef1a057e2e"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.8/atlas-darwin-x86_64.tar.gz"
      sha256 "4d854c8716315a7216bfa6dce71217de1386c2b7c0f5eb9c019776e0ed38a37d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.8/atlas-linux-aarch64.tar.gz"
      sha256 "b893b6bad6d5dc0ef3513cd2c0d13ddc76794f2a552f57a54389f48fcf492096"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.8/atlas-linux-x86_64.tar.gz"
      sha256 "cc137a0bceb1cb300a4cb622c9111f3f43154f802201d0fa4788de1942a99530"
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
