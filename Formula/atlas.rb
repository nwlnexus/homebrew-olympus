class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.53.0/atlas-darwin-aarch64.tar.gz"
      sha256 "1c12d918477cbddd2fefbf1cd2ef3b96994a1e5c94becb228e53d86be5659e6b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.53.0/atlas-darwin-x86_64.tar.gz"
      sha256 "e6d0bcd92655643afa972a549eb00cda293deaa13ae3a933dbcc9a39286eb000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.53.0/atlas-linux-aarch64.tar.gz"
      sha256 "94b60eff6307bb6239d1c7758796410a560591eeb7ccd298ebf14edc9c8804d8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.53.0/atlas-linux-x86_64.tar.gz"
      sha256 "ee759097c44d685e4641fe209dea5bd379fee250065121f0413f08c6e35c901e"
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
