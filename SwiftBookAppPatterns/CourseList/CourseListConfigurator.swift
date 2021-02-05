//
//  CourseListConfigurator.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 04.02.2021.
//

import Foundation

protocol CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseListViewController) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
