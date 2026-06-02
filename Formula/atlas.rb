class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.1/atlas-darwin-aarch64.tar.gz"
      sha256 "537d9471e0548d950c14798dc67b3196b58dada89c4aff5912b0b443278f9c35"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.1/atlas-darwin-x86_64.tar.gz"
      sha256 "15960d8c5b8f7c12808866008e8ba7428875139c76dbc02bfbe9ff2a367541e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.1/atlas-linux-aarch64.tar.gz"
      sha256 "a0e11e118c7f66f9903d323d300e1d48edf411ac11e3a3d52d209a875264735f"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.1/atlas-linux-x86_64.tar.gz"
      sha256 "863aeef7020bb6055a8ad00757db65fc63533c44e5c8fd484653ab658d5f4a3c"
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
