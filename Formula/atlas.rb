class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.76.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.76.0/atlas-darwin-aarch64.tar.gz"
      sha256 "98c34648a7f9575dfa33b578d5ecfa22c9bbc0dbf1f69f6efe0cad4ff123178d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.76.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1a1511abd9ae8f7e24a4c2fa6f0883cead73ecf5ee7f379baec208e360ffab8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.76.0/atlas-linux-aarch64.tar.gz"
      sha256 "01506ff0a2827cbed9a323d55c8d74f83abe90130fe749187ed5d5cbe0881573"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.76.0/atlas-linux-x86_64.tar.gz"
      sha256 "16862002441a84e7b863a0372f88770cc64a9d8bb027b2eded43427f575d8999"
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
