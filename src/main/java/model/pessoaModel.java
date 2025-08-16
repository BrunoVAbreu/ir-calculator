package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pessoairpf")
public class pessoaModel {

    @Id
    @Column(name = "cpf")
    private String CPF;

    @Column(name = "nome")
    private String nome;
    
    @Column(name = "idade")
    private int idade;
    
    @Column(name = "renda")
    private double renda;
    
    @Column(name = "dependentes")
    private int dependente;

    @Column(name = "deducao")
    private double Deducao;

    @Column(name = "iranterior")
    private double IRanterior;

    @Column(name = "login")
    private String login;

	private double imposto = 0;
	private String isento = "";
	
    public pessoaModel() {
        super();
    }

	public pessoaModel(double deducao, double renda, int dependente, int idade, double IRanterior, String CPF,
			String nome, String login) {
		super();
		this.IRanterior = IRanterior;
		this.dependente = dependente;
		this.Deducao = deducao;
		this.renda = renda;
		this.idade = idade;
		this.CPF = CPF;
		this.nome = nome;
		this.login = login;
	}

	public double getImposto() {
		return IRanterior;
	}

	public void setImposto(double imposto) {
		this.imposto = imposto;
	}

	public double getDeducao() {
		return Deducao;
	}

	public void setDeducao(double deducao) {
		Deducao = deducao;
	}

	public double getRenda() {
		return renda;
	}

	public void setRenda(double renda) {
		this.renda = renda;
	}

	public int getDependente() {
		return dependente;
	}

	public void setDependente(int dependente) {
		this.dependente = dependente;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double calcImpostoRenda() {
		if (Deducao > 2.275) {
			Deducao = 2.275;
		}

		double rendaTributavel = renda - (Deducao * dependente);

		if (rendaTributavel <= 2.259) {
			imposto = 0;
		} else if (rendaTributavel <= 2.826) {
			imposto = (rendaTributavel * 0.075) - 169.44;
		} else if (rendaTributavel <= 3.751) {
			imposto = (rendaTributavel * 0.15) - 381.44;
		} else if (rendaTributavel <= 4.664) {
			imposto = (rendaTributavel * 0.225) - 662.77;
		} else {
			imposto = (rendaTributavel * 0.275) - 896;
		}

		return imposto;
	}

	public double calcRestituicao() {
		double restituicao = calcImpostoRenda() - IRanterior;

		if (restituicao < 0) {
			restituicao = restituicao * -1;
			return restituicao;
		} else {
			return restituicao = 0;
		}
	}

	public String calcIsencao() {
		double rendaTributavel = renda - (Deducao * dependente);
		boolean isencao = rendaTributavel <= 2.259;

		if (isencao) {
			isento = "Você está isento de pagar o imposto de renda";
		} else {
			isento = "Você não está isento de pagar o imposto de renda";
		}

		return isento;
	}

}
