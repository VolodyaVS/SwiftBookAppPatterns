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
    var viewModel: CourseDetailsViewModelProtocol! {
        didSet {
            courseNameLabel.text = viewModel.courseName
            numberOfLessonsLabel.text = viewModel.numberOfLessons
            numberOfTestsLabel.text = viewModel.numberOfTests
            
            guard let imageData = viewModel.imageData else { return }
            courseImage.image = UIImage(data: imageData)
        }
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseDetailsViewModel(course: course)
        setImageForFavoriteButton()
    }
    
    // MARK: - IBActions
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.isFavorite.toggle()
        setImageForFavoriteButton()
    }
    
    // MARK: - Private Methods
    private func setImageForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
}
