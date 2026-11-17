class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.62.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.0/atlas-darwin-aarch64.tar.gz"
      sha256 "ae735bb600ba0d97bb31915fccee73fd3641a82ba3b2ebdd6c4e9f77be4deebb"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.0/atlas-darwin-x86_64.tar.gz"
      sha256 "a83182d2a9e4dd616633307f6501fb0491bc703f372b80a8b79b3151f3aec473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.0/atlas-linux-aarch64.tar.gz"
      sha256 "784e94d22bd3b1c52bb386c9c418ee9ba416473bfac2866dc0c0c71bcf82f899"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.62.0/atlas-linux-x86_64.tar.gz"
      sha256 "fde7da085bcfe7b1679766af4893dcdea0f0cef62d8287b3ccfb12da2ee21078"
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
