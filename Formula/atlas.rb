class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.64.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.64.0/atlas-darwin-aarch64.tar.gz"
      sha256 "89458439e9aab5352b2d03519f5d52ebeb13534182654c102351413ca4a1d268"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.64.0/atlas-darwin-x86_64.tar.gz"
      sha256 "f50233a917e64cf55ad61c902b1c8d68d754141e90c8fdf0a55e405289c99b6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.64.0/atlas-linux-aarch64.tar.gz"
      sha256 "43a4e27202a65e81243da392db56e5942f9e5822f1987866fe443f5393d35c34"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.64.0/atlas-linux-x86_64.tar.gz"
      sha256 "d0437e509f7ac186bf94b144d71a9bafbb57a62f147f643020a913eed2178df9"
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
