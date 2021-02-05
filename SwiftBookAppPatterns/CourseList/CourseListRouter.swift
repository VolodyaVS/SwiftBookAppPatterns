//
//  CourseListRouter.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

protocol CourseListRouterInputProtocol {
    init(viewController: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterInputProtocol {
    unowned let viewController: CourseListViewController
    
    required init(viewController: CourseListViewController) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: Segues.showDetails.rawValue , sender: course)
    }
}
