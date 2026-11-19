class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.87.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.87.0/atlas-darwin-aarch64.tar.gz"
      sha256 "e4552c30fd6058ca418e4e565dee52b534bace547581a323dabd383889ad868b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.87.0/atlas-darwin-x86_64.tar.gz"
      sha256 "43f42df557c6a7cdfd43bf4bcbdc17c17c8be78a92d63802c16a54e7c715a67d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.87.0/atlas-linux-aarch64.tar.gz"
      sha256 "e467effc32774cf31d575bd7a85b7a4a2287dfe733f67564c0e839b32d0135cb"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.87.0/atlas-linux-x86_64.tar.gz"
      sha256 "5e911b2541e9c8cb34a31abce29c23342b974dbeaac84189e83a409eeba58acb"
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
