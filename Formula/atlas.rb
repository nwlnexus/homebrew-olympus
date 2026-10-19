class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.31.0/atlas-darwin-aarch64.tar.gz"
      sha256 "45c21f69bafd02fdb3782492a5bbd61cf218fc8def6b487551b8f6afa8172412"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.31.0/atlas-darwin-x86_64.tar.gz"
      sha256 "b6aa447ae8755d6d76c85f86c5e7d5befbaf2969c3452d301548005ef69ce1dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.31.0/atlas-linux-aarch64.tar.gz"
      sha256 "080320e33793fce90139c298cb310e89161e84146738000cff7feb91f0e6c0d4"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.31.0/atlas-linux-x86_64.tar.gz"
      sha256 "0d7c3ad7b83400c8b846a0a7868e6cbf6662edf20aa8f7cd6623ceb690b140e5"
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
