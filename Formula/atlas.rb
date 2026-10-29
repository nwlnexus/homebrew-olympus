class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-darwin-aarch64.tar.gz"
      sha256 "8d318896c93033e131f6d2dab7fa5e3a27c51f8b72af056e5c6a68fac9b1f1cc"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-darwin-x86_64.tar.gz"
      sha256 "d4efc6e2e55390da414713167fbb885c34a2e4b4349c18e521184d4d6db542f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-linux-aarch64.tar.gz"
      sha256 "3115892f39a8d13aa210be32de9b47c1645c65ddb3f16a934ad975951c5f4d00"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-linux-x86_64.tar.gz"
      sha256 "76d55f6b56405e35e3da0a9c79758378746db81b860ecbc6813ec17fd659bee7"
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
