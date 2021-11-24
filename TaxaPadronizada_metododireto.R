##############################################################################
### TAXA PADRONIZADA POR IDADE
### METODO DIRETO
### POP PADRAO BRASIL, 2018
### NATALIA PAIVA - IESCP UFRJ
### Colaboradores: Ednei Cesar de Arruda Santos Junior, Pedro Henrique Mattos Ferreira
####               Mariana da Silva Costa e Paula Cristina Pungartnik
###############################################################################



library( PHEindicatormethods) # taxa padronizada metodo direto
library(dplyr)
library(rio)


# Calculate Directly Standardised Rates using phe_dsr


# Populacoes de 2018: IBGE/Diretoria de Pesquisas. Coordenação de População e Indicadores Sociais. Gerência de Estudos e Análises da Dinâmica Demográfica.
# Projeção da população do Brasil e Unidades da Federação por sexo e idade para o período 2000-2030

# Casos novos de Tuberculose (TB) de 2018: Ministério da Saúde/SVS - Sistema de Informação de Agravos de Notificação - Sinan Net


# importando base de dados
dados <- import("casonovoTB_pop_2018_UFs.csv")

head(dados)
View(dados)
str(dados)

# Taxa de incidencia TB (por 100mil hab), AM - 2018
sum(dados$Casos_novos[dados$UF == "AM"])/sum(dados$Pop2018[dados$UF == "AM"])*100000

# Taxa de incidencia TB (por 100mil hab), RJ - 2018
sum(dados$Casos_novos[dados$UF == "RJ"])/sum(dados$Pop2018[dados$UF == "RJ"])*100000

# Taxa de incidencia TB (por 100mil hab), SP - 2018
sum(dados$Casos_novos[dados$UF == "SP"])/sum(dados$Pop2018[dados$UF == "SP"])*100000



# Pop padrao - BRASIL, 2018
pop.padrao <- c(29297789, 33309377, 68416676, 51128797, 8697681, 6665075, 7881840, 3789567)


dados %>%
  group_by(UF) %>%
   phe_dsr(Casos_novos, Pop2018, stdpop = pop.padrao, type = "standard")


