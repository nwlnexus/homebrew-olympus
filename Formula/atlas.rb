class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.109.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.109.1/atlas-darwin-aarch64.tar.gz"
      sha256 "652b3f22d5563db7f3893be2a965714d794db3b141165c00c297bdcf4ac57271"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.109.1/atlas-darwin-x86_64.tar.gz"
      sha256 "fca4d84ce8f333ddeaab8741dece6e996495a5b73e5285c92582ef1f08aaeeea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.109.1/atlas-linux-aarch64.tar.gz"
      sha256 "6a1e9cee2c61403bcba8790c3f212fb6966398e814f4767bb72c1317915ac8e6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.109.1/atlas-linux-x86_64.tar.gz"
      sha256 "1068316e572bcd6384f289a0d0f8dbb3678f2d79b5d208df4e640b23aa405aa9"
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
