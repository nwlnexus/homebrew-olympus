class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.45.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.1/atlas-darwin-aarch64.tar.gz"
      sha256 "1cdc2879c4dfde934de265b0f231ab7f1012114b30bdba2cb1a653fcba16779b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.1/atlas-darwin-x86_64.tar.gz"
      sha256 "45a87d0183e88a2ed45977d9d6048096a4043c685b7f8eb77feb3c2b131acbe3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.1/atlas-linux-aarch64.tar.gz"
      sha256 "542000655db8674027caa2fb408107a6bbeebf9179b0ca0359b28c76cc3d74ea"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.45.1/atlas-linux-x86_64.tar.gz"
      sha256 "e08185916116b3b704b4435f446e430e630810119fa758ebf0e5ee823c73eb7b"
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
