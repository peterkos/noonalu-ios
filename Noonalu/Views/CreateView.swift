//
//  MainView.swift
//  Noonalu
//
//  Created by Peter Kos on 6/9/22.
//

import SwiftUI



struct CreateView: View {

    var hoursInDay = 8
    let days = ["Sun", "Mon"]

    var body: some View {
        HStack {
            ForEach(days, id: \.self) { day in
                VStack {
                    Text(day)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.nooLightGray))

                    ForEach(0..<hoursInDay) { _ in
                        Cell("Day")
                            .frame(height: 30)
                            .padding([.vertical], 10)
                    }
                }
            }
        }
        // TODO: make this a cleaner width calculation,
        // and/or actually convert to use pagination for widths
        .frame(width: CGFloat(days.count) * 120.0)
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
