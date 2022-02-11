//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by AbdulKadir Akkaş on 11.02.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game


    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView{
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date

    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(text: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}


struct HeaderView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "LeaderBoard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button {
                    leaderBoardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {

    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)

        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))

    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
