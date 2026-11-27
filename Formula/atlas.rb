class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.117.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.0/atlas-darwin-aarch64.tar.gz"
      sha256 "ca3d12a16b84808cb0fbc6150058b0b23f390c8a1d8fea111c618254ac5e54c5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.0/atlas-darwin-x86_64.tar.gz"
      sha256 "065aa685352e472927965510e461610dd659c4cd2587c606f0e880ada20fbc29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.0/atlas-linux-aarch64.tar.gz"
      sha256 "b2aae2ef7b0b6ec2846680d111e65ea6a49a257dc2192e8491f9c96724114357"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.117.0/atlas-linux-x86_64.tar.gz"
      sha256 "e62bcea0f164d641295782be2d30180134dcecb04b74e42f7fb0b232ce54e8fe"
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
