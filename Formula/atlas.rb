class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.10.0/atlas-darwin-aarch64.tar.gz"
      sha256 "b93cd4a2f288ee4ee2f184abc49f378eb9bfb074a9e09de13b627a2238945b27"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.10.0/atlas-darwin-x86_64.tar.gz"
      sha256 "b5eb97fd8af7c6179c019c567d8ba46cf7e9e88c5fc931fd5e69d5f27c662a00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.10.0/atlas-linux-aarch64.tar.gz"
      sha256 "cfa3dfc45cdd7b650a41d0c73f87a40df4ef667f8b71e85a46907bd12599d4b2"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.10.0/atlas-linux-x86_64.tar.gz"
      sha256 "e14c00f3e17296ef498a716f92c50439a191bb365cede27b867e59c17258cf1c"
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
