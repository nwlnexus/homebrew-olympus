class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f92f85b2dcde7db8561c3a94715213174e9b4072df252357cf0af6171d0d0b8e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-darwin-x86_64.tar.gz"
      sha256 "9e3d061d0e70613a4afbc72fb8557f24dd6edb14214c02648d85b527b10ae03c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-linux-aarch64.tar.gz"
      sha256 "cd36c5f8a20fe7d559bce651b4ef4fde5f7771df2374b75e405d91fb64240356"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-linux-x86_64.tar.gz"
      sha256 "902615e8bac9c62d14b8414f3d2018cae8a5dacf6d78bee9c145d9d76adf3f87"
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
