//
//  HomeInteractor.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 29/01/24.
//
import Foundation
protocol PokemonInteractorProtocol {
    var presenter: PokemonPresenterProtocol? { get set }
    func fetchRandomPokemon()
}

class PokemonInteractor: PokemonInteractorProtocol {
    var presenter: PokemonPresenterProtocol?
    
    func fetchRandomPokemon() {
        guard let secureID = presenter?.randomID,
               let pokemonURL = URL(string:"https://pokeapi.co/api/v2/pokemon/\(secureID)") else { return }
        
         
        
        let task = URLSession.shared.dataTask(with: pokemonURL) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                if let error {
                    self?.presenter?.showRandomPokemon(with: .failure(error))
                }
                
                return
            }
            
            do {
                let response = try JSONDecoder().decode(PokemonEntity.self, from: data)
                self?.presenter?.showRandomPokemon(with: .success(response))
            }
            catch {
                self?.presenter?.showRandomPokemon(with: .failure(error))
            }
            
        }
        task.resume()
        }
    }
