class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.113.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.113.0/atlas-darwin-aarch64.tar.gz"
      sha256 "d053d22b6cca8d148b55d19d0598cd19e3ca006024e089ecc40d669c56efcf21"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.113.0/atlas-darwin-x86_64.tar.gz"
      sha256 "038d1144dbb5049a3304fb84ff8ca15b4243e6cc2110cf3f692921f035c0ed5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.113.0/atlas-linux-aarch64.tar.gz"
      sha256 "d3f2377f92e256a27073e079c1217ed0e9ead50af24968726dc6c0d5181ee5ea"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.113.0/atlas-linux-x86_64.tar.gz"
      sha256 "32c90e2b99db7103abeb306a81f42f26a6573f9b890f1368376e49594bf6d364"
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
