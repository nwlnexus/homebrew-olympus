class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.3/atlas-darwin-aarch64.tar.gz"
      sha256 "bc2a59c5944a7dd18ef2282421d7479cfa656323504842fe00f2a9c76755449c"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.3/atlas-darwin-x86_64.tar.gz"
      sha256 "e0ee6852610c4ca3e49b21a7f4ba94f47164728acc1f7ce813b9d954bc359138"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.3/atlas-linux-aarch64.tar.gz"
      sha256 "943c5071a3adb99adcdb4ffa854e15e49c4fd3888d240428839e0160aa52d5a1"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.3/atlas-linux-x86_64.tar.gz"
      sha256 "e0047f8c51d130a0250be24890a9a49f6100dd4276101a8c6f53337eae0231f6"
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
