//
// ModalExamples.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct ModalExamples: StaticPage {
    var title = "Modals"

    func body(context: PublishingContext) async -> [BlockElement] {
        Text("Modals")
            .font(.title1)

        Text("Modals allow you to present content in a modal dialog on top of the current page. By default they are presented with a backdrop, vertically centered in a medium size on the screen.")
            .font(.lead)

        // MARK: - Showing Modals

        Text("Showing Modals")
            .font(.title3)

        Text(markdown: "A modal is displayed using the `ShowModal(id:)` action.")

        Text(markdown: "Here is simple modal:")
            .margin(.top, .large)

        let showModalId = "showModalId"

        CodeBlock(language: "swift", """
        Button("Show simple Modal") {
            ShowModal(id: "\(showModalId)")
        }
        .role(.primary)

        Modal(id: "\(showModalId)") {
            Text("Dismiss me by clicking on the backdrop.")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        """)

        Group {
            Card {
                Group {
                    Button("Show simple Modal") {
                        ShowModal(id: showModalId)
                    }
                    .role(.primary)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)

            Modal(id: showModalId) {
                Text("Dismiss me by clicking on the backdrop.")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
        }
        .padding(.top, .large)

        // MARK: - Dismissing Modals

        Text("Dismissing Modals")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Modals can either be dismissed by clicking on the backdrop, unless otherwise configured in the [Presentation Options](#Options), by pressing the `Esc` key or programmatically by using the `DismissModal(id:)` action.")

        Text(markdown: "This modal can be dismissed through a cose button in the top right corner:")
            .margin(.top, .medium)

        let dismissModalId = "dismissModalId"

        CodeBlock(language: "swift", """
        Modal(id: "\(dismissModalId)") {
            Group {
                Button().role(.close).onClick {
                    DismissModal(id: "\(dismissModalId)")
                }
            }
            .horizontalAlignment(.trailing)

            Text("Dismiss me by clicking on the close button.")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        """)

        Group {
            Card {
                Group {
                    Button("Show Modal with a Close Button") {
                        ShowModal(id: dismissModalId)
                    }
                    .role(.primary)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)

            Modal(id: dismissModalId) {
                Group {
                    Button().role(.close).onClick {
                        DismissModal(id: dismissModalId)
                    }
                }
                .horizontalAlignment(.trailing)

                Text("Dismiss me by clicking on the close button.")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
        }
        .padding(.top, .large)

        // MARK: - Modal Size

        Text("Modal Size")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "The height of a modal is determined by the height of the content. However, the width can be adjusted by using the `size()` modifier. By default a modal takes a medium width but it can be adjusted to `.small`, `.large`, `.xLarge` and `.fullscreen`")

        Text(markdown: "Here are a few examples:")
            .margin(.top, .medium)

        let smallModalId = "smallModalId"
        let xLargeModalId = "xLargeModalId"
        let fullscreenModalId = "fullscreenModalId"

        CodeBlock(language: "swift", """
        Modal(id: "\(smallModalId)") {
            Text(markdown: "Modal with size `.small`")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        .size(.small)

        Modal(id: "\(xLargeModalId)") {
            Text(markdown: "Modal with size `.xLarge`")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        .size(.xlarge)

        Modal(id: "\(fullscreenModalId)") {
            Group {
                Button().role(.close).onClick {
                    DismissModal(id: "\(fullscreenModalId)")
                }
            }
            .horizontalAlignment(.trailing)

            Text(markdown: "Modal with size `.fullscreen`.")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        .size(.fullscreen)
        """)

        Group {
            Card {
                Group {
                    Section {
                        Group {
                            Button("Show Small Modal") {
                                ShowModal(id: smallModalId)
                            }
                            .role(.primary)
                        }

                        Group {
                            Button("Show xLarge Modal") {
                                ShowModal(id: xLargeModalId)
                            }
                            .role(.primary)
                        }

                        Group {
                            Button("Show Fullscreen Modal") {
                                ShowModal(id: fullscreenModalId)
                            }
                            .role(.primary)
                        }
                    }
                    .horizontalAlignment(.center)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)

            Modal(id: "\(smallModalId)") {
                Text(markdown: "Modal with size `.small`")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
            .size(.small)

            Modal(id: "\(xLargeModalId)") {
                Text(markdown: "Modal with size `.xLarge`")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
            .size(.xLarge)

            Modal(id: "\(fullscreenModalId)") {
                Group {
                    Button().role(.close).onClick {
                        DismissModal(id: "\(fullscreenModalId)")
                    }
                }
                .horizontalAlignment(.trailing)

                Text(markdown: "Modal with size `.fullscreen`.")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
            .size(.fullscreen)
        }
        .padding(.top, .large)

        // MARK: - Modal Position

        Text("Modal Position")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Modals are always horizontally centered but the vertical position can be changed from `Position.center` to `Position.top` by using the `.modalPosition()` modifier.")

        Text(markdown: "Here is a modal with `Position.top`:")
            .margin(.top, .medium)

        let topModalId = "topModalId"

        CodeBlock(language: "swift", """
        Modal(id: "\(topModalId)") {
            Text(markdown: "Modal with `Position.top`")
                .font(.title3)
                .margin(.extraLarge)
                .horizontalAlignment(.center)
        }
        .position(.top)
        """)

        Group {
            Card {
                Group {
                    Button("Show Modal at the top") {
                        ShowModal(id: topModalId)
                    }
                    .role(.primary)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)

            Modal(id: topModalId) {
                Text(markdown: "Modal with `Position.top`")
                    .font(.title3)
                    .margin(.extraLarge)
                    .horizontalAlignment(.center)
            }
            .modalPosition(.top)
        }
        .padding(.top, .large)

        // MARK: - Headers and Footers

        Text("Headers and Footers")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "Optionally modals can have a header and/or a footer.")

        Text(markdown: "Here is how they look like:")
            .margin(.top, .medium)

        let headerModalId = "headerModalId"
        let footerModalId = "footerModalId"
        let headerAndFooterModalId = "headerAndFooterModalId"

        CodeBlock(language: "swift", """
        Modal(id: "\(headerModalId)") {
            Text("Body")
        } header: {
            Text("Header").font(.title5)

            Button().role(.close).onClick{
                DismissModal(id: "\(headerModalId)")
            }
        }

        Modal(id: "\(footerModalId)") {
            Text("Body")
        } footer: {
            Button("Close") {
                DismissModal(id: "\(footerModalId)")
            }
            .role(.secondary)

            Button("Go") {
                // Do something
            }
            .role(.primary)
        }

        Modal(id: "\(headerAndFooterModalId)") {
            Text("Body")
        } header: {
            Text("Header").font(.title5)

            Button().role(.close).onClick{
                DismissModal(id: "\(headerAndFooterModalId)")
            }
        } footer: {
            Button("Close") {
                DismissModal(id: "\(headerAndFooterModalId)")
            }
            .role(.secondary)

            Button("Go") {
                // Do something
            }
            .role(.primary)
        }
        """)

        Group {
            Card {
                Group {
                    Section {
                        Group {
                            Button("Show Modal with Header") {
                                ShowModal(id: headerModalId)
                            }
                            .role(.primary)
                        }

                        Group {
                            Button("Show Modal with Footer") {
                                ShowModal(id: footerModalId)
                            }
                            .role(.primary)
                        }

                        Group {
                            Button("Show Modal with Header and Footer") {
                                ShowModal(id: headerAndFooterModalId)
                            }
                            .role(.primary)
                        }
                    }
                    .horizontalAlignment(.center)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)

            Alert {
                Text(markdown: "Note how the content in the header is inlined and placed on the leading edge. However, a button with the role `close` is moved to the trailing edge. Content in the footer on the other hand is placed on the trailing edge.")
            }
            .role(.info)
            .margin(.top, .large)

            Modal(id: headerModalId) {
                Text("Body")
            } header: {
                Text("Header").font(.title5)
                
                Button().role(.close).onClick{
                    DismissModal(id: headerModalId)
                }
            }

            Modal(id: footerModalId) {
                Text("Body")
            } footer: {
                Button("Close") {
                    DismissModal(id: footerModalId)
                }
                .role(.secondary)
                
                Button("Go") {
                    // Do something
                }
                .role(.primary)
            }

            Modal(id: headerAndFooterModalId) {
                Text("Body")
            } header: {
                Text("Header").font(.title5)
                
                Button().role(.close).onClick{
                    DismissModal(id: headerAndFooterModalId)
                }
            } footer: {
                Button("Close") {
                    DismissModal(id: headerAndFooterModalId)
                }
                .role(.secondary)

                Button("Go") {
                    // Do something
                }
                .role(.primary)
            }
        }
        .padding(.top, .large)

        // MARK: - Scrollable Content

        Text("Scrollable Content")
            .font(.title2)
            .margin(.top, .extraLarge)

        Text(markdown: "For content that is too long to fit on the screen, the body content can be made scrollable by using the `scrollableContent()` modifier.")

        Text(markdown: "Here is a Modal with a long text:")
            .margin(.top, .medium)

        let modal7 = "modal7"

        CodeBlock(language: "swift", """
        Modal(id: "\(modal7)" {
            Text(placeholderLength: 1000)
        } header: {
            Text("Long text")
                .font(.title5)
        }
        .size(.large)
        .scrollableContent(true)
        """)

        Group {
            Card {
                Group {
                    Button("Show Modal with Scrollable Content") {
                        ShowModal(id: modal7)
                    }
                    .role(.primary)
                }
                .margin(.vertical, .medium)
            }
            .role(.light)
            
            Modal(id: modal7) {
                Text(placeholderLength: 1000)
            } header: {
                Text("Long text")
                    .font(.title5)
            }
            .size(.large)
            .scrollableContent(true)
        }

        // MARK: - Options

        Text("Presentation Options")
            .font(.title2)
            .margin(.top, .extraLarge)
            .id("Options")

        Text(markdown: "The `ShowModal` action accepts an array of options that allow you to configure various presentation settings:")

        Table {
            Row {
                Text("Option").font(.title5)
                Text("Description").font(.title5)
            }
            Row {
                Text(markdown: "`noBackdrop`")
                Text("Disables the backdrop, making the modal non-dismissible by clicking outside it.")
            }
            Row {
                Text(markdown: "`backdrop(dismissible: Bool)`")
                Text("Enables the backdrop by default. If `dismissible` is set to `false`, the modal cannot be dismissed by clicking outside.")
            }
            Row {
                Text(markdown: "`keyboard(Bool)`")
                Text("Allows the modal to be dismissed by pressing the ESC key when set to `true`. If `false`, this behavior is disabled. The default is `true`.")
            }
            Row {
                Text(markdown: "`focus(Bool)`")
                Text("When `true`, the modal will autofocus on the modal when opened. The default is `true`.")
            }
        }

        Text(markdown: "A modal which can not be dismissed by clicking on the backdrop can be configured like this:")
            .margin(.top, .extraLarge)

        CodeBlock(language: "swift", """
        Button("Show Modal") {
            ShowModal(id: "showModalId", option [.backdrop(dismissable: false)])
        }
        """)
    }
}
