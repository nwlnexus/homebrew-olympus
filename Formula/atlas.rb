class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.0/atlas-darwin-aarch64.tar.gz"
      sha256 "1113f1d8012ffe9e06ec8af1309352d4d71d2ea81cbef096a2c6205cb5c9c243"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8562c5739305ff62ffc0fda7a7ca075d58b2f38af893645cf1ceda242271733c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.0/atlas-linux-aarch64.tar.gz"
      sha256 "1f7788600393a57aef8ab46da6db1597b93b2928200a43648aa040ffb9e7071e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.44.0/atlas-linux-x86_64.tar.gz"
      sha256 "301e88628a41e4635af1a762fc06b64cc2a902f37eb7bcfcf60d09b1c1cfd24a"
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
