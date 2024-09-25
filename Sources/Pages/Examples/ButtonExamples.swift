//
// ButtonExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ButtonExamples: StaticPage {
    var title = "Buttons"

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Buttons")
            .font(.title1)

        Text("Badges are tappable elements on your page that can run various actions when pressed, optionally with a role attached to add styling.")
            .font(.lead)

        Text("For example, here's a primary button that shows an alert when pressed:")

        CodeBlock(language: "swift", """
        Text {
            Button("Say Hello") {
                ShowAlert(message: "Hello, world!")
            }
            .role(.primary)
        }
        """)

        Text {
            Button("Say Hello") {
                ShowAlert(message: "Hello, world!")
            }
            .role(.primary)
        }
        .margin(.bottom, .extraLarge)

        Text("Button actions can contain multiple commands, all of which get compiled to JavaScript when your site is built.")

        Text("For example, this code shows two pieces of text, and buttons that toggle between them:")

        CodeBlock(language: "swift", """
        Text {
            Button("Show First Text") {
                ShowElement("FirstText")
                HideElement("SecondText")
            }
            .role(.primary)
        }

        Text {
            Button("Show Second Text") {
                HideElement("FirstText")
                ShowElement("SecondText")
            }
            .role(.secondary)
        }

        Text("This is the first text.")
            .font(.title3)
            .id("FirstText")

        Text("This is the second text.")
            .font(.title3)
            .id("SecondText")
            .hidden()
        """)

        Text {
            Button("Show First Text") {
                ShowElement("FirstText")
                HideElement("SecondText")
            }
            .role(.primary)
        }

        Text {
            Button("Show Second Text") {
                HideElement("FirstText")
                ShowElement("SecondText")
            }
            .role(.secondary)
        }

        Text("This is the first text.")
            .font(.title3)
            .id("FirstText")

        Text("This is the second text.")
            .font(.title3)
            .id("SecondText")
            .hidden()

        Text(markdown: "All the same actions you can use with buttons can also be used with event handlers, such as `onClick()` or `onHover()`. For example:")
            .margin(.top, .extraLarge)

        Text("Hover over this text to make a message appear below.")
            .font(.lead)
            .onHover { isHovering in
                if isHovering {
                    ShowElement("HiddenMessage")
                } else {
                    HideElement("HiddenMessage")
                }
            }

        Text("Hey, listen!")
            .id("HiddenMessage")
            .hidden()

        Text(markdown: "If you want your button to act as a link somewhere else, it's better to use `Link` with `.linkStyle(.button)`, like this:")
            .margin(.top, .extraLarge)

        CodeBlock(language: "swift", """
        Text {
            Link("This is a link button", target: ContentExamples())
                .linkStyle(.button)
        }
        """)

        Text {
            Link("This is a link button", target: ContentExamples())
                .linkStyle(.button)
        }

        Text("Styling buttons")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "As with other several other element types, buttons can have *roles* attached to them to customize how they look. There is also a `buttonSize()` modifier to adjust how big buttons are:")

        CodeBlock(language: "swift", """
        for role in Role.allCases {
            for size in ButtonSize.allCases {
                Text {
                    Button("\\(size.rawValue.capitalized) button with \\(role.rawValue) role")
                        .buttonSize(size)
                        .role(role)
                }
            }
        }
        """)

        for role in Role.allCases {
            for size in ButtonSize.allCases {
                Text {
                    let description = "\(size.rawValue.capitalized) button with \(role.rawValue) role"
                    Button(role == .close ? "" : description)
                        .buttonSize(size)
                        .role(role)
                }
            }
        }
    }
}
