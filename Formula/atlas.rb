class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.88.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.88.1/atlas-darwin-aarch64.tar.gz"
      sha256 "2ac58935c28c6871e09d99c6a29066f6f2a8a70c3c97deb4a29febf38b4c4472"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.88.1/atlas-darwin-x86_64.tar.gz"
      sha256 "7275952cacfd5ea7964ed355ba22761bfd7ce648b30e11c1c688406491812442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.88.1/atlas-linux-aarch64.tar.gz"
      sha256 "05ca7806f2a64304748cc4066261a494815019362810750026416687671e88a2"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.88.1/atlas-linux-x86_64.tar.gz"
      sha256 "46652de29e69cc48b2ca032a0e888391fc2a53b7e49006e65288aa551ba7f49a"
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
