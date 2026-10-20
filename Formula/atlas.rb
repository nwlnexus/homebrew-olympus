class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.0/atlas-darwin-aarch64.tar.gz"
      sha256 "ac086c9729281c4740daf28f0877a73b54db72969581a95b023bf01f1b636af4"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8796f1138308afcc06fc884a13bc0a54eec3364b321860bdd70fc2bdfa75d84a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.0/atlas-linux-aarch64.tar.gz"
      sha256 "255b84ca944e7677037989399242ca3463fe7251f01ab715ac4e37a8d87a8c0c"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.37.0/atlas-linux-x86_64.tar.gz"
      sha256 "247bd5c2733b39c9e2c005df998f014fc585e8f4dfae36c373963ec95d89049c"
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
