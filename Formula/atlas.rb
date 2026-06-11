class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.2/atlas-darwin-aarch64.tar.gz"
      sha256 "96f7f6182df5ecdb0491c12b415ee3797a284b29aaae57fa8f9603a5fe47e57a"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.2/atlas-darwin-x86_64.tar.gz"
      sha256 "a99915784581f3451164a83fef4e309657de36b64f61dd475daa29017bb1ecce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.2/atlas-linux-aarch64.tar.gz"
      sha256 "7be7c73c01c42e02d0afe44f66644a51af29211173ab1929f9eb0715d0a9f858"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.4.2/atlas-linux-x86_64.tar.gz"
      sha256 "a4aa8af46ea9336aa23ecaa13e5e5cc3bf96487f19561f3a664c166ab98346c3"
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
