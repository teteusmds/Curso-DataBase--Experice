# Curso-DataBase--Experice

SQL vs NoSQL

As principais diferenças: 

Tipo - os 
bancos de dados SQL são chamados principalmente de Bancos de Dados Relacionais (RDBMS); enquanto o banco de dados NoSQL é chamado principalmente de banco de dados não relacional ou distribuído. 
 

Linguagem - os 
bancos de dados SQL definem e manipulam a linguagem de consulta estruturada (SQL) baseada em dados. Vendo de um lado, essa linguagem é extremamente poderosa. SQL é uma das opções disponíveis mais versáteis e amplamente utilizadas, o que a torna uma escolha segura, especialmente para consultas grandes e complexas. Mas, por outro lado, pode ser restritivo. O SQL requer que você use esquemas predefinidos para determinar a estrutura de seus dados antes de trabalhar com eles. Além disso, todos os seus dados devem seguir a mesma estrutura. Isso pode exigir uma preparação inicial significativa, o que significa que uma mudança na estrutura seria difícil e perturbadora para todo o sistema. 
Um banco de dados NoSQL tem esquema dinâmico para dados não estruturados. Os dados são armazenados de várias maneiras, o que significa que podem ser orientados a documentos, colunas, gráficos ou organizados como um armazenamento KeyValue. Essa flexibilidade significa que os documentos podem ser criados sem ter uma estrutura definida primeiro. Além disso, cada documento pode ter sua própria estrutura única. A sintaxe varia de banco de dados para banco de dados e você pode adicionar campos conforme avança. 

 

A escalabilidade - 
em quase todas as situações, os bancos de dados SQL são verticalmente escaláveis. Isso significa que você pode aumentar a carga em um único servidor aumentando itens como RAM, CPU ou SSD. Mas, por outro lado, os bancos de dados NoSQL são horizontalmente escaláveis. Isso significa que você lida com mais tráfego por fragmentação ou adicionando mais servidores em seu banco de dados NoSQL. É semelhante a adicionar mais andares ao mesmo edifício em vez de adicionar mais edifícios à vizinhança. Assim, o NoSQL pode se tornar maior e mais poderoso, tornando esses bancos de dados a escolha preferida para conjuntos de dados grandes ou em constante mudança. 
 
A Estrutura - os 
bancos de dados SQL são baseados em tabelas, por outro lado, os bancos de dados NoSQL são pares de valores-chave, baseados em documentos, bancos de dados gráficos ou armazenamentos de colunas largas. Isso torna os bancos de dados SQL relacionais uma opção melhor para aplicativos que requerem transações de várias linhas, como um sistema de contabilidade ou para sistemas legados que foram construídos para uma estrutura relacional. 
 
Propriedade seguida - os 
bancos de dados SQL seguem as propriedades ACID (Atomicidade, Consistência, Isolamento e Durabilidade), enquanto o banco de dados NoSQL segue o teorema CAP de Brewers (Consistência, Disponibilidade e Tolerância de partição). 
 
Suporte - 
Ótimo suporte está disponível para todos os bancos de dados SQL de seus fornecedores. Também há muitas consultas independentes que podem ajudá-lo com o banco de dados SQL para implantações em grande escala, mas para alguns bancos de dados NoSQL você ainda precisa contar com o suporte da comunidade e apenas especialistas externos limitados estão disponíveis para configurar e implantar seu NoSQL em grande escala implantações. 
Alguns exemplos de bancos de dados SQL incluem PostgreSQL, MySQL, Oracle e Microsoft SQL Server. Os exemplos de banco de dados NoSQL incluem Redis, RavenDB Cassandra, MongoDB, BigTable, HBase, Neo4j e CouchDB. 

 

Principais destaques em SQL vs NoSQL: 
 

              SQL                                                                                       NOSQL                                          
SISTEMA DE GESTÃO DE BANCO DE DADOS RELACIONAL (RDBMS)                        	        Sistema de banco de dados não relacional ou distribuído.
Esses bancos de dados têm esquema fixo ou estático ou predefinido	                      Eles têm esquema dinâmico
Esses bancos de dados não são adequados para armazenamento hierárquico de dados.      	Esses bancos de dados são mais adequados para armazenamento hierárquico de dados.
Esses bancos de dados são mais adequados para consultas complexas	                      Esses bancos de dados não são tão bons para consultas complexas
Verticalmente Escalável	                                                                Escalonável horizontalmente
Segue a propriedade ACID	                                                              Segue CAP (consistência, disponibilidade, tolerância de partição)
