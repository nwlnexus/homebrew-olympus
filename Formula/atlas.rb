class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.0/atlas-darwin-aarch64.tar.gz"
      sha256 "5d40b0676a501d1397400c4f6887767d6ef8221860d4bfea954d167e1c43d80b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.0/atlas-darwin-x86_64.tar.gz"
      sha256 "47ed2d646a7fdbd710ba6fbde335d67bd05a44cf84ac6c4674ad19300febc9e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.0/atlas-linux-aarch64.tar.gz"
      sha256 "f7bdee34b097ef4eb10c649eb8cbe0138249fc1bac9c9d4745154bd25288cdec"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.47.0/atlas-linux-x86_64.tar.gz"
      sha256 "f5f0e787bcd0b6c0046edca4b39927640f6e09b6b27c89f7205729f5b3426e4c"
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
