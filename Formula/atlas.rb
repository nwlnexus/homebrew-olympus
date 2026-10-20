class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.35.0/atlas-darwin-aarch64.tar.gz"
      sha256 "a138f6605b90b68f8d0adedecbe82150587c29bb621b3cf2385f8fbb054c728c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.35.0/atlas-darwin-x86_64.tar.gz"
      sha256 "c434b05ff254bbc49ef620daae19bb93657bd490604a35c1ba6d3efe9b75c126"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.35.0/atlas-linux-aarch64.tar.gz"
      sha256 "3d3a526272570684caab95b25f863f37c57dea13ed01a6c65350d97431c2db52"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.35.0/atlas-linux-x86_64.tar.gz"
      sha256 "530aaa4467c8c9062bf515be7347b3d2536acc6a13d5601c56bf9575bad3c262"
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
