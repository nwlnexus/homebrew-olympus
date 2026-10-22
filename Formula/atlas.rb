class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.46.0/atlas-darwin-aarch64.tar.gz"
      sha256 "e4daad94cb7d94659897416b055aa9713908276e32ccc6919341f0ea658f88c9"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.46.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8f3d9444818fb9d5e0c67317983d73dc3b02e6433630cb502fd07e4785fc7692"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.46.0/atlas-linux-aarch64.tar.gz"
      sha256 "734f4ea7d24cb5f506a2207f49f04acf43916b341d7c5f76e7b8111ffc04a160"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.46.0/atlas-linux-x86_64.tar.gz"
      sha256 "e38f18a9611ad571c2b653a556b89300ad61a67237e904573d6eea2e2cd504f0"
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
