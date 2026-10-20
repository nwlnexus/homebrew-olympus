class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.36.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.1/atlas-darwin-aarch64.tar.gz"
      sha256 "462a793da5097039fad60621b7d7e6e70dba4b6ebea44fb1214868f6754f0397"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.1/atlas-darwin-x86_64.tar.gz"
      sha256 "1769930a5810a188041201e9e44a856fe34d34f6f0f2715df3a6e61a12ebc038"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.1/atlas-linux-aarch64.tar.gz"
      sha256 "05a78bded4ec98229bb637fdac26a9f42d14bd3ce06582eb57579f180baab671"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.1/atlas-linux-x86_64.tar.gz"
      sha256 "67c277fb3fdc03bd487f227db02407fffb5dfcab23cde153f20228afd02bbffc"
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
