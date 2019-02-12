//
//  Provider.swift
//  GraphicMotionApplication
//
//  Created by Ipinguin_linuxoid on 2019/02/12.
//  Copyright © 2019 ipinguin_linuxoid. All rights reserved.
//

import Foundation
import RxSwift

protocol Provider : class{
    func startUpdates()
    func stopUpdates()
    func getUpdates() -> Observable<Int>
}
