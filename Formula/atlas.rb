class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.58.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.58.0/atlas-darwin-aarch64.tar.gz"
      sha256 "a185a353ee38d74983c57c124d5e8bad0b30b0b718f2f6d8e74dc7e3fe0a652a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.58.0/atlas-darwin-x86_64.tar.gz"
      sha256 "ff8b8dc8d7bc971a1bb79d14c2f615ba577093f26f290efa22a57b24ca33d2ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.58.0/atlas-linux-aarch64.tar.gz"
      sha256 "0a00a6c1e868032e546a31f9e02d9e9ac24660891934a2361ccc012da54c02db"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.58.0/atlas-linux-x86_64.tar.gz"
      sha256 "b88ed47f8e23ee1bf10119f4dec73c1c7120f599d480d8b26467ab755c69b892"
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
