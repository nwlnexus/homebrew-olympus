class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.63.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.1/atlas-darwin-aarch64.tar.gz"
      sha256 "5fa5aabbe23541773ead33c5608981aa52280bbdf43264f07f10f3cb73bc9f4d"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.1/atlas-darwin-x86_64.tar.gz"
      sha256 "342d4e584f26c4f5a07c8ba0ad7a0a272b26e802fba73c494dbcbc3011fe79c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.1/atlas-linux-aarch64.tar.gz"
      sha256 "ca650a17a9b0d84d0543b7cc4272464673db95b3a8c73199055f3a0b72c73625"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.63.1/atlas-linux-x86_64.tar.gz"
      sha256 "2ef1122e1f688bcc7763b210eedf5085a15bba071bbb485d79724ff24c75a126"
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
