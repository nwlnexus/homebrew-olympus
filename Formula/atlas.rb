class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.63.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.0/atlas-darwin-aarch64.tar.gz"
      sha256 "03cbf81e6a23547c603ad37bf1306b69e56396d4f7e9716f558d6decbc59d85f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.0/atlas-darwin-x86_64.tar.gz"
      sha256 "76329a7e698690ea1ac0c7b0984e12121879673de7761f5745b26b2e23b918ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.0/atlas-linux-aarch64.tar.gz"
      sha256 "76d207cc6c11e80ab51c62d741a8987c2e5f59874bbaa06302d6b11e09928610"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.0/atlas-linux-x86_64.tar.gz"
      sha256 "211f7c76bf4a41b105d4227b9c033cd02607ba6dfc38e19c16f7a5042c1e8b9a"
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
