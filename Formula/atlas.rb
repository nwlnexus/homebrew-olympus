class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.13.0/atlas-darwin-aarch64.tar.gz"
      sha256 "03c3d9cced3360abbe416cd4ca3e1c874064be6ad415cdf5b0ec4ae24313e9e2"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.13.0/atlas-darwin-x86_64.tar.gz"
      sha256 "e321e13c83c04ab4f13571f36333c3572af1cb46fc6403b5bd77992b71ec42df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.13.0/atlas-linux-aarch64.tar.gz"
      sha256 "639de6047aa904555b440c22e9a06fe832b81ecb18a07345122055120a983954"
    else
      url "https://dl.nwlnexus.net/releases/atlas/atlas-v0.13.0/atlas-linux-x86_64.tar.gz"
      sha256 "e761a440e5b6084060e10cb7aedb6b1dd3200c5bb633938fdcecfc83bd5283b4"
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
