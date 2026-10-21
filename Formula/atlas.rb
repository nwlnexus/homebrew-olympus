class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.42.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.1/atlas-darwin-aarch64.tar.gz"
      sha256 "fb1687147d02af296447b162b6e875659cccb042b60dfcec56abb5740bcda984"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.1/atlas-darwin-x86_64.tar.gz"
      sha256 "eea544f3c4d02c14096ea9ed43d8fd45bdaa22f71b4c531d844015a85e73f8de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.1/atlas-linux-aarch64.tar.gz"
      sha256 "5eabdb5859120d2cbeedbe8d2b7029377073266b8a04dbf3f7e4e9cbf5db9ad0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.42.1/atlas-linux-x86_64.tar.gz"
      sha256 "91cfaa81ebafffafcb4e541bc351248ebf783d21acc536d5b8ad7514dd06d23f"
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
