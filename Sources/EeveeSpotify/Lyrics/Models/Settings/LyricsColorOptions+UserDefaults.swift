import Foundation

extension UserDefaults {
    @UserDefault(
        key: "lyricsColors",
        defaultValue: LyricsColorOptions(
            displayOriginalColors: true,
            useStaticColor: false,
            staticColor: "",
            normalizationFactor: 0.5
        )
    )
    static var lyricsColors
}
