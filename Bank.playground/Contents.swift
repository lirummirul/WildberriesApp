import UIKit

// Определяем структуру для хранения информации о банковском счете
struct Account {
    var number: Int
    var balance: Decimal

    // Метод для пополнения счета
    mutating func deposit(amount: Decimal) {
        balance += amount
    }

    // Метод для перевода средств со счета
    mutating func transfer(amount: Decimal, to account: inout Account) {
        if balance >= amount {
            balance -= amount
            account.deposit(amount: amount)
        } else {
            print("Недостаточно средств на счете")
        }
    }
}

// Определяем класс для хранения информации о банке и его счетах
class Bank {
    var accounts: [Account] = []

    // Метод для добавления нового счета
    func addAccount(number: Int, balance: Decimal) {
        let account = Account(number: number, balance: balance)
        accounts.append(account)
    }

    // Метод для печати информации о всех счетах
    func printAccounts() {
        for account in accounts {
            print("Счет \(account.number): \(account.balance)")
        }
    }
}

// Создаем объект класса Bank и добавляем несколько счетов
let bank = Bank()
bank.addAccount(number: 123, balance: 1000.0)
bank.addAccount(number: 456, balance: 2000.0)
bank.addAccount(number: 789, balance: 3000.0)

// Печатаем состояние всех счетов до выполнения операций
print("Состояние счетов до выполнения операций:")
bank.printAccounts()

// Выполняем операции пополнения счета и перевода средств между счетами
if var account1 = bank.accounts.first(where: { $0.number == 123 }),
   var account2 = bank.accounts.first(where: { $0.number == 456 }) {
    account1.deposit(amount: 500.0)
    account1.transfer(amount: 250.0, to: &account2)

    // Обновляем информацию о счетах в банке
    if let index1 = bank.accounts.firstIndex(where: { $0.number == 123 }),
       let index2 = bank.accounts.firstIndex(where: { $0.number == 456 }) {
        bank.accounts[index1] = account1
        bank.accounts[index2] = account2
    }
}

// Печатаем состояние всех счетов после выполнения операций
print("Состояние счетов после выполнения операций:")
bank.printAccounts()
