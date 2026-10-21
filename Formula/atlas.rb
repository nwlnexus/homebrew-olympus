class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.0/atlas-darwin-aarch64.tar.gz"
      sha256 "052bc350dd91adc08ede08dd4731e7243be72ac803b6e1af1dba31ceaeb627e8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.0/atlas-darwin-x86_64.tar.gz"
      sha256 "6a8553be253f581d387925db954b28cf136b3cdead22ec4d6585a4f31eadaa40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.0/atlas-linux-aarch64.tar.gz"
      sha256 "b07b11cc579fc2b552ca7f717bb9a8eec2f0c1df0f86f1d813ad8103d37db8f5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.0/atlas-linux-x86_64.tar.gz"
      sha256 "7ea2aa5ba4c213e6024955ce8f1e67dfddd139d644f6b7873b31c79a964290cd"
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
