class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.41.0/atlas-darwin-aarch64.tar.gz"
      sha256 "cd9497079cb9ce50a5af2b3970f904fbfd1159e6dfd3ce35e74bb2486fc48018"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.41.0/atlas-darwin-x86_64.tar.gz"
      sha256 "770c6c34da17e3561d7eeb9d959d3f763495d50ae1d707dac2baf1d85972e9f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.41.0/atlas-linux-aarch64.tar.gz"
      sha256 "5cfb02f1c100051bf14dae03ec3cf9e443d862424b19aa6ec92ea53b71ec602a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.41.0/atlas-linux-x86_64.tar.gz"
      sha256 "5ed370a242b095ad3f34d642d46372866925c3eeb547f537ae9cec4d40e6ccff"
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
