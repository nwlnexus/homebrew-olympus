class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.51.0/atlas-darwin-aarch64.tar.gz"
      sha256 "c51cadbe366b61e2ca381a77981c010a07819e7c5b33ce43f2a6039aab7fa646"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.51.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d399f342e5dcc3bb6bc74d0a3486d5879dc7b657ff1fbeed038e479ea8724915"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.51.0/atlas-linux-aarch64.tar.gz"
      sha256 "ba412e08ed4c905deaeccc0945341d5772480ff67741dc1588af4ec97143bf43"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.51.0/atlas-linux-x86_64.tar.gz"
      sha256 "423ffe00bc22bd73b580b59102438ac8eb99d699ff4eb1d2b5a1017b7ac88ce4"
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
