class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.116.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.0/atlas-darwin-aarch64.tar.gz"
      sha256 "5079e6cf7efd37e6c1571c14188072f822645839cfe7de416e489add9404e083"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.0/atlas-darwin-x86_64.tar.gz"
      sha256 "165b26fe8fe56dea7106d2a47099f50591045fb3e7c5d7dc2b1cd9e12718bd1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.0/atlas-linux-aarch64.tar.gz"
      sha256 "6d189b0bf6d744c5ea12e667955edc3e1bab325eb61a17a7182baf0504929582"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.0/atlas-linux-x86_64.tar.gz"
      sha256 "08e481493e5a0482ac263085be6c34ceb8f969c59eb50cab02d6fded54d76d2c"
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
