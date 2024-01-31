//
//  HomeProtocols.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 29/01/24.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presnter: HomePresenterProtocol? {get set}
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
   // var entity: HomeEntityProtocol?{get set}

    func viewDidload()
}

protocol HomeEntityProtocol: AnyObject{
    
}

protocol HomeInteractorProtocol: AnyObject{
    
}
