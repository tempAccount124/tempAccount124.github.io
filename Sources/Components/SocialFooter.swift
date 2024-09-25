//
// NavBar.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

/// Displays a global "Social Footer", with each social icon linking to an
/// external site in a new browser tab, demonstrating how to create reusable
/// components with builtIn icons, external links and custom attributes.
public struct SocialFooter: Component {
    let icons = [
        Image(systemName: "github"),
        Image(systemName: "twitter"),
        Image(systemName: "youtube"),
        Image(systemName: "mastodon")
    ]

    let urlStrings = [
        "https://github.com/twostraws",
        "https://twitter.com/twostraws",
        "https://youtube.com/@twostraws",
        "https://mastodon.social/@twostraws"
    ]

    public func body(context: PublishingContext) -> [any PageElement] {
        Text {
            for (icon, urlString) in zip(icons, urlStrings) {
                Link(icon, target: urlString)
                    .margin(.trailing, 20)
                    .role(.secondary)
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
            }
        }
        .font(.title2)
        .horizontalAlignment(.center)
        .margin(.top, .extraLarge)
    }
}
