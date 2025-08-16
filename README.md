# Sistema de Cálculo Tributário - IR Manager

Sistema para administradores fiscais calcularem impostos de renda de clientes, com suporte a:
- 🧮 Cálculos de isenção
- 💰 Deduções legais
- 📊 Simulação de valores devidos

## 👨‍💻 Fluxo Principal

1. **Administrador** faz login
2. Cadastra **Contribuintes** (clientes)
3. Insere dados fiscais de cada um
4. O sistema calcula automaticamente:
   - Elegibilidade para isenção
   - Valor das deduções aplicáveis
   - Imposto devido final
5. Gera relatórios para cada caso

## 🧮 Funcionalidades de Cálculo

| Tipo de Cálculo | Descrição | Exemplo de Variáveis Consideradas |
|-----------------|-----------|-----------------------------------|
| **Isenção** | Verifica elegibilidade | Tipo de renda, idade, deficiência |
| **Deduções**| Calcula abatimentos | Dependentes, gastos médicos, educação |
| **Imposto Devido** | Valor final a pagar | Alíquotas progressivas, base de cálculo |

## 🛠️ Tecnologias Utilizadas

- **Backend**: Java
- **Armazenamento**: MySQLite
- **Frontend**: 
  -  HTML5
  -  CSS
  -  JavaScript
