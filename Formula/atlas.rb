class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.43.0/atlas-darwin-aarch64.tar.gz"
      sha256 "0e9506d5692aa61666b103baab2d5da453d7c0d2dedb3f972197a00fb49fa98d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.43.0/atlas-darwin-x86_64.tar.gz"
      sha256 "605a997de5a064d94eaa0ae8d91f11f39fa767719c6807ee15c2e15d3fac04f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.43.0/atlas-linux-aarch64.tar.gz"
      sha256 "6bb17bf7d86dc268ab358065c3e57f9d52dd1e981d214682805c3c0f514b76b0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.43.0/atlas-linux-x86_64.tar.gz"
      sha256 "ed6bbfe6837e4a0680a775a0c193818192eeeddb87a773cf1999d8bf37f22933"
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
