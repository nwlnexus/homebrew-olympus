class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.74.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.0/atlas-darwin-aarch64.tar.gz"
      sha256 "13edec49a283cbea61b58ba167525d29c4fc4102082848be1b7e6f0d3a42a2a2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.0/atlas-darwin-x86_64.tar.gz"
      sha256 "2214c653dd731eaf62cf9d319af08ee92544aaf867e3a5d29f589cea8924c500"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.0/atlas-linux-aarch64.tar.gz"
      sha256 "60d9fd31fa61efeecb05a924d4eb747105c34f9644edd137aee5550626a00062"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.0/atlas-linux-x86_64.tar.gz"
      sha256 "b72b1e15daa7a8dcdda664aba59d433b5567786445a50335a434e16f1244bced"
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
