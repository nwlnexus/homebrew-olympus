class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.9/atlas-darwin-aarch64.tar.gz"
      sha256 "344b291a6e108cd41e49aac7aa29eb490520c4e1f50d2b18bc5547bf844c8728"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.9/atlas-darwin-x86_64.tar.gz"
      sha256 "ea1a0f0c430ab7eb23a5abbd8351b76bca4bd8d0d307db32485822d1c08e56b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.9/atlas-linux-aarch64.tar.gz"
      sha256 "9809274b546a68ad7672379f3da53e61773d39a096b579c564c689adf5abb716"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.9/atlas-linux-x86_64.tar.gz"
      sha256 "c69de0fd3210708d39260a22a638eb21e9763a2f2d9ab9e5d12ea28b35e1800d"
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
