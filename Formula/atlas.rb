class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.90.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.90.0/atlas-darwin-aarch64.tar.gz"
      sha256 "192a4ba06601426e18c46f0d16d707d05aae25488ad03d4b8acfcfc0c9a11184"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.90.0/atlas-darwin-x86_64.tar.gz"
      sha256 "e0e842b29dce20f6cbf96b13f3e87219ed3f13599d68f013960294908c8bbf4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.90.0/atlas-linux-aarch64.tar.gz"
      sha256 "610d1c1e0a7a821c4aa5a4173913ad9441a544d66df950f5845e7168635b412c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.90.0/atlas-linux-x86_64.tar.gz"
      sha256 "f4404366d16868324c57b0cde5fbca0c7e042f03b0674ba13a409b36d3858fe7"
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
