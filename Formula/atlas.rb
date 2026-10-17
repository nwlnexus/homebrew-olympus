class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.21.0/atlas-darwin-aarch64.tar.gz"
      sha256 "627821b5f2c34e23af462a5cb259c473ef76c5a1ffa92e7265c073613912dcf6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.21.0/atlas-darwin-x86_64.tar.gz"
      sha256 "3a3439d133a045c9b09c3405029acc64b6db05faeef745aac526eceb5a25c53e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.21.0/atlas-linux-aarch64.tar.gz"
      sha256 "19ee45407d3f6a5ea80c4b7c808fa81740e514e4da4de43bc90503f1e0fa0dfe"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.21.0/atlas-linux-x86_64.tar.gz"
      sha256 "e08349a8975d5c78a850474c109616cb8f9a26699a89a93ccfa49102587ee36d"
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
