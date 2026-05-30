class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.11/atlas-darwin-aarch64.tar.gz"
      sha256 "c57ba44c97780ff233a5929688d80c6bf266967fef2da4d545ed99becb424faa"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.11/atlas-darwin-x86_64.tar.gz"
      sha256 "e283d7c67d7bae57b313e6babf56c6e9d2be0b5e06a267cd5ad92e4e9d8e0eae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.11/atlas-linux-aarch64.tar.gz"
      sha256 "6cbc2e73ef9bcd5e054ed6c65ac5bb5e9677d320bba34e368696c63958187144"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.11/atlas-linux-x86_64.tar.gz"
      sha256 "f440575fe3ac8ac4eaa376df63b4131e8e451b3ff8150050902f4f3668898a8d"
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
