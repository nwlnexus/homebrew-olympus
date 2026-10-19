class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.0/atlas-darwin-aarch64.tar.gz"
      sha256 "2d9cd0d5e3470e6711c919f744b9bc6d62a04c21754f935a2d9920350a05bac8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.0/atlas-darwin-x86_64.tar.gz"
      sha256 "52d05564db2ef05c9991efad2cb515bb0612c16fdc6037372361fa3aa6f23de6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.0/atlas-linux-aarch64.tar.gz"
      sha256 "a87d50f3de7d9558cf4bcbe0913dc5b8d305cc91320949e46a361956a726fe09"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.22.0/atlas-linux-x86_64.tar.gz"
      sha256 "37f9598b0ceaa8ee8e2dbd01b908faa218ee233f3565044dd4ed5e9204eb9359"
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
