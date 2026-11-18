class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.71.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.71.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f2aa0602f7f0f31bd29f0abb497c0852affe0430e2b37058f31f614cc9dbb74f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.71.0/atlas-darwin-x86_64.tar.gz"
      sha256 "5167c3479f98bfd5b42e32ba57fd0de830464eb00ee61c9035de83446f65358d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.71.0/atlas-linux-aarch64.tar.gz"
      sha256 "30747acac2df17f3720427932a42b75faa7c48ef1212bc1507152e63f759ce93"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.71.0/atlas-linux-x86_64.tar.gz"
      sha256 "bbe44636a70ccc83d2dda46eed5d7738a93a24344c8d655af487069e85533d0c"
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
