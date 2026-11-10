class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.57.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.57.0/atlas-darwin-aarch64.tar.gz"
      sha256 "805a32307881404edef782508a63b2261aeadc71521b2095ba43da8c6858194f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.57.0/atlas-darwin-x86_64.tar.gz"
      sha256 "f150b0593652ca96adadaefaa6c1ffdf600c42f9dbc5f17b88866644f4c8aa2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.57.0/atlas-linux-aarch64.tar.gz"
      sha256 "4a9791876ed5c546c6e968abcd3a9521322abfee18860647b637f3c1a1b171dd"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.57.0/atlas-linux-x86_64.tar.gz"
      sha256 "5904f4142e1bcb3e2d5dd47e9235c5aa72f42b3fd06c89b9bbc7bbbf3d4a4269"
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
