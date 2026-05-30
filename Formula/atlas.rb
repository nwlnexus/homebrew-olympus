class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.14/atlas-darwin-aarch64.tar.gz"
      sha256 "5de33239ebc79ea84b7311f0b8811505afda2680156fed3f5db80aa65dcca5bf"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.14/atlas-darwin-x86_64.tar.gz"
      sha256 "f28ce93ab8cb18d3808035f00752e4b03905f8bf7e3186d20c892844b69babeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.14/atlas-linux-aarch64.tar.gz"
      sha256 "4344d7e101f45dd6632f804e84e0436f7c9d95022d76656807e9944621a06130"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.14/atlas-linux-x86_64.tar.gz"
      sha256 "a1a3d542124dd4243b2b2c3d853ee9354021bf24d45659689f7c572e7d1a69cf"
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
