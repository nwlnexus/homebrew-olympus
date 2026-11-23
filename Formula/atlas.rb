class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.100.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.100.0/atlas-darwin-aarch64.tar.gz"
      sha256 "815e7afde2680c19b5d5d49fc0f72615a17ab5a635195b38879befbe34b51cc6"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.100.0/atlas-darwin-x86_64.tar.gz"
      sha256 "ef1bf28e9828fb9f9f53c5d7fb84d1f5b6d609516f63e4d00e131613c79a55ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.100.0/atlas-linux-aarch64.tar.gz"
      sha256 "363f315fa4e96b9e37ac79c9ddfec86013b350324ba21cfdecd70be17bb2024f"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.100.0/atlas-linux-x86_64.tar.gz"
      sha256 "5054efa881ece7cbe6e2a3ea9939cb196111dc1b99c80151e3a62cba8e7b4ab5"
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
