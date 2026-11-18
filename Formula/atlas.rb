class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.75.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.75.0/atlas-darwin-aarch64.tar.gz"
      sha256 "7e5a5fd8969f5c74ca7cb09895fc725ae234ca2ab551a3879f72d47d27f275f4"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.75.0/atlas-darwin-x86_64.tar.gz"
      sha256 "c45ce0a03757c4c6f539db34a16264c9e5a392fe8751fdd67b2c551a8f483015"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.75.0/atlas-linux-aarch64.tar.gz"
      sha256 "56366879167f4eb116257dfdc921ea20e8935916e0cd150750563a70a5e3c388"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.75.0/atlas-linux-x86_64.tar.gz"
      sha256 "ffb588f8cb04ee1a7f079f2bdfdaf381acfbe3c030d5733523bc0d04534d4e8f"
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
