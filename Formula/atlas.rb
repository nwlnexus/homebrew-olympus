class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.9.0/atlas-darwin-aarch64.tar.gz"
      sha256 "af66e8e41c24e1dcf64b05bca25cae64f3b47a29f3a74c7c78fdcf5238e80574"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.9.0/atlas-darwin-x86_64.tar.gz"
      sha256 "9c1f438d748167f188408a4ca386ebe113f64266359652d1788b28d7ac768a3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.9.0/atlas-linux-aarch64.tar.gz"
      sha256 "d0f45be6b7e955d85f5863c2f526b0cd1f3d0666ed00fbda96ba1deca2375a22"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.9.0/atlas-linux-x86_64.tar.gz"
      sha256 "b78ed446cf65e858a0d37c3a78f95bf5c82eecb29d096d25ee4dba1392b3f17b"
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
