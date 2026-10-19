class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.26.0/atlas-darwin-aarch64.tar.gz"
      sha256 "e7f8bb588f4cc912828f193925b26d2895b97711b5f7a96e0d32927b05f5dfe8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.26.0/atlas-darwin-x86_64.tar.gz"
      sha256 "bff7e8cbaf763e1508c693ecd791df9cbb0399002dcb7a37c1d46aa076121935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.26.0/atlas-linux-aarch64.tar.gz"
      sha256 "795bc44800a1bc39d72a62b4b63840dceeb6636fc57c1146f5f54fe939de1aed"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.26.0/atlas-linux-x86_64.tar.gz"
      sha256 "59c5cfcfb935a65d01eaa97dd4782f062c974e361cd308d17be3afb66332805c"
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
