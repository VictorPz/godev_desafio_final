//
//  DetailItemStackViewDelegate.swift
//  godev_projeto_final
//
//  Created by Rogério Tavares on 02/04/22.
//

import Foundation

enum ButtonTypeEnum {
    case phone(String)
    case email(String)
    case linkedin(String)
    case github(String)
}

protocol DetailItemStackViewDelegate {
    func detailButtonPressedPhone(_ value: String)
    func detailButtonPressedEmail(_ value: String)
    func detailButtonPressedLinkedin(_ value: String)
    func detailButtonPressedGithub(_ value: String)
}
