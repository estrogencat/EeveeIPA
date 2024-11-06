import SwiftUI

struct EeveeLyricsSettingsView: View {
    @State var musixmatchToken = UserDefaults.musixmatchToken
    @State var lyricsSource = UserDefaults.lyricsSource
    @State var geniusFallback = UserDefaults.geniusFallback
    
    @State private var lyricsOptions = UserDefaults.lyricsOptions
    
    @State var isRequestingMusixmatchToken = false
    @State private var isShowingLanguageWarning = false
    
    var body: some View {
        List {
            LyricsSourceSection()
            
            if lyricsSource != .notReplaced {
                if lyricsSource != .genius {
                    Section(
                        footer: Text("genius_fallback_description".localizeWithFormat(lyricsSource.description))
                    ) {
                        Toggle(
                            "genius_fallback".localized,
                            isOn: $geniusFallback
                        )
                        
                        if geniusFallback {
                            Toggle(
                                "show_fallback_reasons".localized,
                                isOn: Binding<Bool>(
                                    get: { UserDefaults.fallbackReasons },
                                    set: { UserDefaults.fallbackReasons = $0 }
                                )
                            )
                        }
                    }
                }
                
                //
                
                Section(footer: Text("romanized_lyrics_description".localized)) {
                    Toggle(
                        "romanized_lyrics".localized,
                        isOn: $lyricsOptions.romanization
                    )
                }
                
                if lyricsSource == .musixmatch {
                    Section {
                        HStack {
                            if isShowingLanguageWarning {
                                Image(systemName: "exclamationmark.triangle")
                                    .font(.title3)
                                    .foregroundColor(.yellow)
                            }
                            
                            Text("musixmatch_language".localized)
                            
                            Spacer()
                            
                            TextField("en", text: $lyricsOptions.musixmatchLanguage)
                                .frame(maxWidth: 20)
                                .foregroundColor(.gray)
                        }
                    } footer: {
                        Text("musixmatch_language_description".localized)
                    }
                }
            }
            
            if !UIDevice.current.isIpad {
                Spacer()
                    .frame(height: 40)
                    .listRowBackground(Color.clear)
                    .modifier(ListRowSeparatorHidden())
            }
        }
        .listStyle(GroupedListStyle())
        
        .disabled(isRequestingMusixmatchToken)
        
        .animation(.default, value: lyricsSource)
        .animation(.default, value: isRequestingMusixmatchToken)
        .animation(.default, value: isShowingLanguageWarning)
        .animation(.default, value: geniusFallback)
        
        .onChange(of: geniusFallback) { geniusFallback in
            UserDefaults.geniusFallback = geniusFallback
        }
        
        .onChange(of: lyricsOptions) { lyricsOptions in
            let selectedLanguage = lyricsOptions.musixmatchLanguage
            
            if selectedLanguage.isEmpty || selectedLanguage ~= "^[\\w\\d]{2}$" {
                isShowingLanguageWarning = false
                
                MusixmatchLyricsRepository.shared.selectedLanguage = selectedLanguage
                UserDefaults.lyricsOptions = lyricsOptions
                
                return
            }
            
            isShowingLanguageWarning = true
        }
    }
}
