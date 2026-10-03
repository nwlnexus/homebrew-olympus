class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.16.1/atlas-darwin-aarch64.tar.gz"
      sha256 "d307fa4c6bd9d1d4afc32ec367591f29b66f019dc0b6c85d42aaca9399ccb5dc"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.16.1/atlas-darwin-x86_64.tar.gz"
      sha256 "9ee312f2949019e6d4e76b9ab78529a3a74e523ecbe15290ae5e14b0897eb62d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.16.1/atlas-linux-aarch64.tar.gz"
      sha256 "83f905cb65ca79c50688196b04cc6ed62744bedf4b33ce13bf5c711a279aa35b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.16.1/atlas-linux-x86_64.tar.gz"
      sha256 "081156c2ff9cec2da702a3934828e457b1f9e08f1590711613a0c5b601f4c56d"
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
