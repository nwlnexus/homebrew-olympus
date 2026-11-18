class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.73.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.73.0/atlas-darwin-aarch64.tar.gz"
      sha256 "95d681da501277d345da6108d316b678321319ddd6e704f86df7eb8cd42df129"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.73.0/atlas-darwin-x86_64.tar.gz"
      sha256 "22247769a74e8d435472c444f50cb041e67155021fecb0ab41658123f7f5502f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.73.0/atlas-linux-aarch64.tar.gz"
      sha256 "7adecb5c6d6cf5cbbe7227bfe23aa5f6d60b253dc86e40f99bf8f95fcfef8987"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.73.0/atlas-linux-x86_64.tar.gz"
      sha256 "56be095514b80f5e7164a23e7ff094569584e7d6d0b08d7c44ca41d565699a94"
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
