class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.115.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.0/atlas-darwin-aarch64.tar.gz"
      sha256 "1445a4c2f1cf814094428e6e051e5ca74670426f742d3f5b8834bf470edf0e16"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.0/atlas-darwin-x86_64.tar.gz"
      sha256 "f0e3a7e7d6b2adf3e1be6222fe5d061cc7bc9fede03c452245fb299ce704168a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.0/atlas-linux-aarch64.tar.gz"
      sha256 "55c2278cf5ad3054b6172a0308326e4a2375cdd46dc181d524c3b19a9db06036"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.0/atlas-linux-x86_64.tar.gz"
      sha256 "321a67e2f3b713ead3a63fee829a63b9dcaa39595f818433b14927a6596d8ad7"
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
