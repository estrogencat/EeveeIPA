import Foundation
import UIKit

func modifyRemoteConfiguration(_ configuration: inout UcsResponse) {
    if UserDefaults.overwriteConfiguration {
        configuration.resolve.configuration = try! BundleHelper.shared.resolveConfiguration()
    }
    
    modifyAttributes(&configuration.attributes.accountAttributes)
    modifyAssignedValues(&configuration.assignedValues)
}

private let propertyToRemoveNames = [
    "enable_common_capping",
    "enable_pns_common_capping",
    "enable_pick_and_shuffle_common_capping",
    "enable_pick_and_shuffle_dynamic_cap",
    "pick_and_shuffle_timecap", // capping
    "should_nova_scroll_use_scrollsita" // 😡😡😡
                                        // spotify, stop changing the scroll logic
]

func modifyAssignedValues(_ values: inout [AssignedValue]) {
    values.removeAll(where: { propertyToRemoveNames.contains($0.propertyID.name) })
    values.removeAll(where: { $0.propertyID.scope == "ios-feature-queue" })
}

func modifyAttributes(_ attributes: inout [String: AccountAttribute]) {
    let oneYearFromNow = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
    
    let formatter = ISO8601DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    
    attributes["ads"] = AccountAttribute.with {
        $0.boolValue = false
    }

    attributes["can_use_superbird"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes["catalogue"] = AccountAttribute.with {
        $0.stringValue = "premium"
    }

    attributes["financial-product"] = AccountAttribute.with {
        $0.stringValue = "pr:premium,tc:0"
    }

    attributes["is-eligible-premium-unboxing"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes["name"] = AccountAttribute.with {
        $0.stringValue = "Spotify Premium"
    }

    attributes["nft-disabled"] = AccountAttribute.with {
        $0.stringValue = "1"
    }

    attributes["offline"] = AccountAttribute.with {
        $0.boolValue = true // allow downloading
    }

    attributes["on-demand"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes["payments-initial-campaign"] = AccountAttribute.with {
        $0.stringValue = "default"
    }

    attributes["player-license"] = AccountAttribute.with {
        $0.stringValue = "premium"
    }

    attributes["player-license-v2"] = AccountAttribute.with {
        $0.stringValue = "premium"
    }

    attributes["product-expiry"] = AccountAttribute.with {
        $0.stringValue = formatter.string(from: oneYearFromNow)
    }

    attributes["shuffle-eligible"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes["social-session"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes["social-session-free-tier"] = AccountAttribute.with {
        $0.boolValue = false
    }

    attributes["streaming-rules"] = AccountAttribute.with {
        $0.stringValue = ""
    }

    attributes["subscription-enddate"] = AccountAttribute.with {
        $0.stringValue = formatter.string(from: oneYearFromNow)
    }

    attributes["type"] = AccountAttribute.with {
        $0.stringValue = "premium"
    }

    attributes["unrestricted"] = AccountAttribute.with {
        $0.boolValue = true
    }

    attributes.removeValue(forKey: "payment-state")
    attributes.removeValue(forKey: "last-premium-activation-date")
}
