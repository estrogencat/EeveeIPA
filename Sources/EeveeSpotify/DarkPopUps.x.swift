import Orion
import UIKit
import SwiftUI

struct DarkPopUps: HookGroup { }

private let popUpContainerViewController = EeveeSpotify.isOldSpotifyVersion
    ? "SPTEncorePopUpContainer"
    : "EncoreConsumerMobile_Wrappers.PopUpPresentableContainer"

class EncoreLabelHook: ClassHook<UIView> {
    typealias Group = DarkPopUps
    static let targetName = "SPTEncoreLabel"

    func intrinsicContentSize() -> CGSize {
        if let viewController = WindowHelper.shared.viewController(for: target),
            NSStringFromClass(type(of: viewController)) == popUpContainerViewController
        {
            let label = Dynamic.convert(target.subviews.first!, to: UILabel.self)

            if !label.hasParent(matching: "Primary") {
                label.textColor = .white
            }
        }

        return orig.intrinsicContentSize()
    }
}

class SPTEncorePopUpContainerHook: ClassHook<UIViewController> {
    typealias Group = DarkPopUps
    static let targetName = popUpContainerViewController
    
    func containedView() -> SPTEncorePopUpDialog {
        return orig.containedView()
    }
    
    func viewDidAppear(_ animated: Bool) {
        orig.viewDidAppear(animated)
        containedView().uiView().backgroundColor = UIColor(Color(hex: "#242424"))
    }
}
