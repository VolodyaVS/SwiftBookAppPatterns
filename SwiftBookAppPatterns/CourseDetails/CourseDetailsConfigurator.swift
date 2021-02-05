//
//  CourseDetailsConfigurator.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

protocol CourseDetailsConfiguratorProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
