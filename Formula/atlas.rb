class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.89.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.89.0/atlas-darwin-aarch64.tar.gz"
      sha256 "fe735d05791994e5351ae3665ed487266578580ec38b7b9c7644f508e36b01ed"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.89.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1ab5407a3f0cb95056b90036d0e033f55e5e661a981bff93e065df526ac64d95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.89.0/atlas-linux-aarch64.tar.gz"
      sha256 "68ca05fe772e0cf2a00066921f354f750ab8ab9b499ae36efe4658108ba7773e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.89.0/atlas-linux-x86_64.tar.gz"
      sha256 "3a63b9177b997cef9b18bb3dff44ba93e006c7884011e225f2e4c88c10e6fa64"
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
