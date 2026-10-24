class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.48.0/atlas-darwin-aarch64.tar.gz"
      sha256 "fee4a57b654cc87d474a6dd8eb17ec781b60444f6226a43c045a3ef8a931e7c5"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.48.0/atlas-darwin-x86_64.tar.gz"
      sha256 "0f634bb955c0aa89b50cf7d60d13b8b91bbc4285b33109eea195f64ec4074107"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.48.0/atlas-linux-aarch64.tar.gz"
      sha256 "88eaa004ac9a8999a808271b0d4015ece1dc0fcb7e870a4bebe9df36e54fb244"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.48.0/atlas-linux-x86_64.tar.gz"
      sha256 "f144121440e08d8e505593602e5542c18d89013d4a8df2b629275aeb916d491f"
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
