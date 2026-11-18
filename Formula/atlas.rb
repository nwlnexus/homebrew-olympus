class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.70.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.70.0/atlas-darwin-aarch64.tar.gz"
      sha256 "64fde73c9a21d104f22dac9284b1a4691ccde6c495fb2495d28b27e327744062"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.70.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d96bafd53d3ed699fdcb5bae75d732cd6c757162194d92e8347c368471f5dc5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.70.0/atlas-linux-aarch64.tar.gz"
      sha256 "9c726a21f939e2fa7e5bda4108274d04b853688759c085e87a24b11f5a84ccc1"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.70.0/atlas-linux-x86_64.tar.gz"
      sha256 "81861770229c1d389794e7270249021650298bcf7e963b3d2bb19a8f36d2ca31"
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
