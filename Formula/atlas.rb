class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.99.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.99.0/atlas-darwin-aarch64.tar.gz"
      sha256 "a728606396e6f2bbd8e500d77bbcd8a04c6d69a4b2e9b66d40fafe15477ccb74"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.99.0/atlas-darwin-x86_64.tar.gz"
      sha256 "c2ab7fbf7519ab6036af9055414080b77ccf82ea8f98aaeb5c73ac7edaf34638"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.99.0/atlas-linux-aarch64.tar.gz"
      sha256 "afa9995ab7b426ae35baec0379333d3d673824f71025d3bfd1022ef749f521c9"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.99.0/atlas-linux-x86_64.tar.gz"
      sha256 "8ddbed8bcf6531274b0987395de9111c94c28711db4060a8ae7dab398b9f661d"
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
