//
//  CourseListInteractor.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

protocol CourseListInteractorInputProtocol {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
    
}

protocol CourseListInteractorOutputProtocol: class {
    func coursesDidReceive(_ courses: [Course])
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { courses in
            self.presenter.coursesDidReceive(courses)
        }
    }
}
