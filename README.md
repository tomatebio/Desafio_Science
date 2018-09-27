# Desafio_Science

  Este repositório faz parte do desafio Data Science. Neste desafio tento responder algumas perguntas sobre um banco de dados. O banco de dados utilizado  é o Bank Marketing Data Set, que é relacionado a campanhas de marketing por telefone. A fonte oficial dos dados é https://archive.ics.uci.edu/ml/datasets/bank+marketing.

# Arquivos deste repositório

-Analise.r  codigos em R das análises

- bank.csv, bank-full.csv, bank-names.txt arquivos originais  da fonte de dados

- perguntas.txt rascunho das respostas

- RelatorioCompleto.pdf Relatorio com os códigos, gráficos e estratégias utilizadas para responder as questões.

- RelatorioCompleto.Rmd arquivo fonte do RelatorioCompleto.pdf

- TodasVar.pdf arquivo auxiliar para o relatório
  
# Respostas

1- Qual profissão tem mais tendência a fazer um empréstimo? De qual tipo?

 A profissão que tem maior tendencia de fazer um empréstimo é a de operário (blue-collar). No banco de dados analisado 78% dos operários fazem algum tipo de empréstimo. Sendo 72% dos operários tem empréstimo imobiliário, 13% tem empréstimo pessoal e 11% possui ambos empréstimos.
 
2 Fazendo uma relação entre número de contatos e sucesso da campanha quais são os pontos relevantes a serem observados?
      Um grande número de contatos não aumenta a chance de sucesso do contato.
      
3. Baseando-se nos resultados de adesão desta campanha qual o número médio e o máximo de ligações que você indica para otimizar a adesão? 

  Dada as distribuições apresentadas indico que o número médio de ligações seja 2 pois é a média das ligações que se converteram em adesão. O número  máximo que eu indico para obter 95% de aproveitamento é de 5 ligações. 
  
4. O resultado da campanha anterior tem relevância na campanha atual?
  Sim, o resultado da campanha anterior tem relevância para o resultado da campanha atual. Uma falha na campanha passada pode resultar em uma falha na campanha atual. 
  
5. Qual o fator determinante para que o banco exija um seguro de crédito?
   O fator é a idade. O banco oferece o credito default sem necessitar de seguro do credito para quem esta em idade economicamente ativa (<60 anos). Embora a  variável saldo (balance) seja melhor para classificar quem tem credito sem seguro não faz sentido o banco usar o saldo baixo como condição para não exigir seguro. 
  
6. Quais são as características mais proeminentes de um cliente que possua empréstimo imobiliário?

   Uma pessoa que tenha um empréstimo imobiliário tem menos que 55 anos, é operário e tem um saldo bancário maior que -66 euros

# Fontes de dados, bibliotecas, etc.
   Não foram ultilizados outras fontes de dados que a fornecida pelo desafio. Os dois artigos citados na fonte oficial dos dados foram consultados para melhor entendimento dos dados. Foi utilizado a linguagem R e pacotes (ggplot2,caret)