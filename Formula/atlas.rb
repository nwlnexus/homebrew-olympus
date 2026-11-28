class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.119.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.2/atlas-darwin-aarch64.tar.gz"
      sha256 "33c22a724b24a8bf87940d721533d0ff2eec33f9ba12b9aa900018fdddde3f99"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.2/atlas-darwin-x86_64.tar.gz"
      sha256 "934732314588c15e7a115eea5e53e999668614f491d6c9d23fb62f3bffd5b8c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.2/atlas-linux-aarch64.tar.gz"
      sha256 "4008eb4ca0b2f2a477c9e3a76b198d7609352f2c9324592a828d24b8343ae1f4"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.2/atlas-linux-x86_64.tar.gz"
      sha256 "4e2518e6bc7a0b7ad738c2c71ddd5dbf556f9f52a3b5c37f2bab9ea645c7aa41"
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
