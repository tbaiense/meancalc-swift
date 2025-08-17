# MeanCalculator - Calculadora simples de média aritmética  
Uma simples calculadora escrita em Swift como exercício de aprendizagem.

# Compilação  
Para compilar o projeto é necessário possuir o Swift toolchain instalado. 
Uma vez presente, basta digitar o seguinte comando na raiz do diretório
clonado.  

```
swift build
```

# Executando
O caminho do executável binário gerado se encontra em `.build/debug/meancalc`.
Se referindo ao caminho do executável apenas como `meancalc`, é possível 
utilizá-lo das duas for abaixo: 

1. Interativamente (sem argumentos)
```
meancalc
```
> Para obter o resultado da média calculada, pressione a combinação
'CTRL+D'.

2. Por meio de argumentos
```
meancalc NUMERO [NUMERO]...
```

Onde `NUMERO` representa um número inteiro ou decimal no formato americano 
(p. ex. "3.14") ou brasileiro (p. ex. "10,32").
