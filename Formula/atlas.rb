class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.12.0/atlas-darwin-aarch64.tar.gz"
      sha256 "4ecb46cea69c0a951facd6ed595dfcf3b42468b859b35771c9bf22be50ad6b70"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.12.0/atlas-darwin-x86_64.tar.gz"
      sha256 "0858d4d84f0a4c56ba5077a3fb18b516a289e1128b7dd20c78c05bfd6d56a808"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.12.0/atlas-linux-aarch64.tar.gz"
      sha256 "5d4ecae4b54bea222d5523f6bf53412a54cc220ecbf8be2e792c812c21882ab3"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.12.0/atlas-linux-x86_64.tar.gz"
      sha256 "566c6bf3a5f0157f87796300142454fd852700d54e8243088653b24439db1f55"
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
