//
//  GeneralHelper.swift
//  SlashTechnicalTest
//
//  Created by Innova Suiff on 30/12/21.
//

import Foundation
import RxSwift

class GeneralHelper {
    static func getInstanceToSubscribeOn() -> ImmediateSchedulerType {
        return ConcurrentDispatchQueueScheduler(qos: .default)
    }

    static func getInstanceToObserveOn() -> ImmediateSchedulerType {
        return MainScheduler.instance
    }
}
