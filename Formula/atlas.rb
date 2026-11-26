class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.114.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.1/atlas-darwin-aarch64.tar.gz"
      sha256 "cb67f836c577c0a1cda5f3fdc8cadfd8286b8433673ef6f9c1517837f044cc5b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.1/atlas-darwin-x86_64.tar.gz"
      sha256 "909f3766e8204b8a6c8dd428cedf44013f37d988660c25ca2082930c6d479537"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.1/atlas-linux-aarch64.tar.gz"
      sha256 "22ddb082f589e6c7858e5974a5281f0c95caee8177f1e7f4828bbc17c3b7c2ba"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.114.1/atlas-linux-x86_64.tar.gz"
      sha256 "84642ab099878c1674dfc49e99e429e5b8dfe7dac6c41f5f36af60cd1926ff51"
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
