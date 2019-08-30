//
//  QuestionBank.swift
//  DragonBallQuiz
//
//  Created by Vivek Dosaya on 30/08/19.
//  Copyright © 2019 Vivek Dosaya. All rights reserved.
//

import Foundation
class QuestionBank{
    var list = [Question]()
    init(){
    list.append(Question(question: "Goku is the most powerful character ever created!", ans: true))
    list.append(Question(question: "vegeta is the stronhgest character", ans: false))
    list.append(Question(question: "Bulma is Vegeta's wife", ans: true))
    list.append(Question(question: "Jiren won against Goku!", ans: false))
    list.append(Question(question: "iron man is best", ans: true))
    }
}
