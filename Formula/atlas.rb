class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.49.0/atlas-darwin-aarch64.tar.gz"
      sha256 "87e7328eb291ea68873b012de3cc6b48551e7a158d0e93429cc935f6c6ebe6d0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.49.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d195fbed290527d0e40dab609620ce5e73a84df70664e9bddc94f74cbbb2077f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.49.0/atlas-linux-aarch64.tar.gz"
      sha256 "18dec99903b078ff9bf8bab5f028926a114b595b9717e02256b9a22079753116"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.49.0/atlas-linux-x86_64.tar.gz"
      sha256 "ea6d180cb2f51719e4f20b6525cfb20a7dd35ca3dc79e7fdfeb3d37f180cc70a"
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
