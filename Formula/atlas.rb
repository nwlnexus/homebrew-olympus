class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.0/atlas-darwin-aarch64.tar.gz"
      sha256 "b6dd5e42e914f4c298d7ed10c0b2e608e13631d93795742c8511b98ec1aebbc0"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.0/atlas-darwin-x86_64.tar.gz"
      sha256 "835816b0b02298cc636fb4b689c056f8f1129aba9843d553ea334fed063829c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.0/atlas-linux-aarch64.tar.gz"
      sha256 "d667653990b2dc5fc2d8dbe2b4ff25301f75c6fb025e456f0e6eb43fd0890179"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.36.0/atlas-linux-x86_64.tar.gz"
      sha256 "e96c4bbe432bfc611d5e0b0463c966cf4d936356a331d2b3c24ebcef15c5bf1f"
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
