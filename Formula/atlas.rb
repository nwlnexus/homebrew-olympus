class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.86.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.86.0/atlas-darwin-aarch64.tar.gz"
      sha256 "3ee46e284b191f6570cc877cefc5945f44f12f5d7421fdbfbffdbd579fefa244"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.86.0/atlas-darwin-x86_64.tar.gz"
      sha256 "99efc09cd7cd3957776e1722ab52748bdbe60560fb5cd455c08d133f4f77e7aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.86.0/atlas-linux-aarch64.tar.gz"
      sha256 "35fc58f05c5dc65f39b838f15d262ff7111965dd03976391e50c2e45faeb2e66"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.86.0/atlas-linux-x86_64.tar.gz"
      sha256 "1c5cc96d44d01321c2e246ffb1506450eaf8b442388b1854cfd30472c758fa75"
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
