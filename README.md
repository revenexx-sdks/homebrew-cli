# Revenexx Homebrew tap

Homebrew tap for the [Revenexx CLI](https://github.com/revenexx-sdks/cli).

Homebrew strips the `homebrew-` prefix from a tap repository name, so this repo
(`revenexx-sdks/homebrew-cli`) is addressed as the tap `revenexx-sdks/cli`.

## Install

```bash
brew install revenexx-sdks/cli/revenexx
```

That installs the prebuilt single-file binary for your platform (macOS and Linux,
Apple Silicon and Intel/x86_64) — no Node.js or npm required.

Verify:

```bash
revenexx --version
```

## Upgrade

```bash
brew update && brew upgrade revenexx-sdks/cli/revenexx
```

`revenexx update` detects a Homebrew install and runs those commands for you.

## Uninstall

```bash
brew uninstall revenexx
brew untap revenexx-sdks/cli
```

## How this tap is maintained

`Formula/revenexx.rb` is **generated — do not edit it by hand.** Every
[`revenexx-sdks/cli`](https://github.com/revenexx-sdks/cli) release runs
`scripts/publish-homebrew-formula.sh` from its publish workflow, which renders the
formula template with the release version and the sha256 digests of the published
binaries and commits the result here. The formula template itself lives in the
[SDK generator](https://github.com/revenexx/sdk-generator) at
`templates/cli/Formula/formula.rb.twig`.

Other installation methods (npm, install script, Scoop) are documented in the
[CLI README](https://github.com/revenexx-sdks/cli#installation).
