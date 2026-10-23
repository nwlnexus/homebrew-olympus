class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.47.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.1/atlas-darwin-aarch64.tar.gz"
      sha256 "e276101bc76cbe99586e61c36a0e45ceb8429a1369dffdb6f4a2dcdaa4ade178"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.1/atlas-darwin-x86_64.tar.gz"
      sha256 "c3f2bde5496dda8236c122014b3c5cf54e826b2a65560c06e999391e10e828bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.1/atlas-linux-aarch64.tar.gz"
      sha256 "d04dedeedb9fb75da6cf968aec64d10015a42cd1328b1ff9ba5258c112d51caf"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.1/atlas-linux-x86_64.tar.gz"
      sha256 "f43c19d1f90f32024d0a3ff20462c90e492266c412ac70169ad9351cc913fd06"
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
