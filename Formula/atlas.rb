class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.69.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.69.0/atlas-darwin-aarch64.tar.gz"
      sha256 "28cbaba2e2d16a3a8054cf23b3025492be49ca60cc53057d2a8d8cf90d10d0f9"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.69.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1980c8277355289fa46f649339fda85b3a31d4233df6d146c66056cfd6c1f467"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.69.0/atlas-linux-aarch64.tar.gz"
      sha256 "82c24ebaa0e62b40e3efdc5a79392dff87434d542b1ea54dae0b6731bd6db6c2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.69.0/atlas-linux-x86_64.tar.gz"
      sha256 "e664ca1662bc849b5fe5796583cf719ed781676d8fb42af065c1f946b5c0d573"
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
