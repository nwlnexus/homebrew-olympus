class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.7/atlas-darwin-aarch64.tar.gz"
      sha256 "f43bb2ab7db491e3e6635b7a4ec17e5b0dc509a544a50621a819251d20575c42"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.7/atlas-darwin-x86_64.tar.gz"
      sha256 "5df80e108c3ddcd2313342a3bbd546e86c849bfab97684695445051ab5387c7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.7/atlas-linux-aarch64.tar.gz"
      sha256 "fdfccc0e54ff9c5bae5e7960ab414a18e79eac44e6d0628dec8021ab9aa8a9bb"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.7/atlas-linux-x86_64.tar.gz"
      sha256 "54d1d2d94630c1a8aaf8af95cb256bfa0de5c2398f42a4522e234c5c5ca404a5"
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
