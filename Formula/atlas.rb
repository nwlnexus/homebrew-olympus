class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.115.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.1/atlas-darwin-aarch64.tar.gz"
      sha256 "7a9f870a944c302f12aa09cd9eadb658ff8e84f92b4f4dbc66bf877857e4969d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.1/atlas-darwin-x86_64.tar.gz"
      sha256 "c18444ef5ea04ab260d75f1ec4ec30eb61395412dc303539fe1e3973a3abd591"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.1/atlas-linux-aarch64.tar.gz"
      sha256 "d60fd835219c20f2717358c56b88e7a13a0bda488d1fd57651ee94a3493b8fa5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.115.1/atlas-linux-x86_64.tar.gz"
      sha256 "0993d6eaf0a0f3f191810da4fd0c876d5662c97f5964ec0b17f64be49e3d4f09"
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
