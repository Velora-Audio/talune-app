cask "talune" do
  version "1.2.0"
  sha256 "add27e28ad79d2637121a8b5f74054b0a06fe38afb9c04997fe2c7c69e0bb5e1"

  url "https://github.com/Velora-Audio/talune-app/releases/download/v#{version}/Talune_#{version}_universal.dmg"
  name "Talune"
  desc "Desktop client for Talune"
  homepage "https://github.com/Velora-Audio/talune-client"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Talune.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Talune.app"],
        must_succeed: false
  end

  uninstall quit: "com.talune.client"

  zap trash: [
    "~/Library/Application Support/com.talune.client",
    "~/Library/Caches/com.talune.client",
    "~/Library/HTTPStorages/com.talune.client",
    "~/Library/Preferences/com.talune.client.plist",
    "~/Library/Saved Application State/com.talune.client.savedState",
    "~/Library/WebKit/com.talune.client",
  ]
end
