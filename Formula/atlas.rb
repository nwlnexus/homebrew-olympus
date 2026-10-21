class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.39.0/atlas-darwin-aarch64.tar.gz"
      sha256 "57d819f3072edc10d3eac7c0490f3d6026e9b7fccb2e9cb221d42d08153e082d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.39.0/atlas-darwin-x86_64.tar.gz"
      sha256 "a4242d2dc479a1af0ad8fee468ab2d9f4ec26173886713c8225b2e82012565aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.39.0/atlas-linux-aarch64.tar.gz"
      sha256 "c7c9c71d191643fd7137d16849a5b03def09c0facc3ffd1929ab807c8345cbac"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.39.0/atlas-linux-x86_64.tar.gz"
      sha256 "40c4ce6665be5d89185a49440e16c3ca3bb3a6c678564fabaf109c72efb8b090"
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
