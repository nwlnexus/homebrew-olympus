class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.94.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.94.0/atlas-darwin-aarch64.tar.gz"
      sha256 "254079e40992870cca3b32d5caacff037c265473b928fce805400086bc114777"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.94.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1abcfca8f499401ffc3b6d61581e2ffaada732c8930ad3d0dfcba353ba4e66b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.94.0/atlas-linux-aarch64.tar.gz"
      sha256 "4c361bc9ba45ec1c6b09dd4aadc8212ea02168ca5561554f6cab561b37506817"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.94.0/atlas-linux-x86_64.tar.gz"
      sha256 "ce641d443851e188a935abd7d8de00cdc87a993c2993314d230243383a6debc2"
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
