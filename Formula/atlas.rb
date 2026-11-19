class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.81.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.81.0/atlas-darwin-aarch64.tar.gz"
      sha256 "7a65123cc0e05b17321c5d2134c091acb727132844a03c0b193b326ab6e152d1"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.81.0/atlas-darwin-x86_64.tar.gz"
      sha256 "4119647884935d31e65c0c84d173f9a94d8bb50cce9b9d9e41050120e7c2d92f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.81.0/atlas-linux-aarch64.tar.gz"
      sha256 "9a9e39fe28c0708e52572d87cd63c262c0a40702847bf5b2c1e7c09ca1a90bcf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.81.0/atlas-linux-x86_64.tar.gz"
      sha256 "347eccd24e8a72abd756866c1c6d62fd02d84a412ad33fd82842877ace3dd9a5"
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
