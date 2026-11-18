class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.65.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.65.0/atlas-darwin-aarch64.tar.gz"
      sha256 "e892925371f7df9f6276bcd8ebd5298e991da1aab854a7ae7a012088d7804d6e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.65.0/atlas-darwin-x86_64.tar.gz"
      sha256 "428328ebb49d0d4c1e0bdf7c4e034ce1fc519be53dbc136814b04b05d243592c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.65.0/atlas-linux-aarch64.tar.gz"
      sha256 "84250ec7996dccf4cdfbff94a586ead74e7e2459ce40c8ad76e6c67aac12ba4f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.65.0/atlas-linux-x86_64.tar.gz"
      sha256 "f88162274600b739e8c4a815f6cf90151619c263b029311b007cee66c657213e"
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
