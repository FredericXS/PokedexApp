//
//  PokemonSelcted.swift
//  Pokedex
//
//  Created by Ashborn on 26/01/23.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var weight: Int
    var height: Int
    var base_experience: Int
    var id: Int
    var types: [PokemonTypes]
    var abilities: [PokemonAbilities]
}

struct PokemonTypes: Codable, Identifiable {
    let id = UUID()
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
}
struct PokemonAbilities: Codable, Identifiable {
    let id = UUID()
    var ability: PokemonAbility
    var is_hidden: Bool
}

struct PokemonAbility: Codable {
    var name: String
}

struct PokemonSprites: Codable {
    var front_default: String?
}

class PokemonSelectedApi  {
    func getSprite(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }
        .resume()
    }
    
    func getTypes(url: String, completion: @escaping ([PokemonTypes]) -> ()) {
        do {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                
                let pokemonType = try! JSONDecoder().decode(PokemonSelected.self, from: data)
                
                DispatchQueue.main.async {
                    completion(pokemonType.types)
                }
            }
            .resume()
        }
    }
    
    func getAbilities(url: String, completion: @escaping ([PokemonAbilities]) -> ()) {
        do {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                
                let pokemonAbility = try! JSONDecoder().decode(PokemonSelected.self, from: data)
                
                DispatchQueue.main.async {
                    completion(pokemonAbility.abilities)
                }
            }
            .resume()
        }
    }
    
    func getBaseExperience(url: String, completion: @escaping (Int) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonBase = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonBase.base_experience)
            }
        }
        .resume()
    }
    
    func getId(url: String, completion: @escaping (Int) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonBase = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonBase.id)
            }
        }
        .resume()
    }
    
    func getHeight(url: String, completion: @escaping (Double) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonBase = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(Double(pokemonBase.height))
            }
        }
        .resume()
    }
    
    func getWeight(url: String, completion: @escaping (Double) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonBase = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(Double(pokemonBase.weight))
            }
        }
        .resume()
    }
}
