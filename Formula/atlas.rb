class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.14.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.1/atlas-darwin-aarch64.tar.gz"
      sha256 "21eb96efbd446522c1f5f80cb23accbc24aefe9fbb7243aec29f5bac86aa9c8a"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.1/atlas-darwin-x86_64.tar.gz"
      sha256 "7181558455958f711acfc297a600de5782018ae7e61b88b54e931499847b6584"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.1/atlas-linux-aarch64.tar.gz"
      sha256 "75d3e40af3664ec2077ed79690dfaf187c5921912c2cb93001af2c83227bc5f5"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.14.1/atlas-linux-x86_64.tar.gz"
      sha256 "c678d55a8d852901a921feb2d26a2e0758805a6846348bb089657fb41931e95d"
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
