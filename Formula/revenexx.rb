# revenexx — the revenexx-sdks/cli CLI, as a Homebrew formula.
#
# Generated on release by revenexx-sdks/cli's scripts/publish-homebrew-formula.sh.
# Do not edit by hand: the next release overwrites this file.

class Revenexx < Formula
  # Homebrew style: no trailing period, and never lead with the formula name.
  desc "Command-line interface for the Revenexx platform"
  homepage "https://github.com/revenexx-sdks/cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-arm64"
      sha256 "0cebf6fea8c971b12708d605e1dc5272bac25483c798c19d0ad36f6b16d67a9f"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-x64"
      sha256 "445c2a59bc45e4fb4dfb69d8877a823e2289593982e95f629fbd99f3c5cbcd01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-arm64"
      sha256 "06ceb79c8d236040a1b408773109fb8dc5501bee5948d966be38d95354416dcf"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-x64"
      sha256 "5ec2f527eea84d7be62dd9367fc14cff0e981071d533c7205263987030bdca4c"
    end
  end

  def install
    # The release assets are bare, per-platform binaries, so the staged file
    # carries the asset name — rename it to the plain executable name.
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    bin.install "revenexx-#{os}-#{arch}" => "revenexx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/revenexx --version")
  end
end
