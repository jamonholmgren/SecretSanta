//
//  ContentView.swift
//  SecretSanta
//
//  Created by Jamon Holmgren on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    let api = API()
    @State var persons: Array<Person> = []
    @State var participating: Array<String> = []
    
    var body: some View {
        List(persons, id: \.name) { person in
            let checked = participating.contains(person.name)
            
            PersonRow(person: person, checked: checked)
                .onTapGesture {
                    if (checked) {
                        participating.removeAll { $0 == person.name }
                    } else {
                        participating.append(person.name)
                    }
                }
        }
        .task {
            persons = await api.fetchPersons(url: API_URL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(persons: [
            Person(name: "Jamon Holmgren", title: "CTO", image: "https://clue.infinite.red/avatars/jamon.jpg"),
            Person(name: "Joe Smith", title: "CTO", image: "https://clue.infinite.red/avatars/jamon.jpg")
        ])
    }
}
