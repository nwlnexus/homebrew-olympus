class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.13/atlas-darwin-aarch64.tar.gz"
      sha256 "06442074b8d5a1f3177b93984af99361306a4daec66962768910ee3858795938"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.13/atlas-darwin-x86_64.tar.gz"
      sha256 "6c88bc175a472ac497f86a76f3ba336939d15a42353642c21927ed4bde30783f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.13/atlas-linux-aarch64.tar.gz"
      sha256 "52c04986d267fc99a6b8bd6cc6db022b72d8b7449cef9ddade7d0343a1c56d73"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.3.13/atlas-linux-x86_64.tar.gz"
      sha256 "fa52032bcc5485a13ad4987cf112ee32fbf6c822a1957fb0ab536e7a07b058a6"
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
