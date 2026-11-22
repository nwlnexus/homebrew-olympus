class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.96.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.96.0/atlas-darwin-aarch64.tar.gz"
      sha256 "12ff88a5752b93d25ea4a74b47e724051f58be5915fdb4084b07fc584aca9f6b"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.96.0/atlas-darwin-x86_64.tar.gz"
      sha256 "6699f765e8fa44816465a4f72cece0a2847ec0c0c6d9f661ee4214e2807d7f51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.96.0/atlas-linux-aarch64.tar.gz"
      sha256 "af445b4f99b698ea1153ebafc682f91c7b7f256333912ca0d8810fa42ee9c716"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.96.0/atlas-linux-x86_64.tar.gz"
      sha256 "f94cafd1d572a43bf6aa69857851a0df777d89f9fb73be3fce02cfd4133ff98b"
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
