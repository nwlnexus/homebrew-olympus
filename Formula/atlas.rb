class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.107.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.1/atlas-darwin-aarch64.tar.gz"
      sha256 "733827ac6fad21787ae83b0d8828ed7d86736e83392fdd44449c555179fd3485"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.1/atlas-darwin-x86_64.tar.gz"
      sha256 "e5f2651e336153ce2a10ef29a3df88d4b40f3c42ad03eaec154242be33cfbc06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.1/atlas-linux-aarch64.tar.gz"
      sha256 "9b26e87421bb545b3f61a81463fbfee5aace9ccd3cd1e10dd7bd0505c72aaad3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.107.1/atlas-linux-x86_64.tar.gz"
      sha256 "b98ff8b84d2ab2640e00e08d87046bbb632c34c7d618ae91a2b038dea9af848b"
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
