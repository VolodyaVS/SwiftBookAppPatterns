//
//  CourseDetailsPresenter.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    
    // MARK: - Public Properties
    unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    var isFavorite: Bool {
        interactor.isFavorite
    }
    
    // MARK: - Override Methods
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    // MARK: - Public Methods
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
        view.displayImageForFavoriteButton(with: isFavorite)
    }
}

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(courseDetails: CourseDetailsData) {
        view.displayCourseName(with: courseDetails.courseName)
        
        view.displayNumberOfLessons(with: "Number of lessons: \(courseDetails.numberOfLessons)")
        view.displayNumberOfTests(with: "Number of tests: \(courseDetails.numberOfTests)")
        
        view.displayImageForFavoriteButton(with: isFavorite)
        
        guard let imageData = courseDetails.imageData else { return }
        view.displayImage(with: imageData)
        
    }
}
