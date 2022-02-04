//
//  PersonRow.swift
//  SecretSanta
//
//  Created by Jamon Holmgren on 2/4/22.
//

import SwiftUI

struct PersonRow: View {
    var person: Person
    var checked: Bool = false
    
    var body: some View {
        HStack() {
            AsyncImage(
                url: URL(string: person.image),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    Color.red
                }
            )
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay { Circle().stroke(.white, lineWidth: 1) }
                .shadow(radius: 2)
            
            VStack(alignment: .leading) {
                Text("\(person.name) \(checked ? "✅" : "")")
                    .font(.headline)
                Text(person.title)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct PersonRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonRow(
            person: Person(
                name: "The Rock",
                title: "Bodybuilder",
                image: "https://clue.infinite.red/avatars/jamon.jpg"
            ),
            checked: true
        )
    }
}
