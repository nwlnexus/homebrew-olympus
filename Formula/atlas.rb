class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.5/atlas-darwin-aarch64.tar.gz"
      sha256 "b30d420958fcbaee6ba240f3ebae9a170cb07652efb188c1314ed5d5654b8279"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.5/atlas-darwin-x86_64.tar.gz"
      sha256 "5c2a18b34f7eedfd7087ee697f76aaae821b96fb3c7ed95b4a5d1dd97e4f05f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.5/atlas-linux-aarch64.tar.gz"
      sha256 "6a46a03364edb26a7d3e6a03e5170d2a6fdf14d7a940308fba4a1f5e629e1305"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.5/atlas-linux-x86_64.tar.gz"
      sha256 "1d176247ac3ecb6058f98701ccd0b92aa4dec23e7c43864cd00fc2261f99a2b1"
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
