class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.74.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.1/atlas-darwin-aarch64.tar.gz"
      sha256 "1ac876706fd560db07031efce6071f59e8ce18764f5a85a344147fb8da070f25"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.1/atlas-darwin-x86_64.tar.gz"
      sha256 "900d257886f7e69c9e306b21d49ef5489568880f42a3d25a7d8652f781b86c1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.1/atlas-linux-aarch64.tar.gz"
      sha256 "36b162039a121ccd03bd5cf8b7c4d1322be3e7d052b5719c00060d4cd6d94b9a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.74.1/atlas-linux-x86_64.tar.gz"
      sha256 "ef344bf712fe05f13c818619a6fff943a2364ec5d57f69eec305f5af40261e7c"
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
