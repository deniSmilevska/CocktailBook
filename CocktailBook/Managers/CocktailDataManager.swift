//
//  CocktailDataManager.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation


final class CocktailDataManager {
    
    //MARK: properties
    
    private let cocktailsApi = FakeCocktailsAPI()
    
    typealias CocktailDataResult = (Result<CocktailList, CocktailsAPIError>) -> ()
    
    func fetchCocktails(completion: @escaping CocktailDataResult){
        cocktailsApi.fetchCocktails { (result) in
            switch result {
            
            case .success(let cocktailData):
               let decoder = JSONDecoder()
                do {
                    var cocktails = try decoder.decode([Cocktail].self, from: cocktailData)
                    cocktails = cocktails.sorted { $0.name < $1.name }
                    let cocktailList = CocktailList(cocktails: cocktails)
                    completion(.success(cocktailList))
                } catch{
                    completion(.failure(.unavailable))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func setFavorite(cocktailItem: CocktailListItem, completion: @escaping (Bool)->()){
        //save to realm here.
        completion(true)
    }
}
