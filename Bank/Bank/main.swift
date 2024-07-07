//
//  main.swift
//  Bank
//
//  Created by Лада on 07.07.2024.
//

import Foundation

class Bank {
    private(set) var accounts: [Account] = []

    func createAccount(owner: String, initialBalance: Decimal) {
        let account = Account(owner: owner, balance: initialBalance)
        accounts.append(account)
        print("Счет для \(owner) создан. Номер счета: \(account.number)")
    }

    func deposit(accountNumber: Int, amount: Decimal) {
        if let index = accounts.firstIndex(where: { $0.number == accountNumber }) {
            accounts[index].deposit(amount: amount)
            print("На счет \(accountNumber) поступило \(amount) руб.")
            printAccounts(accountNumber: accountNumber)
        } else {
            print("Счет с номером \(accountNumber) не найден")
        }
    }

    func transfer(fromAccountNumber: Int, toAccountNumber: Int, amount: Decimal) {
        if let fromIndex = accounts.firstIndex(where: { $0.number == fromAccountNumber }),
           let toIndex = accounts.firstIndex(where: { $0.number == toAccountNumber }),
           fromIndex != toIndex {
            accounts[fromIndex].withdraw(amount: amount)
            accounts[toIndex].deposit(amount: amount)
            print("С счета \(fromAccountNumber) переведено \(amount) руб. на счет \(toAccountNumber)")
            printAccounts(accountNumber: fromAccountNumber)
            printAccounts(accountNumber: toAccountNumber)
        } else {
            print("Ошибка перевода")
        }
    }
    

    func printAccounts(accountNumber: Int) {
        if let account = accounts.firstIndex(where: { $0.number == accountNumber }) {
            print("Счет \(accountNumber) с балансом: \(accounts[account].balance)")
        }
    }
}

class Account {
    let number: Int
    private(set) var balance: Decimal
    let owner: String

    init(owner: String, balance: Decimal) {
        self.owner = owner
        self.balance = balance
        self.number = Account.generateNumber()
    }

    func deposit(amount: Decimal) {
        balance += amount
    }

    func withdraw(amount: Decimal) -> Bool {
        if balance >= amount {
            balance -= amount
            return true
        } else {
            print("Недостаточно средств на счету")
            return false
        }
    }

    private static var lastNumber = 0

    private static func generateNumber() -> Int {
        lastNumber += 1
        return lastNumber
    }
}

func main() {
    let bank = Bank()

    while true {
        print("Выберите операцию:")
        print("1. Создать новый счет")
        print("2. Пополнить счет")
        print("3. Перевести деньги со счета на счет")
        print("4. Выйти")

        let choice = Int(readLine()!)!

        switch choice {
        case 1:
            print("Введите имя владельца счета:")
            let owner = readLine()!
            print("Введите начальный баланс счета:")
            if let initialBalance = Decimal(string: readLine()!) {
                bank.createAccount(owner: owner, initialBalance: initialBalance)
            } else {
                print("Неверный формат баланса")
            }
        case 2:
            print("Введите номер счета:")
            let accountNumber = Int(readLine()!)!
            print("Введите сумму пополнения:")
            if let amount = Decimal(string: readLine()!) {
                bank.deposit(accountNumber: accountNumber, amount: amount)
            } else {
                print("Неверный формат суммы для пополнения")
            }
        case 3:
            print("Введите номер счета отправителя:")
            let fromAccountNumber = Int(readLine()!)!
            print("Введите номер счета получателя:")
            let toAccountNumber = Int(readLine()!)!
            print("Введите сумму перевода:")
            if let amount = Decimal(string: readLine()!) {
                bank.transfer(fromAccountNumber: fromAccountNumber, toAccountNumber: toAccountNumber, amount: amount)
            } else {
                print("Неверный формат суммы для перевода")
            }
        case 4:
            print("До свидания!")
            return
        default:
            print("Неверный выбор")
        }
    }
}

main()
