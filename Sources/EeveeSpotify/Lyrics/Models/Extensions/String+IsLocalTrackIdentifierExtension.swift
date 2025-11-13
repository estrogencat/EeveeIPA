extension String {
    var isLocalTrackIdentifier: Bool {
        self.hasPrefix("spotify:local:")
    }
}
