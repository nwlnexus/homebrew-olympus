class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.19.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.2/atlas-darwin-aarch64.tar.gz"
      sha256 "014817b65d2dbc02c1eead2267eb6914532b9a51d91fa3857dd54f19c99c05f8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.2/atlas-darwin-x86_64.tar.gz"
      sha256 "f0f975f64f115baa5e5449ecfafd410126bf5a1e54b061abc57cdadd38202abf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.2/atlas-linux-aarch64.tar.gz"
      sha256 "badc58d7a0dc6dc8fd2f366fcd6dc788a3d38afbeb810403a5f2c4a8ebd35f79"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.2/atlas-linux-x86_64.tar.gz"
      sha256 "332e8afcd281f95d72f450f79762b2509eff401d2e0ab2eac9c4da99aefd93e6"
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
