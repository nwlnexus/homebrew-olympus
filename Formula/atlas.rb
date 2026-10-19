class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.32.0/atlas-darwin-aarch64.tar.gz"
      sha256 "3684279c103c00387356eeb5fa723905e9cb1e855c0a42e36d14b041e7a72919"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.32.0/atlas-darwin-x86_64.tar.gz"
      sha256 "526fe1a9b31890cedef9645f6e122cab1d8af23123d876e6e96a4e21daeb8196"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.32.0/atlas-linux-aarch64.tar.gz"
      sha256 "b8590a8aae5f4a27c5c9d23d17fa7c9cde5071c74193fd9f077e84acbe117cb3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.32.0/atlas-linux-x86_64.tar.gz"
      sha256 "2fec09c3243f8900e4ab5476a017fb765163f324ee3a9e8cfaa009343b5efbf5"
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
