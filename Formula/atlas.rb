class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.1/atlas-darwin-aarch64.tar.gz"
      sha256 "882dcffaba2122e7b1d7f2d73b04beb94fa408db391d8f6b8ee4245f58db1145"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.1/atlas-darwin-x86_64.tar.gz"
      sha256 "952f3faf1d62931e6d399ab89a9dc708fabb4675edf6ac177922dd7d025a81d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.1/atlas-linux-aarch64.tar.gz"
      sha256 "b26638a104abee0eab4d9198dddd395b47ceca85984ea53b4a641a9f01cd97c0"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.1/atlas-linux-x86_64.tar.gz"
      sha256 "c9567d97247ef7781e9979d0f800fc9a008aff8669cf2ff88c5a7b1e3e89d149"
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
