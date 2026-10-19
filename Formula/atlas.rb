class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.24.0/atlas-darwin-aarch64.tar.gz"
      sha256 "b47c9e7297bda43d6ded41c89d15fca55c61df67af957c02b4d3e97931fd1e58"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.24.0/atlas-darwin-x86_64.tar.gz"
      sha256 "fbcbcdd3c572af705abab9d553c625e3f8601b4d43fcbd1040c081ab3e64b3d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.24.0/atlas-linux-aarch64.tar.gz"
      sha256 "d4a29a879363073a0fccd47589abf526366e03a839ad2bed2ddff1c226f37f5e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.24.0/atlas-linux-x86_64.tar.gz"
      sha256 "3446cf7690bb2eb04cc0ba6d9bf08f303405006d9a12ff06cf28bbb2441ae281"
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
