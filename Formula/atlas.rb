class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.102.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.102.0/atlas-darwin-aarch64.tar.gz"
      sha256 "4b8db0de0dd890328857a04d0f6592af1a493e4c754a36fa8b8c35e74004a7e0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.102.0/atlas-darwin-x86_64.tar.gz"
      sha256 "a9d5d408739d22615fa9bc86b3fb464e7d65e151e420285921f1d3d43dd05ecb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.102.0/atlas-linux-aarch64.tar.gz"
      sha256 "9fd4ce3f04d8b3547035253ec3e8218eec0a0ca00e4a7d9914f5c6cad9293166"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.102.0/atlas-linux-x86_64.tar.gz"
      sha256 "6ccb994a4adbf54a595be4a7006b1616068e6d1f6db4ba1706575dc31afbad55"
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
