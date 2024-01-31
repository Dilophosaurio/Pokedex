//
//  HomePresenter.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 29/01/24.
//

import Foundation

protocol PokemonPresenterProtocol {
    var router: PokemonRouterProtocol? { get set }
    var interactor: PokemonInteractorProtocol? { get set }
    var view: PokemonViewProtocol? { get set }
    var randomID: Int { get set }
    func showRandomPokemon(with result: Result<PokemonEntity, Error>)
    func getRandomPokemon()
}

class PokemonPresenter: PokemonPresenterProtocol {
    //TIMER 30 SECONDS
    var randomID: Int = 0
    var router: PokemonRouterProtocol?
    var view: PokemonViewProtocol?
    var interactor: PokemonInteractorProtocol?

    func showRandomPokemon(with result: Result<PokemonEntity, Error>) {
        // timer reset 0 - 30
        
        switch result {
        case .success(let pokemon):
            view?.update(with: pokemon)
        case .failure(let failure):
            view?.update(with: failure.localizedDescription)
        }
    }

    func getRandomPokemon() {
        getRandomId()
        interactor?.fetchRandomPokemon()
    }

    // HELPER

    private func getRandomId() {
         let array = [1...1025, 10001...10277]
         let element = array.randomElement()
         guard let secureId = element?.randomElement() else {
             return
         }
         randomID = secureId
     }

    
}
