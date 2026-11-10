# revenexx — the revenexx-sdks/cli CLI, as a Homebrew formula.
#
# Generated on release by revenexx-sdks/cli's scripts/publish-homebrew-formula.sh.
# Do not edit by hand: the next release overwrites this file.

class Revenexx < Formula
  # Homebrew style: no trailing period, and never lead with the formula name.
  desc "Command-line interface for the Revenexx platform"
  homepage "https://github.com/revenexx-sdks/cli"
  version "0.7.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-arm64"
      sha256 "0d5c3b39a1223a510950a36bc2c573e22ff8a0fde8c91c22174cab15527c9970"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-x64"
      sha256 "4128fbac3d3255fc91bb5411e295b51c6ed0a3fa1272afc0c160b7cd8779c957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-arm64"
      sha256 "2c9ff3999fd30db279871e0aae3c45b505b16ce8900f93eaa17e74d266529528"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-x64"
      sha256 "60e98956f2ba799ad4e8fc065fd24906dda7db369f04df3407f95dc38a45b789"
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
