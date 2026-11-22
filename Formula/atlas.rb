class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.97.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.1/atlas-darwin-aarch64.tar.gz"
      sha256 "60847811510f452c84ba442737f3442ea3f5c7f0c07aa22e20b797224b949cca"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.1/atlas-darwin-x86_64.tar.gz"
      sha256 "71e7d2bc63533130e9c44b55161b6a74bc084c725682fad435eac29b1aaf1211"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.1/atlas-linux-aarch64.tar.gz"
      sha256 "82c7d804df59f4e51fda2c650a5503dda77da6d6d26e645f491f942ae9b6c5b5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.1/atlas-linux-x86_64.tar.gz"
      sha256 "74752e520304934cb76f8f92e5f002a1a1d11351bda10d1af054f15ece4cad0b"
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
