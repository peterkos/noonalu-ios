//
//  MainView.swift
//  TimeFinder
//
//  Created by Peter Kos on 6/9/22.
//

import SwiftUI


extension Color {
    static let nooLightGray = Color(red: 0.85, green: 0.85, blue: 0.85)
    static let nooDarkGray  = Color(red: 0.14, green: 0.14, blue: 0.14)
}

enum CellState: Int {
    case Empty
    case Full
    case FirstHalf
    case SecondHalf
}


struct Cell: View {

    let cellHeight = 30
    let text: String

    @State var cellState: CellState

    init(_ text: String) {
        self.text = text
        self.cellState = .FirstHalf
    }

    var body: some View {
        switch self.cellState {
        case .Empty:
            Text("")
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooLightGray))
                .onTapGesture {
                    self.cellState = .Full
                }
        case .Full:
            Text("")
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooDarkGray))
                .onTapGesture {
                    self.cellState = .FirstHalf
                }
        case .FirstHalf:
            GeometryReader { metrics in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.nooLightGray)
                        .foregroundColor(.white)
                    HStack {
                        Text("00-30")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: metrics.size.width * 0.50)
                            .frame(maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooDarkGray))
                        Spacer()
                    }
                }
                .onTapGesture {
                    self.cellState = .SecondHalf
                }
                .frame(maxHeight: .infinity)
            }.frame(maxHeight: .infinity)
        case .SecondHalf:
            GeometryReader { metrics in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.nooLightGray)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    HStack {
                        Spacer()
                        Text("30-60")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: metrics.size.width * 0.50)
                            .frame(maxHeight: metrics.size.height)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooDarkGray))
                    }
                }
                .onTapGesture {
                    self.cellState = .Empty
                }
            }
        }

    }
}


struct DayCol: View {

    // FIXME
    var hoursInDay = 8

    var body: some View {
        VStack {

            ForEach(0..<hoursInDay) { _ in
                Cell("Day")
                    .frame(height: 30)
                    .padding([.vertical], 10)
            }

        }

    }
}


struct CreateView: View {

    var body: some View {
        DayCol()
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
            .frame(width: 150, height: 500)
    }
}
