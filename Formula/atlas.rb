class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.105.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.0/atlas-darwin-aarch64.tar.gz"
      sha256 "8c149df099107a39eed092634935d4d231644af1f369754e9aff7a7ff47c0ad4"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.0/atlas-darwin-x86_64.tar.gz"
      sha256 "cea77ded9bf8fe52a08dac960a9c0fe148541ab8c642998e8c40cbc1248193ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.0/atlas-linux-aarch64.tar.gz"
      sha256 "3688e19fab793d30b128999049ec69b89f911c9c0b27bc40172d0025e1841948"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.105.0/atlas-linux-x86_64.tar.gz"
      sha256 "075d6ae608e58a2a3e5abeeb734b20dab22f153d4742b48a3fa72015d19b8e47"
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
