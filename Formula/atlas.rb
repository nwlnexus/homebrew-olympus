class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.4/atlas-darwin-aarch64.tar.gz"
      sha256 "9f89e2681ba9a5239634d047af17d1e8f7b901d7ee6788c27511dfc7de7cf2a7"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.4/atlas-darwin-x86_64.tar.gz"
      sha256 "79020a2e9d2833fbf75fa3bed55a04d329257fcc8cfdbd7101473e429bcae78a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.4/atlas-linux-aarch64.tar.gz"
      sha256 "db3719d52ea285688261d584a2138f6c3b88c7dee7fa1f7f08be45f7cd02db7d"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.4/atlas-linux-x86_64.tar.gz"
      sha256 "6d2a4d979a2e536a62c6455ee5d80fbcac67c0e5c1ae74c8041c28810280f511"
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
