//
//  observer.swift
//  mvvmStudy
//
//  Created by zeze kim on 2023/09/13.
//

import Foundation
// 제네릭타입으로변경
class observable<T> {
    private var listener : ((T) -> Void) = {
        name in
        print(name)
    }
    var value :T{
        didSet {
            listener(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
    func bind(_ closure:@escaping (T)-> Void) {
        print(#function)
        closure(value)
        listener = closure

    }
}
