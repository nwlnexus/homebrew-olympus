class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.91.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.91.0/atlas-darwin-aarch64.tar.gz"
      sha256 "2ef47bf31f1d41fac18ae1fc39cefa4014f93987853c9dd4c2a442db86729256"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.91.0/atlas-darwin-x86_64.tar.gz"
      sha256 "6b20f35d0a520280557958d873ad2a38ca900a4bbf753a717a1cdff155c69acd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.91.0/atlas-linux-aarch64.tar.gz"
      sha256 "a7be4d00a91d91f7ae9fe257a1fccc09de2b22e14923a8ecfa294093f66dc4e5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.91.0/atlas-linux-x86_64.tar.gz"
      sha256 "424ca39e733034dc32de0d6cee68238e4efc98db8d677e80ad2763bb4e2d9a55"
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
