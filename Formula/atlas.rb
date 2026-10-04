class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.0/atlas-darwin-aarch64.tar.gz"
      sha256 "bc539529e93c56f49d0e0b77cd55bb348ff1fe9f14b0e75f690ced58b2bbbc1d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.0/atlas-darwin-x86_64.tar.gz"
      sha256 "0d799e2c148b5ffef34ed0a843993e99ae106144b04907db918f53d960e3217c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.0/atlas-linux-aarch64.tar.gz"
      sha256 "caa3ae27c5b494b50d4c5d62a373c057eb55b5723b4332dc22b95bab810b9cfb"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.0/atlas-linux-x86_64.tar.gz"
      sha256 "7f370b77244c00566b367010e2b91ad9f4cc14b9e7e2c0b6fb1c6df379a25d2d"
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
