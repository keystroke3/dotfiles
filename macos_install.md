 # Mac os setup instructions

 - Install xcode through appstore
 - download homebrew package file from homebrew github
 - install cli tools using xcode
 - install homebrew using package file downloaded before
 - install packages using homebrew: 
    - fd
    - ripgrep
    - neovim
    - zsh-vi-mode
    - bat
    - middleclick
    - gnupg
    - keepassxc
    - mpv
    - copyq
 - git clone dotfiles
 - symlink dotfiles/.config to ~/.config
 - git clone nvim config to ~/.config/nvim


## Install Kanata

1. Install kanata and Karabiner-Elements:
   ```bash
   brew install kanata
   brew install --cask karabiner-elements
   ```

2. Open Karabiner-Elements once and grant all permissions it requests (Input Monitoring, Accessibility). You don't need to configure anything in it — it just needs to start its background daemons.

3. Activate the virtual HID driver:
   ```bash
   sudo /Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate
   ```

4. Approve the driver: System Settings → General → Login Items & Extensions → Driver Extensions → enable `org.pqrs.Karabiner-DriverKit-VirtualHIDDevice`

5. Grant kanata permissions:
   - System Settings → Privacy & Security → Input Monitoring → add `kanata`
   - System Settings → Privacy & Security → Accessibility → add `kanata`

6. Install the launchd daemon (runs kanata as root at boot, no sudo needed):
   ```bash
   sudo cp ~/.config/kanata/org.kanata.plist /Library/LaunchDaemons/
   sudo chown root:wheel /Library/LaunchDaemons/org.kanata.plist
   sudo chmod 644 /Library/LaunchDaemons/org.kanata.plist
   sudo launchctl load /Library/LaunchDaemons/org.kanata.plist
   ```

7. Verify it is running:
   ```bash
   sudo launchctl list | grep kanata
   tail /var/log/kanata.log
   ```
   The first column of `launchctl list` should show `0` and a PID.

To reload after editing the config:
```bash
sudo launchctl unload /Library/LaunchDaemons/org.kanata.plist
sudo launchctl load /Library/LaunchDaemons/org.kanata.plist
```

