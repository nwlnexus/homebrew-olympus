class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.67.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.67.0/atlas-darwin-aarch64.tar.gz"
      sha256 "cbf9efd4800b74d39ae3c4f134064763e2cde986a8ed3873b0a1fe4c164413b3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.67.0/atlas-darwin-x86_64.tar.gz"
      sha256 "ea16578bd734883925bca3da7b6d60d1992670ac37908e903482ed6137543453"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.67.0/atlas-linux-aarch64.tar.gz"
      sha256 "493ec8508ea91f399f49b2d2ae5745e55418b7c7c8d0a187e8294ac3da5c2055"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.67.0/atlas-linux-x86_64.tar.gz"
      sha256 "753cd56f49b4f415bb3dd4fcb524ac389c304316eedf9648d6478e7345b95fbc"
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
