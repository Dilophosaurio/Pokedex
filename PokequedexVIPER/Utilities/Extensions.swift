//
//  Extensions.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 29/01/24.
//


import UIKit
import Kingfisher

extension UIView {
    func register(view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    func setupImageAPI(number: Int) {
        DispatchQueue.main.async {
            let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(number).png")
            self.kf.setImage(with: url, placeholder: UIImage(named: "pokeHause"))
        }
    }
}
