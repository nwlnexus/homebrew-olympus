class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.18.0/atlas-darwin-aarch64.tar.gz"
      sha256 "669b461f7b98b6f25fb8702e7ccf78e8d51aa2c4f5f91ed69e84475ecc3f83dd"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.18.0/atlas-darwin-x86_64.tar.gz"
      sha256 "66a701544d781d059d4b0c20519ca09135b57b541e76f5614956ef97220b2ad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.18.0/atlas-linux-aarch64.tar.gz"
      sha256 "2a45b524af411a237378712764e19440032788c0a2f0e57596696488d0dbbe5a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.18.0/atlas-linux-x86_64.tar.gz"
      sha256 "00c01692436abc6943553c65d77b6be7ce1c015baa4db167f52e7ac690a5b190"
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
