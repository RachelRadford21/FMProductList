//
//  ImageModel.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import Foundation
import SwiftData

@Model
public class ImageModel: Codable {
    var thumbnail: String
    var mobile: String
    var tablet: String
    var desktop: String
    
    public init(
        thumbnail: String = "",
        mobile: String = "",
        tablet: String = "",
        desktop: String = ""
    ) {
        self.thumbnail = thumbnail
        self.mobile = mobile
        self.tablet = tablet
        self.desktop = desktop
    }
    enum CodingKeys: String, CodingKey {
        case thumbnail
        case mobile
        case tablet
        case desktop
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        mobile = try container.decode(String.self, forKey: .mobile)
        tablet = try container.decode(String.self, forKey: .tablet)
        desktop = try container.decode(String.self, forKey: .desktop)
    }
  public func encode(to encoder: any Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(thumbnail, forKey: .thumbnail)
    try container.encode(mobile, forKey: .mobile)
    try container.encode(tablet, forKey: .tablet)
    try container.encode(tablet, forKey: .desktop)
  }
}
