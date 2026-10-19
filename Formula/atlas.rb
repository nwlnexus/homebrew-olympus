class Atlas < Formula
  desc "Operator CLI/TUI for the Olympus homelab"
  homepage "https://github.com/nwlnexus/olympus-sdk"
  version "0.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.29.0/atlas-darwin-aarch64.tar.gz"
      sha256 "2714abc2f5da77ef4a447546a83e1aa87ca8a315d8b55353e752dadc3e8c3046"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.29.0/atlas-darwin-x86_64.tar.gz"
      sha256 "3a973e3ec0e5c49e993985abdbb79ad9d73722e6727aecf576aa31936c20dac2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.29.0/atlas-linux-aarch64.tar.gz"
      sha256 "12d203db6da666e14ce6677ae823be683455936856f392510d705edd5ba2a990"
    else
      url "https://dl.nwlnexus.io/releases/atlas/atlas-v0.29.0/atlas-linux-x86_64.tar.gz"
      sha256 "a3ac6256267e60c4794ce28dddf5a1da7f8a16676374277701c9e850dc03082c"
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
