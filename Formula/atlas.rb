class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.0/atlas-darwin-aarch64.tar.gz"
      sha256 "c46267e95a0481368140492511aedf5fbbc20c02a70245c74712c43d9ab8e590"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.0/atlas-darwin-x86_64.tar.gz"
      sha256 "7f1e77df9f6ae272230e43cf6d377b391953580cf46782b4664eb8fd2e02720e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.0/atlas-linux-aarch64.tar.gz"
      sha256 "28ae208a9446a413074a8cd9301fab00990020bbe00d6cab261d0aaf21679b7a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.0/atlas-linux-x86_64.tar.gz"
      sha256 "172f2775ae87ba6a2e0d55325952c86179ede3eb61b95145031f9a70aac2b520"
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
