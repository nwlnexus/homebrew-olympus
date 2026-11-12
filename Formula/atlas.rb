class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.60.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.60.0/atlas-darwin-aarch64.tar.gz"
      sha256 "efb4b2b86939dfc601018c10a065b9c1b7e29ebc3512171760a14e3d4bebce9d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.60.0/atlas-darwin-x86_64.tar.gz"
      sha256 "ede5611bfd8330c42d1d90db36da8d575b10a891ce46033209defa6bbad2805a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.60.0/atlas-linux-aarch64.tar.gz"
      sha256 "92c4ab3f3799ef174a586dffc81ed95aef4e9167cc7424e1a8888d6410695d24"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.60.0/atlas-linux-x86_64.tar.gz"
      sha256 "0d841e04f508a1544fb1da164a5413d7e5581761632a750b7747d23762fa5c94"
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
