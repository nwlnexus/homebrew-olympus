class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.77.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.77.0/atlas-darwin-aarch64.tar.gz"
      sha256 "b09bb2ba048afdf8ce10fe310ae9b1a67414ed3b9727b8a5036f3a8e3520ce05"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.77.0/atlas-darwin-x86_64.tar.gz"
      sha256 "3236e2906bcba966837d68ed231024e2dd588fe058c2d02c2c8b3d35186ecd42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.77.0/atlas-linux-aarch64.tar.gz"
      sha256 "ef309fb6bbc61200ab904f11eb93d45a30f5c3acad2c73f8b3b496586d4f80b7"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.77.0/atlas-linux-x86_64.tar.gz"
      sha256 "c9b49c007a2a42385bce793c54f782f2979ad8b5ab959eea0c60325f9c167324"
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
