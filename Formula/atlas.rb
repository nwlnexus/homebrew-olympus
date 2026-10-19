class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.34.0/atlas-darwin-aarch64.tar.gz"
      sha256 "f6241ebd9c0df77ca3076f68ad2e082f59ead85fc21a257d0ed89bcc58d098e6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.34.0/atlas-darwin-x86_64.tar.gz"
      sha256 "3760e6c918d1453422cf847e16bcafa20744b18a12684d70b7efd48294d45f92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.34.0/atlas-linux-aarch64.tar.gz"
      sha256 "426c10c7076cc80d2f65708c9eb33e37c8910c7396c50d1c109b24eedf859395"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.34.0/atlas-linux-x86_64.tar.gz"
      sha256 "3609cb1eb03d97a3cc4838d65769d0c17c2f5363715b9f834723d41909f03121"
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
