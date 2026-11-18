class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.72.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.0/atlas-darwin-aarch64.tar.gz"
      sha256 "b5bc60e3eea629048d5d424fed593b00e1602e8934aed600e244f72bf26f0c4c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8b2f27d0c8b0a4a10649cdcb73033c797bb4276dba577c65d00f5020e972e762"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.0/atlas-linux-aarch64.tar.gz"
      sha256 "2a89a0e06029611e4be38b4281033051ac4b0b60f93c0724bdc78cba8617afb1"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.0/atlas-linux-x86_64.tar.gz"
      sha256 "397e23e44d514394eaaf28a96787de6b5c8c4e874bfa780d3febe9bd9955fed3"
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
