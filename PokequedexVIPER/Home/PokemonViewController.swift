//
//  ViewController.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 29/01/24.
//

import Foundation
import UIKit
import Kingfisher

protocol PokemonViewProtocol {
    var presenter: PokemonPresenterProtocol? { get set }
    func update(with pokemon: PokemonEntity)
    func update(with error: String)
}

class PokemonViewController: UIViewController, PokemonViewProtocol {
    var presenter: PokemonPresenterProtocol?

    // properties
    var presenterDelegate: PokemonPresenter?

    //objects
    private let circleView = UIView()
    private let pokemonImage = UIImageView()
    private let numberPokemon = UILabel()
    private let namePokemonLabel = UILabel()
    private let btnShowPokemon = UIButton()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FUNCS HOMEVIEW
        setupObjects()
        setupConstrains()
        presenter?.getRandomPokemon()
        initTimer()
        
    }

    private func setupObjects() {
        //Register
        view.register(view: circleView)
        view.register(view: pokemonImage)
        view.register(view: numberPokemon)
        view.register(view: namePokemonLabel)
        view.register(view: btnShowPokemon)
        
        //Backgrounds
        view.backgroundColor = UIColor(named: "lightBlue")
        circleView.backgroundColor = .white

        //Adjust objects
        circleView.layer.cornerRadius = 150
        circleView.layer.masksToBounds = true

        pokemonImage.contentMode = .scaleAspectFit

        numberPokemon.numberOfLines = 0
        numberPokemon.textAlignment = .center
        numberPokemon.backgroundColor = .gray
        numberPokemon.layer.cornerRadius = 8
        numberPokemon.layer.masksToBounds = true
        numberPokemon.adjustsFontSizeToFitWidth = true
        
        namePokemonLabel.numberOfLines = 0
        namePokemonLabel.adjustsFontSizeToFitWidth = true
        namePokemonLabel.textAlignment = .center
        namePokemonLabel.font = .systemFont(ofSize: 32,
                                            weight: .bold,
                                            width: .condensed)

        btnShowPokemon.setTitle("Mostrar Pokemon", for: .normal)
        btnShowPokemon.tintColor = .black
        btnShowPokemon.layer.backgroundColor = UIColor(.gray).cgColor
        btnShowPokemon.layer.borderWidth = 1
        btnShowPokemon.layer.cornerRadius = 20
        btnShowPokemon.addTarget(self, action: #selector(showPokemonButtonPressed), for: .touchUpInside)
        btnShowPokemon.isUserInteractionEnabled = true
        
    }

    private func setupConstrains() {
        NSLayoutConstraint.activate([
           
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            circleView.heightAnchor.constraint(equalToConstant: 300),
            circleView.widthAnchor.constraint(equalToConstant: 300),
            
            pokemonImage.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 30),
            pokemonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pokemonImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pokemonImage.heightAnchor.constraint(equalToConstant: 260),
            pokemonImage.widthAnchor.constraint(equalToConstant: 260),

            numberPokemon.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 50),
            numberPokemon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberPokemon.heightAnchor.constraint(equalToConstant: 18),
            numberPokemon.widthAnchor.constraint(equalToConstant: 100),

            namePokemonLabel.topAnchor.constraint(equalTo: numberPokemon.bottomAnchor, constant: 15),
            namePokemonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            namePokemonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            btnShowPokemon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            btnShowPokemon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnShowPokemon.heightAnchor.constraint(equalToConstant: 50),
            btnShowPokemon.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }


    func update(with pokemon: PokemonEntity) {
        DispatchQueue.main.async { [weak self] in
            self?.namePokemonLabel.text = pokemon.name
            self?.numberPokemon.text = "#\(pokemon.id)"
        }
        self.pokemonImage.setupImageAPI(number: pokemon.id)
        print(pokemon)
    }
    

    func update(with error: String) {
       print(error)
    }
    
    private func initTimer() {
        if let timer {
            timer.invalidate()
            self.timer = nil
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true, block: { timer in
            self.presenter?.getRandomPokemon()
        })
    }

    
    @objc func showPokemonButtonPressed() {
        initTimer()
        presenter?.getRandomPokemon()
    }
}
