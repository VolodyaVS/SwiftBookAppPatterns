//
//  CourseDetailsInteractor.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol {
    var isFavorite: Bool { get set }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
    func toggleFavoriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: class {
    func receiveCourseDetails(courseDetails: CourseDetailsData)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    // MARK: - Public Properties
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private var course: Course
    var isFavorite: Bool {
        get {
            DataManager.shared.loadFavoriteStatus(for: course.name ?? "")
        } set {
            DataManager.shared.saveFavoriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    // MARK: - Override Methods
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    // MARK: - Public Methods
    func provideCourseDetails() {
        let courseDetails = CourseDetailsData(
            courseName: course.name ?? "",
            numberOfLessons: course.numberOfLessons ?? 0,
            numberOfTests: course.numberOfTests ?? 0,
            imageData: ImageManager.shared.getImageData(from: course.imageUrl)
        )
        
        presenter.receiveCourseDetails(courseDetails: courseDetails)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
    }
    
}
