//
//  DetailsViewController.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    var cocktailItem: CocktailListItem?
    private lazy var dataManager = CocktailDataManager()
    
    //MARK: - Outlets
    @IBOutlet weak var preparationTimeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    @IBOutlet weak var ingredientsStackView: UIStackView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func favoriteButtonAction(_ sender: Any) {
        
        guard let cocktailItem = cocktailItem else { return }
        
        dataManager.setFavorite(cocktailItem: cocktailItem) { [weak self] isFavorite in
            let image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
            DispatchQueue.main.async {
                self?.favoriteButton.setImage(image, for: .normal)
            }
        }
    }
    
    //MARK: - Private methods
    private func configureView(){
        title = cocktailItem?.name
        preparationTimeLabel.text = cocktailItem?.preparationTime ?? ""
        imageView.image = cocktailItem?.image
        longDescriptionLabel.text = cocktailItem?.longDescription
        if let count = cocktailItem?.ingredientsCount, count > 0 {
            for i in 0...count-1 {
                let ingredientView: IngredientView = .fromNib()
                ingredientView.setupView(text: cocktailItem?.ingredient(index: i) ?? "")
                ingredientsStackView.addArrangedSubview(ingredientView)
            }
        }
    }
}
