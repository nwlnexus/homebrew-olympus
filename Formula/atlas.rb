class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.119.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.1/atlas-darwin-aarch64.tar.gz"
      sha256 "7596bc8dc005ccc05773d27eca6942fc62a24bc6f5bb8763735833c18b81b9a8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.1/atlas-darwin-x86_64.tar.gz"
      sha256 "94f38e5d72a851de096c596f70369d84caef2d4205ad493542efbd36d004fcae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.1/atlas-linux-aarch64.tar.gz"
      sha256 "c9f253fddfbd852c4ef3fba45836bd60598b1fadfd1585792857942f0328bb22"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.1/atlas-linux-x86_64.tar.gz"
      sha256 "5cbdabfce48d45ecd81bbb589dfc9944a509c63c57426a66233b61c6d6d12100"
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
