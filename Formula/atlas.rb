class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.112.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.112.0/atlas-darwin-aarch64.tar.gz"
      sha256 "19c3d313fd3f7bb789c53a82f58b581a3326d46b3e5d3f72bb1840a93032f817"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.112.0/atlas-darwin-x86_64.tar.gz"
      sha256 "7c527c885eaa520c8811dd583d5cf689c9c692b0bd58dd92370d88930214fa74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.112.0/atlas-linux-aarch64.tar.gz"
      sha256 "5f10117ae58d2cd06af468621e3b89059c8bf8811f19c9dedd778b75b27c5bb5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.112.0/atlas-linux-x86_64.tar.gz"
      sha256 "0597db4aa7b182c9b7ff2f906beaf5e9d41e3c06585fd7b9daef2a5dc3b71ede"
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
