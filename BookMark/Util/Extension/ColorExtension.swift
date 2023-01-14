//
//  ColorExtension.swift
//  BookMark
//
//  Created by 김유빈 on 2023/01/13.
//

import SwiftUI

extension Color {
    static let vivaMagenta = Color(hex: "BB2649")
    static let lightGray = Color(hex: "D3D3D3")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
