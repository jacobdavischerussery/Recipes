//
//  ColorAssets.swift
//  Resources
//
//  Created by Jacob Davis on 2/7/25.
//

import SwiftUI

public struct ColorAssets {
    public static let primary: Color = .appColor("primary")
    public static let imageOveray: Color = .appColor("imageOverlay")
}

extension Color {
    static func appColor(_ name: String) -> Color {
        Color(name, bundle: Bundle.module)
    }
}
