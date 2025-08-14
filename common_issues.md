On this page, you’ll find a detailed FAQ covering various topics related to EeveeSpotify, answers to common questions, and more.

# Versions and Support

If you have a paid certificate from a signing service, you can install the version with the patched prefix, which will fix widgets. If you don’t need widgets or are using AltStore, SideStore, Sideloadly, or TrollStore, install the original version.

EeveeSpotify officially supports both Spotify versions 8.9.8 and 9.0.48 (the last versions that run on iOS 14 and 15). If you are on either of these two OS versions, jailbreak your device and install the latest .deb from the releases on GitHub, along with the latest available Spotify from the App Store. Reset data within the EeveeSpotify settings afterwards so it will patch Premium.

EeveeSpotify only supports iOS and iPadOS and is not planned to be supported on other platforms. You can sideload the iPadOS version on an Apple Silicon Mac, though.

EeveeSpotify versions are released automatically alongside Spotify versions on the App Store and are uploaded to the [EeveeSpotify IPAs](https://t.me/SpotilifeIPAs) Telegram channel. If you would like to make your own IPA, make sure you inject the SwiftProtobuf, Orion, and CydiaSubstrate frameworks.

## CarPlay, Siri and Dynamic Island/Lockscreen

To use CarPlay, you need to either install the tweak on a jailbroken device, use TrollStore, or have a paid certificate with a CarPlay entitlement. Some additional setup steps may be required, which are described in the [related issues](https://github.com/whoeevee/EeveeSpotify/issues?q=CarPlay%20sort%3Acomments-desc).

To use Siri, you need to either install the tweak on a jailbroken device, use TrollStore, or have a paid certificate with a Siri entitlement.

If you’re using a paid certificate, to navigate to a song from the lock screen, control center, or Dynamic Island, and to use Spatial Audio or Siri, change the app and bundle identifiers to match your provisioning profile (https://github.com/whoeevee/EeveeSpotify/issues/32).

# Feature Requests

EeveeSpotify does not accept free feature requests. If you need something, feel free to implement it yourself, or submit a pull request if you think others may find it useful. If you’re willing to pay for a feature, open an issue to discuss further opportunities.

Read the [Restrictions](https://github.com/whoeevee/EeveeSpotify?tab=readme-ov-file#restrictions) to learn which Premium features are server-sided and will never work without a Premium subscription.

# Troubleshooting & Issues

## Something Went Wrong

If you're unable to sign in, see [the reason and workarounds](https://github.com/whoeevee/EeveeSpotify/blob/swift/something-went-wrong.md).

## Lyrics Not Showing Up

If you see the “Couldn't load the lyrics for this song” message and no lyrics load, try resetting the data within the EeveeSpotify settings. If that doesn't help, go to the Patching section and enable Overwrite Configuration.

## Premium Not Working

If all tracks are skipped, a song stops as soon as you play it, songs play in a random order, you see the “You discovered a Premium feature” popup when trying to play a song, or you encounter other restrictions:

You can only use Spotify abroad for 14 days. Connect to a VPN server in any country, change your region at accounts.spotify.com, then sign out and log back into Spotify with the VPN enabled.

This issue is solely related to your account region, and there are no other solutions. Do not enable “Overwrite Configuration” or make any other changes. If your region is already set, still connect to a VPN, change your region to some else, sign out, and then log back into the Spotify app.

## Downloading

Downloading is not, and will never be, implemented in EeveeSpotify. While it is technically possible to intercept the audio stream or use third-party APIs, downloading simply will not be included in EeveeSpotify: the developer uses SoundCloud.

However, opening a pull request is always welcome. If you are a developer and manage to implement downloading that works flawlessly and natively (without third-party menus, UI elements, etc.), you will be considered a true legend and mentioned at the top of the README, contributors screen, and elsewhere.

You may see a “Download local playlist” option. This is specifically for downloading playlists that contain only local tracks from your PC within a Wi-Fi network.

Any issues regarding downloading of any kind will be closed.

## Spotify Connect

It is known that when using Spotify Connect, you may encounter ads, be unable to skip tracks, and experience other limitations. The music is streamed directly from Spotify’s cloud to the connected device, while your phone acts only as a remote control. This is beyond EeveeSpotify’s control. If you want to avoid these limitations, use Bluetooth instead.

## Ads on Homescreen

You may see ads on the home screen. This is a known issue and will not be fixed, as it is a real challenge. To learn more, read the contents of issue https://github.com/whoeevee/EeveeSpotify/issues/422.

## Ads in Podcasts

You may see ads in podcasts. It’s surprising, but this is Spotify’s default behavior, even on Premium accounts. This won't be fixed, just skip the ads.