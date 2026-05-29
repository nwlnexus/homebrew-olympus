class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.6/atlas-darwin-aarch64.tar.gz"
      sha256 "71835c70d3bd515bf60b24714ed6cf214bee6f29a1aad41b8eff7866793ecc21"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.6/atlas-darwin-x86_64.tar.gz"
      sha256 "6d5eeb2afcfeec09b70b827e5ce0d7c3074a005966ec56ced2845a7077c15915"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.6/atlas-linux-aarch64.tar.gz"
      sha256 "6f5ee6ee4a62e00299674cecb99b8924d58769f61f1239d7c6621710578af994"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.6/atlas-linux-x86_64.tar.gz"
      sha256 "0ba1c4f9892e870fad71d13c20a51a46356d023e62b903ceca8a81660a7d5d86"
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
