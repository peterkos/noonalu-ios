//
//  CellView.swift
//  Noonalu
//
//  Created by Peter Kos on 6/19/22.
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

    init(_ text: String, state: CellState) {
        self.text = text
        self.cellState = state
    }

    init(_ text: String) {
        self.init(text, state: .Empty)
    }

    var body: some View {
        switch self.cellState {
        case .Empty:
            Text("")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooLightGray))
                .onTapGesture {
                    self.cellState = .Full
                }
        case .Full:
            Text("")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
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
            }
            .frame(height: 50)
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
                            .frame(maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooDarkGray))
                    }
                }
                .onTapGesture {
                    self.cellState = .Empty
                }
            }
            .frame(height: 50)
        }
    }
}



struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Cell("Day", state: .Empty)
                .padding([.vertical], 10)
            Cell("Day", state: .Full)
                .padding([.vertical], 10)
            Cell("Day", state: .FirstHalf)
                .padding([.vertical], 10)
            Cell("Day", state: .SecondHalf)
                .padding([.vertical], 10)
        }
        .previewLayout(.fixed(width: 200, height: 300))
        .padding([.vertical, .horizontal], 40)
    }
}
