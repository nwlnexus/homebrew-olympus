class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.107.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.0/atlas-darwin-aarch64.tar.gz"
      sha256 "e64dd1f4fc722de67044d36d0f483d464ad670528645c3d73b64293b90c0f36e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.0/atlas-darwin-x86_64.tar.gz"
      sha256 "37e878b2b965ddcea5b6804de08258286ed4fcd96a5c4097f698cfcfecdacaa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.0/atlas-linux-aarch64.tar.gz"
      sha256 "1445113599233738a836cdfc1937d3d111ae13dbb1dd06159963c1abf94d0f8e"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.0/atlas-linux-x86_64.tar.gz"
      sha256 "41a3c9ad641c5e63acd8bebb504bb4e6b7e62236aea12acda35acc61bff22e80"
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
