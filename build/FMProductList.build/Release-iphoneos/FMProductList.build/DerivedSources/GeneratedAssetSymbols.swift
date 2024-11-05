import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "favicon-32x32" asset catalog image resource.
    static let favicon32X32 = DeveloperToolsSupport.ImageResource(name: "favicon-32x32", bundle: resourceBundle)

    /// The "icon-add-to-cart" asset catalog image resource.
    static let iconAddToCart = DeveloperToolsSupport.ImageResource(name: "icon-add-to-cart", bundle: resourceBundle)

    /// The "icon-carbon-neutral" asset catalog image resource.
    static let iconCarbonNeutral = DeveloperToolsSupport.ImageResource(name: "icon-carbon-neutral", bundle: resourceBundle)

    /// The "icon-decrement-quantity" asset catalog image resource.
    static let iconDecrementQuantity = DeveloperToolsSupport.ImageResource(name: "icon-decrement-quantity", bundle: resourceBundle)

    /// The "icon-increment-quantity" asset catalog image resource.
    static let iconIncrementQuantity = DeveloperToolsSupport.ImageResource(name: "icon-increment-quantity", bundle: resourceBundle)

    /// The "icon-order-confirmed" asset catalog image resource.
    static let iconOrderConfirmed = DeveloperToolsSupport.ImageResource(name: "icon-order-confirmed", bundle: resourceBundle)

    /// The "icon-remove-item" asset catalog image resource.
    static let iconRemoveItem = DeveloperToolsSupport.ImageResource(name: "icon-remove-item", bundle: resourceBundle)

    /// The "illustration-empty-cart" asset catalog image resource.
    static let illustrationEmptyCart = DeveloperToolsSupport.ImageResource(name: "illustration-empty-cart", bundle: resourceBundle)

    /// The "image-baklava-desktop" asset catalog image resource.
    static let imageBaklavaDesktop = DeveloperToolsSupport.ImageResource(name: "image-baklava-desktop", bundle: resourceBundle)

    /// The "image-baklava-mobile" asset catalog image resource.
    static let imageBaklavaMobile = DeveloperToolsSupport.ImageResource(name: "image-baklava-mobile", bundle: resourceBundle)

    /// The "image-baklava-tablet" asset catalog image resource.
    static let imageBaklavaTablet = DeveloperToolsSupport.ImageResource(name: "image-baklava-tablet", bundle: resourceBundle)

    /// The "image-baklava-thumbnail" asset catalog image resource.
    static let imageBaklavaThumbnail = DeveloperToolsSupport.ImageResource(name: "image-baklava-thumbnail", bundle: resourceBundle)

    /// The "image-brownie-desktop" asset catalog image resource.
    static let imageBrownieDesktop = DeveloperToolsSupport.ImageResource(name: "image-brownie-desktop", bundle: resourceBundle)

    /// The "image-brownie-mobile" asset catalog image resource.
    static let imageBrownieMobile = DeveloperToolsSupport.ImageResource(name: "image-brownie-mobile", bundle: resourceBundle)

    /// The "image-brownie-tablet" asset catalog image resource.
    static let imageBrownieTablet = DeveloperToolsSupport.ImageResource(name: "image-brownie-tablet", bundle: resourceBundle)

    /// The "image-brownie-thumbnail" asset catalog image resource.
    static let imageBrownieThumbnail = DeveloperToolsSupport.ImageResource(name: "image-brownie-thumbnail", bundle: resourceBundle)

    /// The "image-cake-desktop" asset catalog image resource.
    static let imageCakeDesktop = DeveloperToolsSupport.ImageResource(name: "image-cake-desktop", bundle: resourceBundle)

    /// The "image-cake-mobile" asset catalog image resource.
    static let imageCakeMobile = DeveloperToolsSupport.ImageResource(name: "image-cake-mobile", bundle: resourceBundle)

    /// The "image-cake-tablet" asset catalog image resource.
    static let imageCakeTablet = DeveloperToolsSupport.ImageResource(name: "image-cake-tablet", bundle: resourceBundle)

    /// The "image-cake-thumbnail" asset catalog image resource.
    static let imageCakeThumbnail = DeveloperToolsSupport.ImageResource(name: "image-cake-thumbnail", bundle: resourceBundle)

    /// The "image-creme brulee-desktop" asset catalog image resource.
    static let imageCremeBruleeDesktop = DeveloperToolsSupport.ImageResource(name: "image-creme brulee-desktop", bundle: resourceBundle)

    /// The "image-creme-brulee-mobile" asset catalog image resource.
    static let imageCremeBruleeMobile = DeveloperToolsSupport.ImageResource(name: "image-creme-brulee-mobile", bundle: resourceBundle)

    /// The "image-creme-brulee-tablet" asset catalog image resource.
    static let imageCremeBruleeTablet = DeveloperToolsSupport.ImageResource(name: "image-creme-brulee-tablet", bundle: resourceBundle)

    /// The "image-creme-brulee-thumbnail" asset catalog image resource.
    static let imageCremeBruleeThumbnail = DeveloperToolsSupport.ImageResource(name: "image-creme-brulee-thumbnail", bundle: resourceBundle)

    /// The "image-macaron-desktop" asset catalog image resource.
    static let imageMacaronDesktop = DeveloperToolsSupport.ImageResource(name: "image-macaron-desktop", bundle: resourceBundle)

    /// The "image-macaron-mobile" asset catalog image resource.
    static let imageMacaronMobile = DeveloperToolsSupport.ImageResource(name: "image-macaron-mobile", bundle: resourceBundle)

    /// The "image-macaron-tablet" asset catalog image resource.
    static let imageMacaronTablet = DeveloperToolsSupport.ImageResource(name: "image-macaron-tablet", bundle: resourceBundle)

    /// The "image-macaron-thumbnail" asset catalog image resource.
    static let imageMacaronThumbnail = DeveloperToolsSupport.ImageResource(name: "image-macaron-thumbnail", bundle: resourceBundle)

    /// The "image-meringue-desktop" asset catalog image resource.
    static let imageMeringueDesktop = DeveloperToolsSupport.ImageResource(name: "image-meringue-desktop", bundle: resourceBundle)

    /// The "image-meringue-tablet" asset catalog image resource.
    static let imageMeringueTablet = DeveloperToolsSupport.ImageResource(name: "image-meringue-tablet", bundle: resourceBundle)

    /// The "image-meringue-thumbnail" asset catalog image resource.
    static let imageMeringueThumbnail = DeveloperToolsSupport.ImageResource(name: "image-meringue-thumbnail", bundle: resourceBundle)

    /// The "image-panna cotta-mobile" asset catalog image resource.
    static let imagePannaCottaMobile = DeveloperToolsSupport.ImageResource(name: "image-panna cotta-mobile", bundle: resourceBundle)

    /// The "image-panna-cotta-desktop" asset catalog image resource.
    static let imagePannaCottaDesktop = DeveloperToolsSupport.ImageResource(name: "image-panna-cotta-desktop", bundle: resourceBundle)

    /// The "image-panna-cotta-tablet" asset catalog image resource.
    static let imagePannaCottaTablet = DeveloperToolsSupport.ImageResource(name: "image-panna-cotta-tablet", bundle: resourceBundle)

    /// The "image-panna-cotta-thumbnail" asset catalog image resource.
    static let imagePannaCottaThumbnail = DeveloperToolsSupport.ImageResource(name: "image-panna-cotta-thumbnail", bundle: resourceBundle)

    /// The "image-pie-mobile" asset catalog image resource.
    static let imagePieMobile = DeveloperToolsSupport.ImageResource(name: "image-pie-mobile", bundle: resourceBundle)

    /// The "image-tiramisu-desktop" asset catalog image resource.
    static let imageTiramisuDesktop = DeveloperToolsSupport.ImageResource(name: "image-tiramisu-desktop", bundle: resourceBundle)

    /// The "image-tiramisu-mobile" asset catalog image resource.
    static let imageTiramisuMobile = DeveloperToolsSupport.ImageResource(name: "image-tiramisu-mobile", bundle: resourceBundle)

    /// The "image-tiramisu-tablet" asset catalog image resource.
    static let imageTiramisuTablet = DeveloperToolsSupport.ImageResource(name: "image-tiramisu-tablet", bundle: resourceBundle)

    /// The "image-tiramisu-thumbnail" asset catalog image resource.
    static let imageTiramisuThumbnail = DeveloperToolsSupport.ImageResource(name: "image-tiramisu-thumbnail", bundle: resourceBundle)

    /// The "image-waffle-desktop" asset catalog image resource.
    static let imageWaffleDesktop = DeveloperToolsSupport.ImageResource(name: "image-waffle-desktop", bundle: resourceBundle)

    /// The "image-waffle-mobile" asset catalog image resource.
    static let imageWaffleMobile = DeveloperToolsSupport.ImageResource(name: "image-waffle-mobile", bundle: resourceBundle)

    /// The "image-waffle-tablet" asset catalog image resource.
    static let imageWaffleTablet = DeveloperToolsSupport.ImageResource(name: "image-waffle-tablet", bundle: resourceBundle)

    /// The "image-waffle-thumbnail" asset catalog image resource.
    static let imageWaffleThumbnail = DeveloperToolsSupport.ImageResource(name: "image-waffle-thumbnail", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "favicon-32x32" asset catalog image.
    static var favicon32X32: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .favicon32X32)
#else
        .init()
#endif
    }

    /// The "icon-add-to-cart" asset catalog image.
    static var iconAddToCart: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconAddToCart)
#else
        .init()
#endif
    }

    /// The "icon-carbon-neutral" asset catalog image.
    static var iconCarbonNeutral: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconCarbonNeutral)
#else
        .init()
#endif
    }

    /// The "icon-decrement-quantity" asset catalog image.
    static var iconDecrementQuantity: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconDecrementQuantity)
#else
        .init()
#endif
    }

    /// The "icon-increment-quantity" asset catalog image.
    static var iconIncrementQuantity: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconIncrementQuantity)
#else
        .init()
#endif
    }

    /// The "icon-order-confirmed" asset catalog image.
    static var iconOrderConfirmed: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconOrderConfirmed)
#else
        .init()
#endif
    }

    /// The "icon-remove-item" asset catalog image.
    static var iconRemoveItem: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .iconRemoveItem)
#else
        .init()
#endif
    }

    /// The "illustration-empty-cart" asset catalog image.
    static var illustrationEmptyCart: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .illustrationEmptyCart)
#else
        .init()
#endif
    }

    /// The "image-baklava-desktop" asset catalog image.
    static var imageBaklavaDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBaklavaDesktop)
#else
        .init()
#endif
    }

    /// The "image-baklava-mobile" asset catalog image.
    static var imageBaklavaMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBaklavaMobile)
#else
        .init()
#endif
    }

    /// The "image-baklava-tablet" asset catalog image.
    static var imageBaklavaTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBaklavaTablet)
#else
        .init()
#endif
    }

    /// The "image-baklava-thumbnail" asset catalog image.
    static var imageBaklavaThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBaklavaThumbnail)
#else
        .init()
#endif
    }

    /// The "image-brownie-desktop" asset catalog image.
    static var imageBrownieDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBrownieDesktop)
#else
        .init()
#endif
    }

    /// The "image-brownie-mobile" asset catalog image.
    static var imageBrownieMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBrownieMobile)
#else
        .init()
#endif
    }

    /// The "image-brownie-tablet" asset catalog image.
    static var imageBrownieTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBrownieTablet)
#else
        .init()
#endif
    }

    /// The "image-brownie-thumbnail" asset catalog image.
    static var imageBrownieThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageBrownieThumbnail)
#else
        .init()
#endif
    }

    /// The "image-cake-desktop" asset catalog image.
    static var imageCakeDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCakeDesktop)
#else
        .init()
#endif
    }

    /// The "image-cake-mobile" asset catalog image.
    static var imageCakeMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCakeMobile)
#else
        .init()
#endif
    }

    /// The "image-cake-tablet" asset catalog image.
    static var imageCakeTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCakeTablet)
#else
        .init()
#endif
    }

    /// The "image-cake-thumbnail" asset catalog image.
    static var imageCakeThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCakeThumbnail)
#else
        .init()
#endif
    }

    /// The "image-creme brulee-desktop" asset catalog image.
    static var imageCremeBruleeDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCremeBruleeDesktop)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-mobile" asset catalog image.
    static var imageCremeBruleeMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCremeBruleeMobile)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-tablet" asset catalog image.
    static var imageCremeBruleeTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCremeBruleeTablet)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-thumbnail" asset catalog image.
    static var imageCremeBruleeThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageCremeBruleeThumbnail)
#else
        .init()
#endif
    }

    /// The "image-macaron-desktop" asset catalog image.
    static var imageMacaronDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMacaronDesktop)
#else
        .init()
#endif
    }

    /// The "image-macaron-mobile" asset catalog image.
    static var imageMacaronMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMacaronMobile)
#else
        .init()
#endif
    }

    /// The "image-macaron-tablet" asset catalog image.
    static var imageMacaronTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMacaronTablet)
#else
        .init()
#endif
    }

    /// The "image-macaron-thumbnail" asset catalog image.
    static var imageMacaronThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMacaronThumbnail)
#else
        .init()
#endif
    }

    /// The "image-meringue-desktop" asset catalog image.
    static var imageMeringueDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMeringueDesktop)
#else
        .init()
#endif
    }

    /// The "image-meringue-tablet" asset catalog image.
    static var imageMeringueTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMeringueTablet)
#else
        .init()
#endif
    }

    /// The "image-meringue-thumbnail" asset catalog image.
    static var imageMeringueThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageMeringueThumbnail)
#else
        .init()
#endif
    }

    /// The "image-panna cotta-mobile" asset catalog image.
    static var imagePannaCottaMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imagePannaCottaMobile)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-desktop" asset catalog image.
    static var imagePannaCottaDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imagePannaCottaDesktop)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-tablet" asset catalog image.
    static var imagePannaCottaTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imagePannaCottaTablet)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-thumbnail" asset catalog image.
    static var imagePannaCottaThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imagePannaCottaThumbnail)
#else
        .init()
#endif
    }

    /// The "image-pie-mobile" asset catalog image.
    static var imagePieMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imagePieMobile)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-desktop" asset catalog image.
    static var imageTiramisuDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageTiramisuDesktop)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-mobile" asset catalog image.
    static var imageTiramisuMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageTiramisuMobile)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-tablet" asset catalog image.
    static var imageTiramisuTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageTiramisuTablet)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-thumbnail" asset catalog image.
    static var imageTiramisuThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageTiramisuThumbnail)
#else
        .init()
#endif
    }

    /// The "image-waffle-desktop" asset catalog image.
    static var imageWaffleDesktop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageWaffleDesktop)
#else
        .init()
#endif
    }

    /// The "image-waffle-mobile" asset catalog image.
    static var imageWaffleMobile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageWaffleMobile)
#else
        .init()
#endif
    }

    /// The "image-waffle-tablet" asset catalog image.
    static var imageWaffleTablet: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageWaffleTablet)
#else
        .init()
#endif
    }

    /// The "image-waffle-thumbnail" asset catalog image.
    static var imageWaffleThumbnail: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .imageWaffleThumbnail)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "favicon-32x32" asset catalog image.
    static var favicon32X32: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .favicon32X32)
#else
        .init()
#endif
    }

    /// The "icon-add-to-cart" asset catalog image.
    static var iconAddToCart: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconAddToCart)
#else
        .init()
#endif
    }

    /// The "icon-carbon-neutral" asset catalog image.
    static var iconCarbonNeutral: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconCarbonNeutral)
#else
        .init()
#endif
    }

    /// The "icon-decrement-quantity" asset catalog image.
    static var iconDecrementQuantity: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconDecrementQuantity)
#else
        .init()
#endif
    }

    /// The "icon-increment-quantity" asset catalog image.
    static var iconIncrementQuantity: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconIncrementQuantity)
#else
        .init()
#endif
    }

    /// The "icon-order-confirmed" asset catalog image.
    static var iconOrderConfirmed: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconOrderConfirmed)
#else
        .init()
#endif
    }

    /// The "icon-remove-item" asset catalog image.
    static var iconRemoveItem: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .iconRemoveItem)
#else
        .init()
#endif
    }

    /// The "illustration-empty-cart" asset catalog image.
    static var illustrationEmptyCart: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .illustrationEmptyCart)
#else
        .init()
#endif
    }

    /// The "image-baklava-desktop" asset catalog image.
    static var imageBaklavaDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBaklavaDesktop)
#else
        .init()
#endif
    }

    /// The "image-baklava-mobile" asset catalog image.
    static var imageBaklavaMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBaklavaMobile)
#else
        .init()
#endif
    }

    /// The "image-baklava-tablet" asset catalog image.
    static var imageBaklavaTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBaklavaTablet)
#else
        .init()
#endif
    }

    /// The "image-baklava-thumbnail" asset catalog image.
    static var imageBaklavaThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBaklavaThumbnail)
#else
        .init()
#endif
    }

    /// The "image-brownie-desktop" asset catalog image.
    static var imageBrownieDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBrownieDesktop)
#else
        .init()
#endif
    }

    /// The "image-brownie-mobile" asset catalog image.
    static var imageBrownieMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBrownieMobile)
#else
        .init()
#endif
    }

    /// The "image-brownie-tablet" asset catalog image.
    static var imageBrownieTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBrownieTablet)
#else
        .init()
#endif
    }

    /// The "image-brownie-thumbnail" asset catalog image.
    static var imageBrownieThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageBrownieThumbnail)
#else
        .init()
#endif
    }

    /// The "image-cake-desktop" asset catalog image.
    static var imageCakeDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCakeDesktop)
#else
        .init()
#endif
    }

    /// The "image-cake-mobile" asset catalog image.
    static var imageCakeMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCakeMobile)
#else
        .init()
#endif
    }

    /// The "image-cake-tablet" asset catalog image.
    static var imageCakeTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCakeTablet)
#else
        .init()
#endif
    }

    /// The "image-cake-thumbnail" asset catalog image.
    static var imageCakeThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCakeThumbnail)
#else
        .init()
#endif
    }

    /// The "image-creme brulee-desktop" asset catalog image.
    static var imageCremeBruleeDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCremeBruleeDesktop)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-mobile" asset catalog image.
    static var imageCremeBruleeMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCremeBruleeMobile)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-tablet" asset catalog image.
    static var imageCremeBruleeTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCremeBruleeTablet)
#else
        .init()
#endif
    }

    /// The "image-creme-brulee-thumbnail" asset catalog image.
    static var imageCremeBruleeThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageCremeBruleeThumbnail)
#else
        .init()
#endif
    }

    /// The "image-macaron-desktop" asset catalog image.
    static var imageMacaronDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMacaronDesktop)
#else
        .init()
#endif
    }

    /// The "image-macaron-mobile" asset catalog image.
    static var imageMacaronMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMacaronMobile)
#else
        .init()
#endif
    }

    /// The "image-macaron-tablet" asset catalog image.
    static var imageMacaronTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMacaronTablet)
#else
        .init()
#endif
    }

    /// The "image-macaron-thumbnail" asset catalog image.
    static var imageMacaronThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMacaronThumbnail)
#else
        .init()
#endif
    }

    /// The "image-meringue-desktop" asset catalog image.
    static var imageMeringueDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMeringueDesktop)
#else
        .init()
#endif
    }

    /// The "image-meringue-tablet" asset catalog image.
    static var imageMeringueTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMeringueTablet)
#else
        .init()
#endif
    }

    /// The "image-meringue-thumbnail" asset catalog image.
    static var imageMeringueThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageMeringueThumbnail)
#else
        .init()
#endif
    }

    /// The "image-panna cotta-mobile" asset catalog image.
    static var imagePannaCottaMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imagePannaCottaMobile)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-desktop" asset catalog image.
    static var imagePannaCottaDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imagePannaCottaDesktop)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-tablet" asset catalog image.
    static var imagePannaCottaTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imagePannaCottaTablet)
#else
        .init()
#endif
    }

    /// The "image-panna-cotta-thumbnail" asset catalog image.
    static var imagePannaCottaThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imagePannaCottaThumbnail)
#else
        .init()
#endif
    }

    /// The "image-pie-mobile" asset catalog image.
    static var imagePieMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imagePieMobile)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-desktop" asset catalog image.
    static var imageTiramisuDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageTiramisuDesktop)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-mobile" asset catalog image.
    static var imageTiramisuMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageTiramisuMobile)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-tablet" asset catalog image.
    static var imageTiramisuTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageTiramisuTablet)
#else
        .init()
#endif
    }

    /// The "image-tiramisu-thumbnail" asset catalog image.
    static var imageTiramisuThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageTiramisuThumbnail)
#else
        .init()
#endif
    }

    /// The "image-waffle-desktop" asset catalog image.
    static var imageWaffleDesktop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageWaffleDesktop)
#else
        .init()
#endif
    }

    /// The "image-waffle-mobile" asset catalog image.
    static var imageWaffleMobile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageWaffleMobile)
#else
        .init()
#endif
    }

    /// The "image-waffle-tablet" asset catalog image.
    static var imageWaffleTablet: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageWaffleTablet)
#else
        .init()
#endif
    }

    /// The "image-waffle-thumbnail" asset catalog image.
    static var imageWaffleThumbnail: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .imageWaffleThumbnail)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

