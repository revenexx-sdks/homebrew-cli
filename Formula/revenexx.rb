# revenexx — the revenexx-sdks/cli CLI, as a Homebrew formula.
#
# Generated on release by revenexx-sdks/cli's scripts/publish-homebrew-formula.sh.
# Do not edit by hand: the next release overwrites this file.

class Revenexx < Formula
  # Homebrew style: no trailing period, and never lead with the formula name.
  desc "Command-line interface for the Revenexx platform"
  homepage "https://github.com/revenexx-sdks/cli"
  version "0.7.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-arm64"
      sha256 "4501766e050cda6c1a981b6ccf28f46280b751beb12549a858feaed109596221"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-x64"
      sha256 "033dbba0d6f1283a4bb32a37a47a357d0979e1561f7ebab5da74c8801ce72e6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-arm64"
      sha256 "02496982bfa1fb4e3300f92ac558d560ed486981dc2bf7ee8406a2460c76b399"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-x64"
      sha256 "8d56c60cce43b5a049728619189c2a58327c5cca36a3d1c260b9eff22afcfdeb"
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
