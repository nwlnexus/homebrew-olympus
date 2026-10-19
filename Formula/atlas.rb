class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-darwin-aarch64.tar.gz"
      sha256 "87d45e699467869068ebf2d074cb8f611bac3dbdbc83cabd162971ba23714b92"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-darwin-x86_64.tar.gz"
      sha256 "08e7b6474eae27e2792c1568719647ef2d821ebd496c2292a2c8b09be3edfa4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-linux-aarch64.tar.gz"
      sha256 "6dc1ebeb9940ef4f0760d2072524c9082717b74c8320a14e31fa4487669a4d29"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.27.0/atlas-linux-x86_64.tar.gz"
      sha256 "c8180af7301bcd8ec6d4e2d04a52e1a89024465328d01b4f50e7f7c059544376"
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
