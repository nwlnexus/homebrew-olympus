class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.16.0/atlas-darwin-aarch64.tar.gz"
      sha256 "1dc6f312b93ef40ef24cdbba2850f598240f7ace3178e1bf91fbb66619c04d7d"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.16.0/atlas-darwin-x86_64.tar.gz"
      sha256 "2c676171df3164fdc764e20972387995357e301809b41dd1fcaf28593ba6d1e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.16.0/atlas-linux-aarch64.tar.gz"
      sha256 "e8426da108b62a4bba0cfc36955a207d3200604db5c0c6011505e1e905a9a210"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.16.0/atlas-linux-x86_64.tar.gz"
      sha256 "1ee8e4eb30fd5f71dd22bd7c6a6d39b2303713ea88284dd143dfa4ccffd7e417"
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
