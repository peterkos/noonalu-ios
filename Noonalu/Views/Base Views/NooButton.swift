//
//  NooButton.swift
//  Noonalu
//
//  Created by Peter Kos on 6/29/22.
//

import SwiftUI

struct NooButton: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .padding([.horizontal], 60)
            .foregroundColor(.white)
            .background(
                Rectangle().background(Color.nooDarkGray)
                    .cornerRadius(20.0)
            )
        
    }
}

struct NooButton_Previews: PreviewProvider {
    static var previews: some View {
        NooButton(text: "hello")
    }
}
