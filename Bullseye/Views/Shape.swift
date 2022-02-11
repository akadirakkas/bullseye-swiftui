//
//  Shape.swift
//  Bullseye
//
//  Created by AbdulKadir Akkaş on 8.02.2022.
//

import SwiftUI

struct Shape: View {
    var body: some View {
        VStack{
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 100)
        }
        .background(Color.green)
    }
}

struct Shape_Previews: PreviewProvider {
    static var previews: some View {
        Shape()
    }
}
