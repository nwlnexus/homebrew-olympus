class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.1/atlas-darwin-aarch64.tar.gz"
      sha256 "75394003d81130beba0d73b0a8f7bff1b4a0cde693011652a34247c94a65f96a"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.1/atlas-darwin-x86_64.tar.gz"
      sha256 "6f72ff480916580103dc79dca00a500831425cb0459ddd82538cad74120e2be8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.1/atlas-linux-aarch64.tar.gz"
      sha256 "32f82ac78c324be62cd5a57dbc24e0be51105b68a8033ec31363cb43ce738bd8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.19.1/atlas-linux-x86_64.tar.gz"
      sha256 "9c7024941e42ac3d42ea590f799331cd5405d888b8baa4434d906172de1c0389"
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
