class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.114.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f692327d3e3643298c1104e9c193d50b2940ec4960d97408c138f0ebdbf89835"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d4c31f5c98477c7420c19c67cc5145a6d1571589b0dc8711e636e25f49b3c8bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.0/atlas-linux-aarch64.tar.gz"
      sha256 "e388ffe07971136ecb7fdccaa3c5a50b13f73a5be37649e6d1877535fdf2cca0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.0/atlas-linux-x86_64.tar.gz"
      sha256 "983878241788affcdfad4b53f74cded06fd749ac9cefacc01cd1ee20383b52aa"
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
