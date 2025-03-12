import SwiftUI

extension EeveeLyricsSettingsView {
    func showMusixmatchTokenAlert(_ oldSource: LyricsSource, _ showAnonymousTokenOption: Bool) {
        var message = "enter_user_token_message".localized
        
        if showAnonymousTokenOption {
            message.append("\n\n")
            message.append("request_anonymous_token_description".localized)
        }
        
        let alert = UIAlertController(
            title: "enter_user_token".localized,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addTextField() { textField in
            textField.placeholder = "---- Debug Info ---- [Device]: \(UIDevice.current.isIpad ? "iPad" : "iPhone")"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel".uiKitLocalized, style: .cancel) { _ in
            viewModel.lyricsSource = oldSource
        })
        
        if showAnonymousTokenOption {
            alert.addAction(UIAlertAction(title: "request_anonymous_token".localized, style: .default) { _ in
                viewModel.requestAnonymousMusixmatchToken()
            })
        }

        alert.addAction(UIAlertAction(title: "OK".uiKitLocalized, style: .default) { _ in
            let text = alert.textFields!.first!.text!
            
            guard let token =
                viewModel.getMusixmatchTokenFromDebugInfo(text)
                ?? viewModel.getMusixmatchToken(text)
            else {
                viewModel.lyricsSource = oldSource
                return
            }

            viewModel.musixmatchToken = token
            UserDefaults.lyricsSource = .musixmatch
        })
        
        WindowHelper.shared.present(alert)
    }
}
