class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.8.0/atlas-darwin-aarch64.tar.gz"
      sha256 "c3f2a065eaabdc96bff6d34961a15cc21f7bcb2e11c16cfb4341b62136068b7a"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.8.0/atlas-darwin-x86_64.tar.gz"
      sha256 "525292346d28556fe4b24102910deaec5ce44a85cd91204e1a60a1bf6b800fa3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.8.0/atlas-linux-aarch64.tar.gz"
      sha256 "445009f280dca76fbea09b67facf2d02cbd32e0bb0b4a539158960bcff3e0312"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.8.0/atlas-linux-x86_64.tar.gz"
      sha256 "67c3f40ba4d4f4ca54cd1fa73d7097a50cf597a559ecb912e8ab45c07acac6a7"
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
