class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.106.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.106.0/atlas-darwin-aarch64.tar.gz"
      sha256 "55e35a07c9dece68429f3f9bfb9c449840833bfda59fb132ffa8164b74020790"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.106.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8d289d595f5ff867ec9164593628e918bdfc746edada9de9b3a82f02efe7ab3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.106.0/atlas-linux-aarch64.tar.gz"
      sha256 "dcf4be35bd70fdf2c9cd0e5502e0c422cc5e06ebbf83d039f35abb01121fe9b7"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.106.0/atlas-linux-x86_64.tar.gz"
      sha256 "4a29a6f0e9646637b7c5da6e677308fa695bfd4cb95c57a6596b1a0020191cd3"
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
