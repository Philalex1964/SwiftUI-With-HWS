//
//  AstronuatView.swift
//  Moonshot
//
//  Created by Aleksandar Filipov on 3/29/22.
//

import SwiftUI

struct AstronuatView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronuatView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronuatView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
