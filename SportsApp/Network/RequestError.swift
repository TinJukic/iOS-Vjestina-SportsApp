//
//  RequestError.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit

enum RequestError: Error {
    case clientError
    case serverError
    case noDataError
    case dataDecodingError
}
