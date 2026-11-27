class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.119.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.0/atlas-darwin-aarch64.tar.gz"
      sha256 "57e724aaf7601d9200d6d2e7d3ce60374f6450f9a4c1a61c10aa613d5a0934f8"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.0/atlas-darwin-x86_64.tar.gz"
      sha256 "0ad0310954d5ca7350dd2772667a0693ced9fb553d80e9f9c1b7e7d7871ff9df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.0/atlas-linux-aarch64.tar.gz"
      sha256 "b9f030d50e7e2b780626f527107344c08a963c8eff9866ae08eded75e641f236"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.119.0/atlas-linux-x86_64.tar.gz"
      sha256 "65147e485891c96ac370c02edefa6601380066640077e550d68edf0d86f63c80"
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
