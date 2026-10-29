class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.55.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.55.0/atlas-darwin-aarch64.tar.gz"
      sha256 "d5db7b64845c8a696a9f133beb6f96e9e91a883ecf8443697fbffdb74049267a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.55.0/atlas-darwin-x86_64.tar.gz"
      sha256 "814caf606e1ab26a184bcaee43b4dcf11b6b10cddc469c3ed2d97bf156d6d3b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.55.0/atlas-linux-aarch64.tar.gz"
      sha256 "9020fd9994c56f11fd1ebee3d9ad2b9030a295cbe183bd08869fcf66d3611507"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.55.0/atlas-linux-x86_64.tar.gz"
      sha256 "033ba8e736532ae3330ed045a317b223704d1eec0e360f3e7624964ecc0b8da9"
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
