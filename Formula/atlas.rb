class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.11.0/atlas-darwin-aarch64.tar.gz"
      sha256 "967fc4434cb75920bba3e7e7f927d24b2bcebbb95c7a07d988a3fcf21145bd8c"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.11.0/atlas-darwin-x86_64.tar.gz"
      sha256 "02b7ff749ef03df350b581a14257cb16ecccc11898eebe6c530a842d956c1282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.11.0/atlas-linux-aarch64.tar.gz"
      sha256 "b08ed5c0cb5a96759fef8d1a8051ff11701688940e2f3beaee09b56379016720"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.11.0/atlas-linux-x86_64.tar.gz"
      sha256 "23038afa90f25b7b84d48c0a2accdc2ff86618c66982857e92c554a869920000"
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
