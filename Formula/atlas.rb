class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.0/atlas-darwin-aarch64.tar.gz"
      sha256 "437b2b937136505359d0eb79c67b55b63e862181fb52a444c7e78af547c8d7bf"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.0/atlas-darwin-x86_64.tar.gz"
      sha256 "cbc6b3c7b3cb369e4318b604ecf26b4717fdf1347ac197f2334990269dcd209e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.0/atlas-linux-aarch64.tar.gz"
      sha256 "8fa91567f9e14c0d924a426c9a1d0eeb57cbade2cd5569170f8e51f8d258da26"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.0/atlas-linux-x86_64.tar.gz"
      sha256 "922d46b5db5625728a35234994b906d58fd22669fb1643d89293bf9ed42bcea5"
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
