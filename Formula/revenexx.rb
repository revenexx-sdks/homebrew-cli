# revenexx — the revenexx-sdks/cli CLI, as a Homebrew formula.
#
# Generated on release by revenexx-sdks/cli's scripts/publish-homebrew-formula.sh.
# Do not edit by hand: the next release overwrites this file.

class Revenexx < Formula
  # Homebrew style: no trailing period, and never lead with the formula name.
  desc "Command-line interface for the Revenexx platform"
  homepage "https://github.com/revenexx-sdks/cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-arm64"
      sha256 "936269ee2be5e200f85f23d2034a91453355e4453a2123b3a1951ee9e45feefa"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-darwin-x64"
      sha256 "f87427d0cbaabdef58990b681f0b735a2d11a2849b69142c36c1042831d5cc37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-arm64"
      sha256 "ee3e5ab919f0894df0aaaa9e957e5a326935dfc88203bf60bc41493e35ae7450"
    end

    on_intel do
      url "https://github.com/revenexx-sdks/cli/releases/download/v#{version}/revenexx-linux-x64"
      sha256 "aab5935f6331f000445c8e6d9f349cf334aeb946da4dbf69ce1d36006dcf8dc0"
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
