class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.82.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.82.0/atlas-darwin-aarch64.tar.gz"
      sha256 "139a952c3edf909f48ee0fc5f4b4a6f5f65576cfa99bfc04b6d795e3c842d867"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.82.0/atlas-darwin-x86_64.tar.gz"
      sha256 "07dbb9984c133b6da900a4e74c118086c54494f46dc0c03bee0f0e316034bed5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.82.0/atlas-linux-aarch64.tar.gz"
      sha256 "f6770a8a5f10303556af98d714b7e8799d59788675182b0bfa63f425ec1ed42f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.82.0/atlas-linux-x86_64.tar.gz"
      sha256 "0e2ea115ed0041dc23a752949255cfb84056a94a4a211e9b83e4ad3a30e4af2a"
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
