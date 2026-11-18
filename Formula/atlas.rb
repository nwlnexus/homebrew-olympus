class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.66.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.1/atlas-darwin-aarch64.tar.gz"
      sha256 "6bee747e88a24808b32efa17baebe7d70af5ea48fbec796ea27389c5e7638599"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.1/atlas-darwin-x86_64.tar.gz"
      sha256 "2200c876612a34ae8e5aa41619d3a504e4d8a877047f26263c4e5a5278dfc59f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.1/atlas-linux-aarch64.tar.gz"
      sha256 "39c3ce1740903f7926667c94dfde14bf02e9988825e0418b9d01177f06fb9d7a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.66.1/atlas-linux-x86_64.tar.gz"
      sha256 "69f75748c9896f3b6682e228b346443de01d48c471a05ad38705ecb794c1abe3"
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
