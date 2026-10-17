class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.20.0/atlas-darwin-aarch64.tar.gz"
      sha256 "450bbac41727d6c48eda93918d0c9b34513240e5e4e2a124e3eb49a7cb80287d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.20.0/atlas-darwin-x86_64.tar.gz"
      sha256 "b69cfce5fddb4a9c2bf7f6af0bd553e6fd5de926d2f998f50adfce613b778b0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.20.0/atlas-linux-aarch64.tar.gz"
      sha256 "dd583dcb1b1c02a020f71f753da32d41438c08a23fbb518f5fe83c16a4d8d366"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.20.0/atlas-linux-x86_64.tar.gz"
      sha256 "0c7f371e74bfb522928e4c04b9d68124ae32a5860bb35194b1866c03f2aafc8d"
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
