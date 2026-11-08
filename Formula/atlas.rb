class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-darwin-aarch64.tar.gz"
      sha256 "8847621ef2ebd52c2e668255d9c493dadfb93210f7c8922290254425b830c3cc"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-darwin-x86_64.tar.gz"
      sha256 "c1154dfec079c01f7e9c5a2e8c74e46d805af9527c344c656f03013662243aa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-linux-aarch64.tar.gz"
      sha256 "b231970bf6de27bcdc93561d8be006ca4a04ec462b77b859600dbfc71ec44542"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.56.0/atlas-linux-x86_64.tar.gz"
      sha256 "27a4d54bdaa86aabb1d403808ea90cde544e356547eeb6cb1575118b5c6c1f4c"
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
