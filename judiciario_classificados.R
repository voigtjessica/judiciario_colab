library(readxl)
v2ana_judiciariov2 <- read_excel("C:/Users/jvoig/OneDrive/Documentos/judiciario_colab/arquivos_originais/ana_judiciariov2.xlsx", 
                               col_types = c("text", "text", "text", 
                                             "text", "text", "text", "text", "text", 
                                             "text", "text", "text", "text", "numeric", 
                                             "text", "text", "text", "text", "text", 
                                             "text", "text", "text", "text", 
                                             "text", "text", "text", 
                                             "text", "text", "text", 
                                             "text", "text", "text", 
                                             "text", "text"))
v2jose_judiciariov2 <- read_excel("C:/Users/jvoig/OneDrive/Documentos/judiciario_colab/arquivos_originais/jose_judiciariov2.xlsx", 
                                  col_types = c("text", "text", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "text", "text", 
                                                "text", "text", "text", "text", "text", 
                                                "text", "text", "text", 
                                                "text", "text", "text", 
                                                "text", "text", "text", 
                                                "text", "text", "text", 
                                                "text", "text", "text"))
v2lizandra_judiciariov3 <- read_excel("C:/Users/jvoig/OneDrive/Documentos/judiciario_colab/arquivos_originais/lizandra_judiciariov3.xlsx", 
                                      col_types = c("text", "text", "text", 
                                                    "text", "text", "text", "text", "text", 
                                                    "text", "text", "text", "text", 
                                                    "text", "text", "text", "text", 
                                                    "text", "text", "text", "text", 
                                                    "text", "text", "text", 
                                                    "text", "text", "text", 
                                                    "text", "text", "text", 
                                                    "text", "text", "text"))
v2lucas_judiciariov2 <- read_excel("C:/Users/jvoig/OneDrive/Documentos/judiciario_colab/arquivos_originais/lucas_judiciariov2.xlsx", 
                                   col_types = c("text", "text", "text", 
                                                 "text", "text", "text", "text", "text", 
                                                 "text", "text", "text", "text", 
                                                 "text", "text", "text", "text", "text", 
                                                 "text", "text", "text", 
                                                 "text", "text", "text", "text", 
                                                 "text", "text", "text", 
                                                 "text", "text", "text", 
                                                 "text"))

v2jose_judiciariov2 <- v2jose_judiciariov2 %>%
  mutate(pasta_anexo_resposta_recurso_2 = as.character(NA) ,
         nome_anexo_resposta_recurso_2 = as.character(NA)) %>%
  rename(pasta_do_anexo_pedido = pedido_pasta_do_anexo_pedido)

v2ana_judiciariov2 <- v2ana_judiciariov2 %>%
  mutate(nao_e_pedido_de_informacao = as.character(nao_e_pedido_de_info),
         anexo_com_extensao_pedido = as.character(nome_do_anexo_pedido),
         anexo_com_extensao_resposta = as.character(nome_do_anexo_resposta),
         pasta_do_anexo_recurso_1 = as.character(pasta_anexo_recurso_1),
         anexo_com_extensao_recurso_1 = as.character(nome_anexo_recurso_1),
         pasta_do_anexo_resposta_recurso_1 = as.character(pasta_anexo_resposta_recurso_1),
         anexo_com_extensao_resposta_recurso_1 = as.character(nome_anexo_resposta_recurso_1),
         pasta_do_anexo_recurso_2 = as.character(pasta_anexo_recurso_2),
         anexo_com_extensao_recurso_2 = as.character(nome_anexo_recurso_2),
         revisado = as.character(NA)) %>%
  select(-c(nao_e_pedido_de_info, nome_do_anexo_pedido, nome_do_anexo_resposta,
            pasta_anexo_recurso_1,nome_anexo_recurso_1, pasta_anexo_resposta_recurso_1,
            nome_anexo_resposta_recurso_1, pasta_anexo_recurso_2, nome_anexo_recurso_2))


v2lizandra_judiciariov3 <- v2lizandra_judiciariov3 %>%
  mutate(pasta_anexo_resposta_recurso_2 = as.character(NA),
         nome_anexo_resposta_recurso_2 = as.character(NA)) %>%
  rename(pasta_do_anexo_pedido = pedido_pasta_do_anexo_pedido)

v2lucas_judiciariov2 <- v2lucas_judiciariov2 %>%
  mutate(pasta_anexo_resposta_recurso_2 = as.character(NA),
         nome_anexo_resposta_recurso_2 = as.character(NA),
         revisado = as.character(NA))

#vendo quais os nomes que são diferentes

ana <- names(v2ana_judiciariov2)
df_ana <- data.frame(ana)

jose <- names(v2jose_judiciariov2)
df_jose <- data.frame(jose)

liz <- names(v2lizandra_judiciariov3)
df_liz <- data.frame(liz)

lucas <- names(v2lucas_judiciariov2)
df_lucas <- data.frame(lucas)

col_dif <- df_ana %>%
  anti_join(df_lucas, by=c("ana" = "lucas"))

##

judiciario_classificados <- bind_rows(v2ana_judiciariov2, v2jose_judiciariov2, 
                                      v2lucas_judiciariov2, v2lizandra_judiciariov3)

setwd("C:\\Users\\jvoig\\OneDrive\\Documentos\\judiciario_colab")
save(judiciario_classificados, file="judiciario_classificados.Rdata")
