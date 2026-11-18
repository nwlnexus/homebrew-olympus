class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.79.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.79.0/atlas-darwin-aarch64.tar.gz"
      sha256 "d5c317aff80a99ef54fe96d418c3143da422f4f138be406eff3ea1ff65327522"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.79.0/atlas-darwin-x86_64.tar.gz"
      sha256 "abcf18fc62de341b9fdc2df4f12a268840da0b7b714546d7d30beb78c42b3d1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.79.0/atlas-linux-aarch64.tar.gz"
      sha256 "8309da85226bab6cffef98f0fb584395f58a311fe41bcc6746dc852bf16cd8e3"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.79.0/atlas-linux-x86_64.tar.gz"
      sha256 "f4a60132def3b54bbf80fc1fbc406bd6887bc5c9d39737238601239459b3d999"
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
