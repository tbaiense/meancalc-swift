/*

+==========================================================+
| MeanCalculator - Calculadora simples de média aritmética |
+==========================================================+

É possível utilizá-la de duas maneiras:
    1. Executando o executável binário (modo interativo)
    2. Através de argumentos numéricos na linha de comando

Obs.: Para finalizar a execução no modo interativo e obter 
o valor da média, pressione a combinação de teclas 'CTRL+D'.

Thiago Moura Baiense.
Agosto, 2025

*/

struct MeanCalculator {
    private(set) var sum: Double = 0
    private(set) var added: Int = 0
    private(set) var arithmeticMean: Double = 0

    @discardableResult
    mutating func add(_ number: Int) -> Double {
        return add(Double(number))
    }

    @discardableResult
    mutating func add(_ number: Double) -> Double {
        sum += number
        added += 1
        arithmeticMean = Double(sum) / Double(added)

        return sum
    }

    static func readInteractively() {
        var meanCalc = self.init()
        var shouldContinue: Bool 
        repeat {
            shouldContinue = false

            print("Insira um número: ", terminator: "")
            let input = readLine()

            guard var input else { continue }

            if let commaIndex = input.firstIndex(of: ",") {
                input.replaceSubrange(
                    commaIndex..<input.index(after: commaIndex),
                    with: "."
                    )
            }

            guard let num = Double(input) else {
                print("Número inválido. Tente novamente...")
                shouldContinue = true
                continue
            }

            meanCalc.add(num)
            print("Número adicionado!")
            shouldContinue = true
        } while shouldContinue

        if meanCalc.added > 0 {
            print("\nA média calculada foi: \(meanCalc.arithmeticMean)")
        } else {
            print("Nenhum número foi inserido.")
        }
    }

    static func readArguments(_ args: [String]) {
        var meanCalc = self.init()

        guard args.count > 1 else { 
            print(
                """
                Erro: nenhum argumento foi fornecido.
                """
            )
            return
        }

        for input in args[1..<args.endIndex] {
            guard input.count > 0 else { continue }

            var numberStr = input
            if let commaIndex = input.firstIndex(of: ",") {
                numberStr.replaceSubrange(
                    commaIndex..<numberStr.index(after: commaIndex), 
                    with: "."
                )
            }

            if let numberAsDouble = Double(numberStr) {
                meanCalc.add(numberAsDouble)
            } else {
                print("Número inválido lido: \(input)")
            }
        }

        if meanCalc.added > 0 {
            print("Média calculada: \(meanCalc.arithmeticMean)")
        } else {
            print("Nenhum número válido foi lido.")
        }
    }
}

if CommandLine.arguments.count > 1 {
    MeanCalculator.readArguments(CommandLine.arguments)
} else {
    MeanCalculator.readInteractively()
}
