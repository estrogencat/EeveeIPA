In recent Spotify versions, the new reCAPTCHA SDK was integrated. It uses Apple's App Attest as part of its detection engine, generating keys within the Secure Enclave. The attestationObject includes the app's bundle and team IDs, which can be validated by Spotify's backend. When you sideload an app by any method, the teamID inevitably changes, resulting in App Attest failure.

However, this check is not strictly required at the moment. If Spotify chooses to enforce reCAPTCHA with App Attest in the future, you will no longer be able to log in with sideloaded EeveeSpotify. There are some potential workarounds, such as spoofing a previous version without reCAPTCHA integration, or creating a server that runs on a jailbroken device to generate signatures and attestation objects for App Attest. Regardless, I won't implement any login fixes in EeveeSpotify. If someone is interested in developing a solution, they are welcome to submit a pull request.

Currently, there are two workarounds if you see the “Something went wrong” message during login:

- Go to accounts.spotify.com, navigate to Account Overview > Edit Login Methods, and connect your Apple or Google Account. Logging in with Apple or Google has consistently worked so far.
- Install a previous version of EeveeSpotify and log in. You can update to the latest version and remain logged in after.
