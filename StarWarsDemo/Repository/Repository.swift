//
//  Repository.swift
//  StarWarsDemo
//
//  Created by Eduardo Monroy Husillos on 3/13/25.
//

import Foundation

protocol DataRepository { // protocolo para poder usar urls diferentes
    var url: URL { get }
}

struct Repository: DataRepository { // url donde estan los datos JSON
    var url: URL {
        Bundle.main.url(forResource: "StarWars", withExtension: "json")!
    }
}

struct RepositoryTest: DataRepository { // url donde estan los datos de Pruebas
    var url: URL {
        Bundle.main.url(forResource: "StarWars Test", withExtension: "json")!
    }
}

extension DataRepository { // extension del protocolo donde esta la funcion getData que se podrá utilizar con ambas llamadar a la URL
    func getData() throws -> [StarCard] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([StarCardDTO].self, from: data).map(\.toCard)
    }
}
