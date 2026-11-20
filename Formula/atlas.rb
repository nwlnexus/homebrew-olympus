class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.93.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.1/atlas-darwin-aarch64.tar.gz"
      sha256 "5acf8cf56a964cfe376e95be1df3cea4fde3b85e9c139d7b3b9b6c6669135fdf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.1/atlas-darwin-x86_64.tar.gz"
      sha256 "b4863fcb06139d7333673b30894494488cfdbf444de299e31ff2dbad78f9f78f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.1/atlas-linux-aarch64.tar.gz"
      sha256 "fcd17111fe1772318eb828ad4aa0fe442dfe89a9bd086a74e700fe305a2a836d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.1/atlas-linux-x86_64.tar.gz"
      sha256 "46f9e2fd340ad0c7f823a4dc9362278e2866c8960434e8ee1d7168730003fc1b"
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
