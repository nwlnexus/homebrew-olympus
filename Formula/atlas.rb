class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.33.0/atlas-darwin-aarch64.tar.gz"
      sha256 "62d08519a4ecf41fca5d73a74b3f27bd3794b3f15575182beadfcb3ffc6df2f1"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.33.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1def3d050861e1a72912909d36cd4645d3c6634d9080b213a904bdfe1310dca7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.33.0/atlas-linux-aarch64.tar.gz"
      sha256 "b04b9a80e3664ab8b83aa0ff5267c3f3ae61d2a69bca6149fc83ff4b1bd4c5cf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.33.0/atlas-linux-x86_64.tar.gz"
      sha256 "8f04bb0db5ddb4cad0ec3014921757f73382268996ed581b53c0c54ff7689d27"
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
