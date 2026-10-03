class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-darwin-aarch64.tar.gz"
      sha256 "672ff4b2950d014fbb2c5aabbd92735458a87cb383a4752e1ad05f8e42df1341"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-darwin-x86_64.tar.gz"
      sha256 "8bb11976ab51b045924bff68e6e35fb4e6a0ed6ae5371f9971fd9e1c1f830b8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-linux-aarch64.tar.gz"
      sha256 "666d244ad539ed23d4c777ba2c75aceed6ed8ed33bc25bd87c8f398baa10982b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.17.0/atlas-linux-x86_64.tar.gz"
      sha256 "cf761fda462a70c61f9e6070923272f47c4880382e568e1e0c0d85928b419e1d"
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
