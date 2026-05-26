class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.2/atlas-darwin-aarch64.tar.gz"
      sha256 "3fa8bec8e0341b507302aec20a0c146eb32ab7f51653c57498a6d0c949bf4bf2"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.2/atlas-darwin-x86_64.tar.gz"
      sha256 "6575c8ba638b36296b6141c8a20855c1740c82167f6e791069f5a2ddbdf65e68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.2/atlas-linux-aarch64.tar.gz"
      sha256 "52a7640f4740a8dcacb16b809a15a1a9c1bfb48dc2e8bd1b64ee1bee5bde02d6"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.2/atlas-linux-x86_64.tar.gz"
      sha256 "2f3b3783223582184138a408d552ee204bffd0276975e9992a526ed9f3d4aead"
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
