class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.1/atlas-darwin-aarch64.tar.gz"
      sha256 "53593dc9c9ec366ce830a501d43267c171a7fda5e962462c82d8f42eb05b4bc3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.1/atlas-darwin-x86_64.tar.gz"
      sha256 "5efb1dff8a923f45bbbd4f82de3eb06bf12a8e13505b96f7a009b08cd4dd07d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.1/atlas-linux-aarch64.tar.gz"
      sha256 "10e4a72369d42289744d0b5a92039b44237584bb049d136870e9c61e5a928b2e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.1/atlas-linux-x86_64.tar.gz"
      sha256 "d3c885a626e432659ade7ac36d0cb849b8f57c88472f9371eb6ee2bcac382fc5"
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
