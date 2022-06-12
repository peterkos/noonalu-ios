//
//  MainView.swift
//  TimeFinder
//
//  Created by Peter Kos on 6/9/22.
//

import SwiftUI



struct MyView: View {
    var body: some View {
        VStack {
            Card()
        }

    }
}

struct CoolButton: View {
    var body: some View {
        Button("Event") {
        }
        .padding([.horizontal], 20)
        .padding([.vertical], 10)
        .background(.white)
        .cornerRadius(15)
        .foregroundColor(.black)
    }
}

struct Card: View {

    @Binding var toggle: Bool

    init(toggle: Binding<Bool>) {
        self._toggle = toggle
    }

    init() {
        self.init(toggle: .constant(false))
    }

    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                CoolButton()
                CoolButton()
                CoolButton()
                CoolButton()
                CoolButton()
            }
            .padding(10)
            .background(.indigo)
            .foregroundColor(.white)
            .cornerRadius(10)

            VStack(alignment: .leading) {
                CoolButton()
                CoolButton()
                CoolButton()
                CoolButton()
                CoolButton()
            }
            .padding(10)
            .background(.indigo)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }

}


struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}


