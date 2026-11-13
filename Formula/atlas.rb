class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.61.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.61.0/atlas-darwin-aarch64.tar.gz"
      sha256 "afb47150c1137d294a43428449230ffc0df403253606b8a426028c5cfc475544"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.61.0/atlas-darwin-x86_64.tar.gz"
      sha256 "e5bb07b07d5f00ddc515ebddf9641921e76fb5fb48eb2417b166aa8e07277085"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.61.0/atlas-linux-aarch64.tar.gz"
      sha256 "f671f46000537d865137e6d86f6d3995972d0a18de7cb9828d51d56d34dd5b8b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.61.0/atlas-linux-x86_64.tar.gz"
      sha256 "0cf92021920fa6780c5da508cbfbc785217649d78da7522eb60e93999b179a63"
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
