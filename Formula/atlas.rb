class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.72.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.1/atlas-darwin-aarch64.tar.gz"
      sha256 "33163bdfd839f07e8ca5c4ee35763ad21b52c1386fb839ed8c58702de31e9339"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.1/atlas-darwin-x86_64.tar.gz"
      sha256 "df08ae9de7375a9afa18363771d33356dc9512858b23cf4f6ef8042c08ee934a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.1/atlas-linux-aarch64.tar.gz"
      sha256 "c480be0e3955094a38f881c8ad1263774f4b237ec65e04729111c26c81c1dbcf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.72.1/atlas-linux-x86_64.tar.gz"
      sha256 "66dd0285cf3b03f44a04cd1869c237a2e95033ea8287eb08c64f7c2967b6b092"
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
