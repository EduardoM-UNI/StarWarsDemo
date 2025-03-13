//
//  StarWarsDemoTests.swift
//  StarWarsDemoTests
//
//  Created by Eduardo Monroy Husillos on 3/13/25.
//

import Testing
@testable import StarWarsDemo

extension Tag {
    @Tag static var repository: Self  // Creamos un tag para que en el informe aparezca que los datos vienen del repository
}

@Suite("Prueba del Repository de Star Cards", .tags(.repository))
struct StarWarsDemoTests {
    let repository = RepositoryTest()
    let viewModel = StarCardVM(repository: RepositoryTest())
    
    @Test("Prueba de carga de datos del repositorio")
    func dataLoad() throws {
        let data = try repository.getData() // llamamos al getData del repositorio de la app
        #expect(data.count == 4) // con expect comprobamos de que numero de datos cargados son los que tiene el repositorio de test
    }
    
    @Test("Prueba de carga de datos del ViewModel")
    func dataLoadVM() throws {
        #expect(viewModel.cards.count == 4) // comprobamos el VM que cuando cargue el repository, el vm tenga los elementos del repository Test
    }
}
