class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.105.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.1/atlas-darwin-aarch64.tar.gz"
      sha256 "3624887b353daaafb753a42df40ff1ef31c061a4bcaea93ca1fdc06897b825cb"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.1/atlas-darwin-x86_64.tar.gz"
      sha256 "bb5c2ba479e4e95aed05289b8034fde99c2cf33b1a30ff2b86e181499cfe03b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.1/atlas-linux-aarch64.tar.gz"
      sha256 "440c617e737b2b37c3d5bb34b2048191b4945252ac382012c9b7e89d2607bcd8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.1/atlas-linux-x86_64.tar.gz"
      sha256 "880532af4a06fed616369b3ff599350b45797a48a5a53255ae9fd8c7e1ee3484"
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
