class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.23.0/atlas-darwin-aarch64.tar.gz"
      sha256 "8b69f3baf689d242a58907b6994717e008fb7f45d66b13c196c42d6cf7a10977"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.23.0/atlas-darwin-x86_64.tar.gz"
      sha256 "19db838f7ea4bea2aa9cfbc63d0aabd283d5d75a99e077ab1fdc01d047b3782c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.23.0/atlas-linux-aarch64.tar.gz"
      sha256 "151ad9552a7bea1e6960136d42a60298725432b0a1c6007409aa237ef9b0a3d7"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.23.0/atlas-linux-x86_64.tar.gz"
      sha256 "7e650df88ab3e202db3fd64a15a328280c199d5e46dfabcaa880923ed1cdd67d"
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
