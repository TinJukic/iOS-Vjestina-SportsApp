//
//  Result.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit

enum Result<Success, Failure> where Failure : Error {
    case success(Success)
    case failure(Failure)
}
