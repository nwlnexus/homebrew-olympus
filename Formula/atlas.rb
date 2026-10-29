class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.54.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.54.0/atlas-darwin-aarch64.tar.gz"
      sha256 "68dc2c61382c82da3ea9de1c8de9c3e80dc3ad873227e7c72ea5158165a8c6d2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.54.0/atlas-darwin-x86_64.tar.gz"
      sha256 "7a64246b45bf8d5d60b657ab72009848279d63abfadbd681c00d206834c77e4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.54.0/atlas-linux-aarch64.tar.gz"
      sha256 "67122bb1146c181b015a218c8aafe6eb2fa0526341e54ec91efcd27138e74be0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.54.0/atlas-linux-x86_64.tar.gz"
      sha256 "c0e4e43aa323272415993934f5ca7d8d91783b03db53f4789630a36754afc7b9"
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
