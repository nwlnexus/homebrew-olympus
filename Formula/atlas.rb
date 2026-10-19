class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.25.0/atlas-darwin-aarch64.tar.gz"
      sha256 "833e7418f56c7928a2c403aa57e7c8f0a5dc8984f54c7e3ddfb720a7d05fafbe"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.25.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d76bd07d41b6dbf8d2a36556b601a1cff5ae61edb03550ab7fd0dfb6c6472da9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.25.0/atlas-linux-aarch64.tar.gz"
      sha256 "c83cbc7815a1f1bcc9edc8f794fb828ba206944a87c8bf6969546da5e436b900"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.25.0/atlas-linux-x86_64.tar.gz"
      sha256 "5d2f8c45ca2b440b92b8c54a596eb87982288456d14655d79a86537b2d46c82f"
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
