# revenexx — the revenexx-sdks/cli CLI, as a Homebrew formula.
#
# Generated on release by revenexx-sdks/cli's scripts/publish-homebrew-formula.sh.
# Do not edit by hand: the next release overwrites this file.

class Revenexx < Formula
  # Homebrew style: no trailing period, and never lead with the formula name.
  desc "Command-line interface for the Revenexx platform"
  homepage "https://github.com/revenexx-sdks/cli"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-arm64"
      sha256 "89d4512c8a431ebcc412d37183d19a860318d4920aaf5c6ad64de9f139fa6378"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-x64"
      sha256 "fb6865f360938194cee6d363fb5fa563a29f2d803364f4c9aabe194a6f19a31b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-arm64"
      sha256 "52199f83891e0284f5f2e2d5e9d5180d069cdff36377be948123161c98108154"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-x64"
      sha256 "02c601bbd15c35fd6554496d98c4152b452003811c00e6411434183b5375e44d"
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
