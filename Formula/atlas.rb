class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.110.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.110.0/atlas-darwin-aarch64.tar.gz"
      sha256 "84eccacf85ae7cb59cf812370cd3fbdbed19ba52beaeb3c257d3e98c8172c313"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.110.0/atlas-darwin-x86_64.tar.gz"
      sha256 "faf9fc8eab705f387ec0fd123c3cb7b3abe99d94e37a59c5e205d6ddb7264b01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.110.0/atlas-linux-aarch64.tar.gz"
      sha256 "39a1d444b68654e46526fb9da6afa65ffa66c43e0ee384cc4a1d6017daaa66e6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.110.0/atlas-linux-x86_64.tar.gz"
      sha256 "1ea4f51b6df0968d8d26213994e2d776a205876c2f21a186163dae212ff1252d"
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
