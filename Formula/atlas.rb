class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.97.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.0/atlas-darwin-aarch64.tar.gz"
      sha256 "8ef6661f42a01c805c546ec56d2078fd957370f41f808367170e28b40ef09e4f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.0/atlas-darwin-x86_64.tar.gz"
      sha256 "06a1d69cf1e8cf53df41c6fcb0021bc2dba965d9d7aaaf238135518d3f6d6c48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.0/atlas-linux-aarch64.tar.gz"
      sha256 "65e40e2184674e34918b635259fee29fc5a472e240deed05761ab0b607dc432f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.97.0/atlas-linux-x86_64.tar.gz"
      sha256 "c1d4d29dfcef083b8fb00db35a6b3df9fda4e75711d0920c26d48e8ffcf06880"
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
