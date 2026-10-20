class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.38.0/atlas-darwin-aarch64.tar.gz"
      sha256 "fb9c84f1f03dc41e8c6e603be9793b153fe4228c7ca97986b79514a4fdd89897"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.38.0/atlas-darwin-x86_64.tar.gz"
      sha256 "b730f2a8ac2afa84a78d3d6e1d3b411cec648103f15b7147adba0ad1aaf3acf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.38.0/atlas-linux-aarch64.tar.gz"
      sha256 "8cf466f46a59a025ce82c088cc7ef642eff92f88f22a1722023fb995d0300230"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.38.0/atlas-linux-x86_64.tar.gz"
      sha256 "c64b7625e9c6bcafaaee48518f82251f48902fc1f039f1100dd7d31a05c4cbf7"
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
