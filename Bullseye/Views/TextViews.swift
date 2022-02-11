//
//  TextViews.swift
//  Bullseye
//
//  Created by AbdulKadir Akkaş on 2.02.2022.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text)
        .bold()
        .foregroundColor(Color("TextColor"))
        .frame(width: 35)
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text)

    }
}

struct BodyText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)

    }
}

struct ButtonText: View {
    var text: String

    var body: some View {
        Text(text)
            .bold()// return örneği
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ScoreText: View {
    var text: Int

    var body: some View {
        Text(String(text))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date

    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "1")
            LabelText(text: "222")
            BodyText(text: "Your scoered 200 points\n🎉🎉🎉")
            ButtonText(text: "Start new round")
            ScoreText(text: 1)
            DateText(date: Date())
            BigBoldText(text: "LeaderBoard")
        }
        .padding()
    }
}
