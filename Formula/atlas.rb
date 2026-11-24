class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.103.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.103.0/atlas-darwin-aarch64.tar.gz"
      sha256 "a744acf97ec6c46bdb88d052884f53e90adab6a13186bc821162d2bb84e5bab0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.103.0/atlas-darwin-x86_64.tar.gz"
      sha256 "93e8751b8f4b0246bf99ad8c012be9bd1bf1ff66a026fc5b534341da8003dc91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.103.0/atlas-linux-aarch64.tar.gz"
      sha256 "18c4b3141ce4410d42a90f18682734c2493b131e5bbc1f441573daa95e7b4483"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.103.0/atlas-linux-x86_64.tar.gz"
      sha256 "57bb64ecc4023f02f32d50a5b70cd2c1ba5caea9131d1fc121a369399f027af3"
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
