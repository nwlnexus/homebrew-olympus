class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.50.0/atlas-darwin-aarch64.tar.gz"
      sha256 "60e99c8bd7427bac6b696c85195c44791dbbb2d3029450bcdc358697ef050999"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.50.0/atlas-darwin-x86_64.tar.gz"
      sha256 "1dd0c5f83c50f7a1abf4c1cc5b59942de1c44a9563f9bfdd1706902e84bb814a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.50.0/atlas-linux-aarch64.tar.gz"
      sha256 "98f71b77b41f521e8cf8a702e4bae817c85dd08e8b56d77585c7f613da140a8f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.50.0/atlas-linux-x86_64.tar.gz"
      sha256 "18779ced1707950bb296584c9e91e76e4874b9e3a94b0d7860dc6c0d15f4591c"
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
