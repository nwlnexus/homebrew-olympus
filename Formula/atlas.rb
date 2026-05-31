class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.15/atlas-darwin-aarch64.tar.gz"
      sha256 "c544b9e940ae4e6222aedbe162edb8503d7d4c595bf591364cb35e71825a9d6b"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.15/atlas-darwin-x86_64.tar.gz"
      sha256 "e82eb5b64e5e20cdf57876497413971709ec10b48243dfcca93387ca8b1a6717"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.15/atlas-linux-aarch64.tar.gz"
      sha256 "c3b51f6185682685b0e83be3d000ba3ff27438e26e1736d6a4426cd651f30506"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.15/atlas-linux-x86_64.tar.gz"
      sha256 "190962524cc270da23fdcc9f789c41e6621ec5c3190ec5c0e3c8bd0f84f78638"
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
