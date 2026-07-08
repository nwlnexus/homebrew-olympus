class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.15.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.4/atlas-darwin-aarch64.tar.gz"
      sha256 "d97487b79bb9a592bcd377b61ebb010e4c0f47dcc37da4889f02858c8fffdda8"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.4/atlas-darwin-x86_64.tar.gz"
      sha256 "cc5c0efe688e469b07a5715a32c0ea4e918622bd5ac5fae701052afa91c88732"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.4/atlas-linux-aarch64.tar.gz"
      sha256 "c8821ecdf8efc877a21d0721ebcca735480187e188f8bad3e7366dfcd1f3888e"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.15.4/atlas-linux-x86_64.tar.gz"
      sha256 "18b8eeca57e0c8d0c65bdcd7c7a9d3846bfa223830881f691855d98ab7ed0196"
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
