cask "nudge" do
  version "1.0.1"
  sha256 "b8dfcc74ad57647ed9f09c74b9af28cf8e89208123c9e7ae785961811d17378d"

  url "https://github.com/jb55/nudge/releases/download/v#{version}/Nudge-#{version}.zip"
  name "Nudge"
  desc "Post notifications from the command-line, from an app with its own icon"
  homepage "https://jb55.github.io/nudge/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Nudge.app"
  binary "#{appdir}/Nudge.app/Contents/Resources/nudge"

  zap trash: "~/Library/Logs/nudge-actions.log"

  caveats <<~EOS
    Run this once to register Nudge with macOS and allow its notifications:
      nudge --authorize
    If no prompt appears and `nudge` exits 2, turn Nudge on in
    System Settings > Notifications.

    If you also built nudge from source into ~/Applications/Nudge.app, remove
    one copy: two registered apps with the same bundle id can make macOS
    relaunch the wrong one when a notification is clicked.
  EOS
end
