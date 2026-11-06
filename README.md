# homebrew-nudge

Homebrew tap for [nudge](https://github.com/jb55/nudge), which posts macOS
notifications from the command line, from an app with its own icon.

```
brew install --cask jb55/nudge/nudge
nudge --title Hello --message "from the command line"
```

The cask installs a notarized `Nudge.app` into `/Applications` and links
the `nudge` command onto your PATH.
