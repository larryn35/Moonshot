//
//  AstronautView.swift
//  Moonshot
//
//  Created by Larry Nguyen on 9/12/20.
//  Copyright © 2020 Larry Nguyen. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let missionsFlown: [String]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack{
                                        
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    ForEach(self.missionsFlown, id: \.self) { mission in
                        Text(mission)
                            .font(.headline)
                    }
                    
                    Text(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [String]()
        
        let missions: [Mission] = Bundle.main.decode("missions.json")
    
        for mission in missions {
            for _ in mission.crew {
                if let match = mission.crew.first(where: {$0.name == astronaut.id}) {
                    matches.append("Apollo \(mission.id) - \(match.role)")
                    break
                }
            }
        }
        self.missionsFlown = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}

