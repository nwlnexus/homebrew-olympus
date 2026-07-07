class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.0/atlas-darwin-aarch64.tar.gz"
      sha256 "99f1396af5e6cc10fd76d4dd8185459f94531bd7ee2470b5f35c6d9ee83cd8bc"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.0/atlas-darwin-x86_64.tar.gz"
      sha256 "f573565355a6b7fd86a293a71dea60c782af5c917c831c582388bf6745879916"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.0/atlas-linux-aarch64.tar.gz"
      sha256 "22ba5221b776fe434998109703c176e78f6761bdb15839276a97b4a21954b6b9"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.0/atlas-linux-x86_64.tar.gz"
      sha256 "300672e3b1377c4d1e6e3977db142a44ea84ddf49eb666c462ca00a78a7e8173"
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
