package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class PessoaDAO {
    private EntityManagerFactory emf;

    public PessoaDAO(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public boolean inserirPessoa(String cpf, String nome, int idade, double renda, int dependentes, double deducao,
                                 double IRanterior, String login) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            pessoaModel pessoa = new pessoaModel(deducao, renda, dependentes, idade, IRanterior, cpf, nome, login);
            em.persist(pessoa);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }
    
    public ArrayList<pessoaModel> consultarPessoas(String login) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            List<pessoaModel> pessoas = em.createNativeQuery("SELECT * FROM pessoairpf WHERE login = :login", pessoaModel.class).setParameter("login", login).getResultList();

            em.getTransaction().commit();

            return new ArrayList<>(pessoas);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            em.close();
        }
    }

    public boolean excluirPessoa(String cpf) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            pessoaModel pessoa = em.find(pessoaModel.class, cpf);
            if (pessoa != null) {
                em.remove(pessoa);
                em.getTransaction().commit();
                return true;
            } else {
                return false; 
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

    public pessoaModel procurarPessoa(String cpf) {
        EntityManager em = emf.createEntityManager();
        pessoaModel pessoa = null;

        try {
            pessoa = em.find(pessoaModel.class, cpf);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }

        return pessoa;
    }

    public boolean modificarPessoa(String cpf, String nome, int idade, double renda, int dependentes,
                                    double deducao, double IRanterior) {
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            pessoaModel pessoa = em.find(pessoaModel.class, cpf);
            if (pessoa != null) { 
                pessoa.setNome(nome);
                pessoa.setIdade(idade);
                pessoa.setRenda(renda);
                pessoa.setDependente(dependentes);
                pessoa.setDeducao(deducao);
                em.getTransaction().commit();
                return true; 
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }
}