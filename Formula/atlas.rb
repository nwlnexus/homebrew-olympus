class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.83.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.83.0/atlas-darwin-aarch64.tar.gz"
      sha256 "11ac9664197d200654a4f8dc6cea7d2480bd22f4b88cfa0349c8682f6baf98b6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.83.0/atlas-darwin-x86_64.tar.gz"
      sha256 "fc165d6dcd0a88d8d7b003cdb46d11bc109274ec276e0eedbf7ed9e6e796c66f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.83.0/atlas-linux-aarch64.tar.gz"
      sha256 "e30567d7363387ac7a1d96a89d38c934027462f48c86486d2cf19d4917f77f0c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.83.0/atlas-linux-x86_64.tar.gz"
      sha256 "ed58c0b9b948b63ac23e7b65a19a32b61a9b24fe20973f28dd91c570f766e7c5"
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
