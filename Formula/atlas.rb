class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.3/atlas-darwin-aarch64.tar.gz"
      sha256 "6d486545e0ec226e3387f8c630e249331853aa1db482b722d920268290ba3a2e"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.3/atlas-darwin-x86_64.tar.gz"
      sha256 "ce8e8f7058a407cee1b667ee385257910731d067367db2976076ae6aef6afc8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.3/atlas-linux-aarch64.tar.gz"
      sha256 "eefb672756229709ccd2754519cfc04eaca10bbe66c98445d5714807d3fb303d"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.3/atlas-linux-x86_64.tar.gz"
      sha256 "9d022d584020eb36d9ddda7fb15c097010527457a095ae9f5b26af3399a97711"
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
