import UIKit

class Person {
    let fullName: String
    let age: Int
    let passport: Passport

    init(fullName: String, age: Int, passport: Passport) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        print("Человек с именем : \(fullName) инициализирован")
    }

    deinit {
        print("\(fullName) удален из памяти")
    }
}

class Passport {
    let series: String
    let number: String
    let dateOfIssue: Date
    weak var owner: Person?

    init(series: String, number: String, dateOfIssue: Date) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        print("Паспорт \(series) \(number) инициализирован")
    }

    deinit {
        print("Паспорт \(series) \(number) удален из памяти")
    }
}

var passport: Passport? = Passport(series: "AA", number: "123456", dateOfIssue: Date())
var person: Person? = Person(fullName: "Иван Иванов", age: 30, passport: passport!)
passport?.owner = person

print("Сотрудник: \(person?.fullName ?? "Не указан"), возраст: \(person?.age ?? 0), паспорт: \(passport?.series ?? "Не указан") \(passport?.number ?? "Не указан"), дата выдачи: \(passport?.dateOfIssue ?? Date())")

person = nil
passport = nil

