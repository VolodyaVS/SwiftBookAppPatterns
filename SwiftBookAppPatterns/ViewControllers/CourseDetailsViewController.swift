//
//  CourseDetailsViewController.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 16.12.2020.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    
    // MARK: - Public Properties
    var course: Course!
    
    // MARK: - Private Properties
    private var isFavorite = false
    
    // MARK: - Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavoriteStatus()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorite.toggle()
        setImageForFavoriteButton()
        DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: isFavorite)
    }
    
    // MARK: - Public Methods
    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
        
    }
    
    private func setupUI() {
        courseNameLabel.text = course.name
        numberOfLessonsLabel.text = "Number of lessons: \(course.numberOfLessons ?? 0)"
        numberOfTestsLabel.text = "Number of tests: \(course.numberOfTests ?? 0)"

        courseImage.image = UIImage(data: ImageManager.shared.getImageData(from: course.imageUrl) ?? Data())
        
        setImageForFavoriteButton()
    }
    
}
