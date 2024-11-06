import SwiftUI

extension EeveeLyricsSettingsView {
    func getMusixmatchToken(_ input: String) -> String? {
        if let match = input.firstMatch("\\[UserToken\\]: ([a-f0-9]+)"),
            let tokenRange = Range(match.range(at: 1), in: input) {
            return String(input[tokenRange])
        }
        else if input ~= "^[a-f0-9]+$" {
            return input
        }
        
        return nil
    }
    
    func showMusixmatchTokenAlert(_ oldSource: LyricsSource, showAnonymousTokenOption: Bool) {
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
            textField.placeholder = "---- Debug Info ---- [Device]: iPhone"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel".uiKitLocalized, style: .cancel) { _ in
            lyricsSource = oldSource
        })
        
        if showAnonymousTokenOption {
            alert.addAction(UIAlertAction(title: "request_anonymous_token".localized, style: .default) { _ in
                Task {
                    defer {
                        isRequestingMusixmatchToken.toggle()
                    }
                    do {
                        isRequestingMusixmatchToken.toggle()
                        
                        musixmatchToken = try await AnonymousTokenHelper.requestAnonymousMusixmatchToken()
                        UserDefaults.lyricsSource = .musixmatch
                    }
                    catch {
                        showMusixmatchTokenAlert(oldSource, showAnonymousTokenOption: false)
                    }
                }
            })
        }

        alert.addAction(UIAlertAction(title: "OK".uiKitLocalized, style: .default) { _ in
            let text = alert.textFields!.first!.text!
            
            guard let token = getMusixmatchToken(text) else {
                lyricsSource = oldSource
                return
            }

            musixmatchToken = token
            UserDefaults.lyricsSource = .musixmatch
        })
        
        WindowHelper.shared.present(alert)
    }
}
 
