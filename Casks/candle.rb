# Homebrew cask for Candle. The release workflow fills in 0.1.1 and
# af5d77a95ce674dde81ef376aec58b6251a558c5c9135a0f6aa9351b0666efb4 and pushes the result to github.com/lmtrarbach/homebrew-candle.
cask "candle" do
  version "0.1.1"
  sha256 "af5d77a95ce674dde81ef376aec58b6251a558c5c9135a0f6aa9351b0666efb4"

  url "https://github.com/lmtrarbach/candle/releases/download/v#{version}/Candle-#{version}-macos-arm64.dmg"
  name "Candle"
  desc "Plan and write novels, chapter by chapter and scene by scene"
  homepage "https://candlewriter.com/"

  depends_on arch: :arm64

  app "Candle.app"

  # Project backups in ~/Library/Application Support/Candle are left alone.
  zap trash: [
    "~/Library/Preferences/com.candle.Candle.plist",
    "~/Library/Saved Application State/io.github.lmtrarbach.candle.savedState",
  ]

  caveats <<~EOS
    Candle isn't notarized by Apple. The first time you open it, macOS says it
    "can't be verified": open System Settings → Privacy & Security and click
    Open Anyway. You only need to do this once.
  EOS
end
