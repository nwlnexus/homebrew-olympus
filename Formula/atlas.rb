class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.111.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.111.0/atlas-darwin-aarch64.tar.gz"
      sha256 "a0af783f01b6637087814164ac1202388494f8c9f2d6798b6d897e9be868df15"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.111.0/atlas-darwin-x86_64.tar.gz"
      sha256 "426ec2a80d82cfb16f733c5039f3f1ea1f8064788aa401e1271ad383f8880efe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.111.0/atlas-linux-aarch64.tar.gz"
      sha256 "b948576babd1a9f49dab565acda38391da17d6f729e403b13fc40511b9e04f9f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.111.0/atlas-linux-x86_64.tar.gz"
      sha256 "7e730893aad751b546db99603d511d9d5e1f11a221459eb20bedbd7e5bb3abab"
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
