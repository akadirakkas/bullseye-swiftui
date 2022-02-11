//
//  ContentView.swift
//  Bullseye
//
//  Created by AbdulKadir Akkaş on 21.01.2022.
//

import SwiftUI

struct ContentView: View {

@State private var alertIsVisible = false
@State private var sliderValue = 40.0
@State private var game = Game()

var body: some View {
    ZStack {
        BackGroundView(game: $game)
        VStack {
            InstructionView(game: $game)
                .padding(.bottom, alertIsVisible ? 0 : 100)
            if alertIsVisible {
                PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                    .transition(.scale)
            } else {
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                    .transition(.scale)
            }

        }
        if !alertIsVisible {
            SliderView(SliderValue: $sliderValue)
                .transition(.scale)
        }
    }
}

struct InstructionView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE PULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30)
                .padding(.trailing, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var SliderValue: Double

    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $SliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button(action: {
            withAnimation {
                self.alertIsVisible = true
            } 
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .overlay(
         RoundedRectangle(cornerRadius: 21)
          .strokeBorder(Color.white, lineWidth: 2))
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 528, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 528, height: 320))
    }
}
