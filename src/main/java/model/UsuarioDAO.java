package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

public class UsuarioDAO {
	private EntityManagerFactory emf;
	
	public UsuarioDAO(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}

	public boolean inserirUsuario(String login, String senha, String nome, String email, String telefone, String cpf) {
		EntityManager em = emf.createEntityManager();

		try {
			Usuario usuario = new Usuario(login, senha, nome, email, telefone, cpf);
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			em.close();
		}
	}

    public Usuario procurarUsuario(String login) {
        EntityManager em = emf.createEntityManager();
        Usuario usuario = null;
        
        try {
            usuario = em.find(Usuario.class, login);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            em.close();
        }
        return usuario;
    }

    public boolean cancelarConta(String login) {
        EntityManager em = emf.createEntityManager();
        Usuario usuario = null;
        
        try {
            em.getTransaction().begin();

             usuario = em.find(Usuario.class, login);

           
                em.createNativeQuery("DELETE FROM pessoairpf WHERE login = :login").setParameter("login", login).executeUpdate();

                em.remove(usuario);

                em.getTransaction().commit();
                return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }
  }

