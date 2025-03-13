//
//  ContentView.swift
//  StarWarsDemo
//
//  Created by Eduardo Monroy Husillos on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    @State var vievModel = StarCardVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vievModel.cards) { card in
                    StarCardView(card: card)
                    //Text(card.nombre)
                }
            }
            .navigationTitle("Star Wars")
        }
    }
}

#Preview {
    //ContentView(vm: StarCardVM(repository: RepositoryTest())) // para pasarle al contentView el repositorio de test que hemos creado en el respository
    ContentView()
}
