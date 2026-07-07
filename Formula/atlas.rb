class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.1/atlas-darwin-aarch64.tar.gz"
      sha256 "70d3346f6d8d76d1a8f1eac9389d029d77592d9b1535058ff1f331f1f7975e6e"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.1/atlas-darwin-x86_64.tar.gz"
      sha256 "6f491537e38da07768980795e9b1702b8a51a3e32aba32c58b6816e01339afa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.1/atlas-linux-aarch64.tar.gz"
      sha256 "5cd3c3cce8d2969c2ddc442d33de97e79f5a770434b2c6e08883ec2e750677a4"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.1/atlas-linux-x86_64.tar.gz"
      sha256 "ec11c20d85ebc0b545fbc646b6558b8e957f6f3645e85bf41b39d8886382af37"
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
