//
//  RoundedViews.swift
//  Bullseye
//
//  Created by AbdulKadir Akkaş on 8.02.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String

    var body: some View {
       Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )

    }
}

struct RoundedRectTextView: View {
    var text: String

    var body: some View {
       Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68, height: 56)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )

    }
}

struct RoundedTextView: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: 2)
                    )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "100")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
            .preferredColorScheme(.light)
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
