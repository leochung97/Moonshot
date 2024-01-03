//
//  RectangularLine.swift
//  Moonshot
//
//  Created by Leo Chung on 1/3/24.
//

import SwiftUI

struct RectangularLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    RectangularLine()
}
