class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.116.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.1/atlas-darwin-aarch64.tar.gz"
      sha256 "be5998cdd180a86a2b9e6748336f45b1b4d8b3d9e60a823b68fae2a3e9744bbf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.1/atlas-darwin-x86_64.tar.gz"
      sha256 "ea7c94a1ce8fd68db8a1e2d971122650de16efad780f72117116bdd85b71bf9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.1/atlas-linux-aarch64.tar.gz"
      sha256 "624ffd1b1e3ef5acf233fc99ff7c8a5c02ff1e84f1df023271076a966e0a2f5d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.116.1/atlas-linux-x86_64.tar.gz"
      sha256 "a158a3d9e556b2c921c380def338b649ee029c11bbebc7a783b64aa0ec017c2a"
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
