//
//  PokemonRouter.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 30/01/24.
//

import Foundation
import UIKit
// object
// entry point

typealias EntryPoint =  PokemonViewProtocol & UIViewController

protocol PokemonRouterProtocol {
    var entry: EntryPoint? { get set }
    static func start() -> PokemonRouterProtocol
}

class PokemonRouter: PokemonRouterProtocol {
    var entry: EntryPoint?
    
    static func start() -> PokemonRouterProtocol {
        let router = PokemonRouter()
        
        
        // Asing VIP
        var view: PokemonViewProtocol = PokemonViewController()
        var presenter: PokemonPresenterProtocol = PokemonPresenter()
        var interactor: PokemonInteractorProtocol = PokemonInteractor()
        
        view.presenter = presenter

        interactor.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        
        router.entry = view as? EntryPoint
        
        return router
    }
}
