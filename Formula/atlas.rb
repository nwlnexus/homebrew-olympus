class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.78.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.78.0/atlas-darwin-aarch64.tar.gz"
      sha256 "87d56d2ab0f3dbf10717582485df59d01a7a907f2cfadab0c5e05cd3f7b04d40"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.78.0/atlas-darwin-x86_64.tar.gz"
      sha256 "5ef029b36603eca1e5fb4026c7af3caa35371c772fa4d0eb19604f316c9ff25a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.78.0/atlas-linux-aarch64.tar.gz"
      sha256 "6ff82f41094684aaf39f07a163ec0d38da67036e7bfb539bd132f7f678ee4d8f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.78.0/atlas-linux-x86_64.tar.gz"
      sha256 "1abb647895174fce614069ffd2dde14b5ec56b2217af8001e8dee03a11b879cd"
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
