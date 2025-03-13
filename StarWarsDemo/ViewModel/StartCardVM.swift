//
//  StartCardVM.swift
//  StarWarsDemo
//
//  Created by Eduardo Monroy Husillos on 3/13/25.
//

import SwiftUI

@Observable
final class StarCardVM {
    let repository: DataRepository
    
    var cards: [StarCard]
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            cards = try repository.getData()
        } catch {
            cards = []
        }
    }
}
