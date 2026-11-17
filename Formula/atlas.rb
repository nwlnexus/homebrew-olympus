class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.62.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.1/atlas-darwin-aarch64.tar.gz"
      sha256 "8c43f0172faf7893e352575cc113223a60e7940cd9b5b4dd1a0e0671a6c871ec"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.1/atlas-darwin-x86_64.tar.gz"
      sha256 "44241f0c03bdaa1f1afd75d9c9788cb7c8066731b79e8ed272e04b039baa92d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.1/atlas-linux-aarch64.tar.gz"
      sha256 "3cea249c73c0f0b75ae53181972e3c7a0cbd296a0bc7c9223000dc8f3729c741"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.1/atlas-linux-x86_64.tar.gz"
      sha256 "f0dc67a8121da34a3277d0cde58bf81f909fa1c4213de2951df6498c8e0f6536"
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
