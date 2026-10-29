class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.52.0/atlas-darwin-aarch64.tar.gz"
      sha256 "da5b5a5ddfffae47e91c9bac5e1190bc39643b6ee95dbfefd6f3e9a896c53966"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.52.0/atlas-darwin-x86_64.tar.gz"
      sha256 "3865729001b9e8211c0db2332b2c74dc79966b4ecafa55b1e080e566bd4c151f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.52.0/atlas-linux-aarch64.tar.gz"
      sha256 "aa06b3f665e6631211c52c0088eae83962e1ff5434976f4a2ec962c97ba60591"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.52.0/atlas-linux-x86_64.tar.gz"
      sha256 "e523bbed8baca0fe1a606fe7a27bd238a4bf05ae606f03d4c9b40ba14338079e"
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
