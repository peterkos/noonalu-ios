//
//  MainView.swift
//  Noonalu
//
//  Created by Peter Kos on 6/9/22.
//

import SwiftUI


struct TeamView: View {

    var body: some View {
        VStack {
            Spacer()
            NooButton(text: "Copy URL")
                .padding([.bottom], 100)
        }
    }

}


struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
