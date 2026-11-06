cask "nudge" do
  version "1.0.0"
  sha256 "64af8b13c99b40bb49ecafe981e3270d46fa175a76afe228ee062a437b3b0c65"

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
