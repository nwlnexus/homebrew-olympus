class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.101.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.101.0/atlas-darwin-aarch64.tar.gz"
      sha256 "2cb66a7efacabd2c8801e34872849cbb426f6076a3b9f51677fba21014897cae"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.101.0/atlas-darwin-x86_64.tar.gz"
      sha256 "01226f1d50d18aa377ec72772b2aab1d633837dd1529aa28adaacf360bc31304"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.101.0/atlas-linux-aarch64.tar.gz"
      sha256 "048d7deb0a2888d7a98ff04320e201ea938390cae9d6265e8b9b5669fac8969b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.101.0/atlas-linux-x86_64.tar.gz"
      sha256 "9613b4d251d83cfb3d55d32d0eb4066035cf753682c9ad3ed73603504712b894"
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
