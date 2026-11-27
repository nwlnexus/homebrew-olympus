class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.117.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.1/atlas-darwin-aarch64.tar.gz"
      sha256 "5733bd227b4c861e0c3e49452d2946c0904659cca350bba8d9d92b59bc736319"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.1/atlas-darwin-x86_64.tar.gz"
      sha256 "913be6b5e20fe0cf700f4fc6d98e009eb9813fef0afbf0eef4ae1d1a49479a49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.1/atlas-linux-aarch64.tar.gz"
      sha256 "ad91b5963e87d5ea17faefaa5bd3644b48c3579e0ef76e19dbf09f69658c2e3c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.1/atlas-linux-x86_64.tar.gz"
      sha256 "50131043356cf9d29a6243750323ce8c7b29984bd9777960a901fbac4b8cc506"
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
