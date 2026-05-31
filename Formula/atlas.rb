class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.16/atlas-darwin-aarch64.tar.gz"
      sha256 "a5140fcaa6738b469cb03dd2ad4d03dccdb1f650ad7a4b8fd0ad46480a2307af"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.16/atlas-darwin-x86_64.tar.gz"
      sha256 "73f9a26a984c2ec2a65e004c01e9a318c04f973381fc2a1b5f9fa23aeb14d2ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.16/atlas-linux-aarch64.tar.gz"
      sha256 "da9468e2f2bce8ea7e99356f075a56fa0f3ea76640531e41058595d6f5e65b65"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.16/atlas-linux-x86_64.tar.gz"
      sha256 "69f04eaf3580fdd929b9cdc822c625de56648d02b1cfc8bea008c262eb81b27e"
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
