class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.68.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.68.0/atlas-darwin-aarch64.tar.gz"
      sha256 "aea8bad29634ac26a05b22e1571eb391b2eef31abb99c03ada32c79d554cb2da"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.68.0/atlas-darwin-x86_64.tar.gz"
      sha256 "69ef2bf52433cbdaf8cc654e58d68bdd51dce8e5ec68e433e414864cb95d9370"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.68.0/atlas-linux-aarch64.tar.gz"
      sha256 "7be18bfd8a3f86db78d29c77023ba8542e54d1f711844d43df49f53ca29ec66d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.68.0/atlas-linux-x86_64.tar.gz"
      sha256 "3ac9cc5ed02ce4fb07ab30980707e5c62238f422f75a9ce752fd4e20676d0fbc"
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
