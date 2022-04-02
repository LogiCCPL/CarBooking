//
//  Color.swift
//  CarBooking
//
//  Created by Robert Adamczyk on 01.04.22.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let primary = Color("PrimaryColor")
    let secondary = Color("SecondaryColor")
}
