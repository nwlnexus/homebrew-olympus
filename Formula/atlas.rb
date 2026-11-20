class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.93.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.2/atlas-darwin-aarch64.tar.gz"
      sha256 "eca28994ff74bf55e9db5547fa78a3df26680adc455f7b984ef984b0b8e5830f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.2/atlas-darwin-x86_64.tar.gz"
      sha256 "d3b2cf6a9919b359a9600d610319293a25d50047701b36a856032f2f76455ce3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.2/atlas-linux-aarch64.tar.gz"
      sha256 "78ccedf092abc2c85b78af77c1ea39e945283a925715f794841917334147e3d6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.93.2/atlas-linux-x86_64.tar.gz"
      sha256 "f18e94f8c05ded806e8f3fbe146478c13787f026f31d0b4b39d3b072c3b46005"
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
