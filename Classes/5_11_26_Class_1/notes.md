# Aula 1

	1. Obectivo da Aula
		- Reconhecer a estrutura basica de um programa ADA;
		- perceber a diferenca entre declaracoes e instrucoes executaveis
		- usar um tipo enumerado para modelar estados de hardware
		- perceber por que ADA e util em firmware critico: muitos erros sao apanhados pelo comilador, nao em runtime.

	A ideia central: ADA forca te a modelar o dominio antes de escrever logica. Isto e excelente para firmware.

	2. Conceito principal

# Tipos fortes e modelacao de estados

Em C, e comum representar estados com int, enum, #define ou uint_t
Em Ada, podemos criar um tipo que representa exactamente os estados validos. 

	type Led_State is (Off, On);

- Isto significa:
	. uma variavel Led_State so pode ser Off ou On;
	. nao podes acidentalmente atribuir 42;
	. o compilador protege a logica.

- Em embedded, isto aparece em: 
	. estados de LEDs;
	. estados de botoes;
	. estados de comunicacao UART/SPI/I2C;
	. estados de uma maquina de estados;
	. modos de operacao de um driver;
	. safety-critical systems onde estados invalidos sao perigrosos. 

o livro destaca que ADA foi criada com foco em integridade, legibilidade, reutilizacao, excecoes,
abstracao, tasking e programacao em larga escala.
Para mim, focar me hoje em integridade + legibilidade + tipos fortes. 

3. Exemplo pequeno em ADA

		with Ada.Text_IO;
		use Ada.Text_IO;

		procedure Led_Controller is

			type Led_State is (Off, On);

			Led : Led_State := Off;

		begin
			if Led = Off then
				Put_Line ("LED is off");
				Led := On;
			end if;

			if Led = On then
				Put_Line ("LED is now ON");
			end if;
		end Led_Controller;

4. Ligacao a embedded engineering

- A vantagem de ADA e que o estado logico fica protegido. Um LED nao pode entrar num estado impossivel
, amenos que tu o declares.


# Perguntas

:= (e atribuicao)
= (e uma comparacao)

:= → altera o estado.
= → testa o estado.


