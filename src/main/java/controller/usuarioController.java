package controller;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import model.UsuarioDAO;

@WebServlet("/usuarioController")
public class usuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuarioDAO uDAO;
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("tarefa-jpa");


	@Override
	public void init() throws ServletException {
		uDAO = new UsuarioDAO(emf);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operacao = request.getParameter("operacao");
		operacao = operacao.toLowerCase();

		switch (operacao) {
		case "sair":
			fazerLogout(request, response);
			break;

		case "cancelar":
			cancelarConta(request, response);
			break;

		default:
			System.out.println("Erro! Operação não encontrada.");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operacao = request.getParameter("operacao");
		operacao = operacao.toLowerCase();

		switch (operacao) {
		case "cadastrar":
			cadastrarUsuario(request, response);
			break;
		case "entrar":
			fazerLogin(request, response);
			break;
		default:
			System.out.println("Erro! Operação não encontrada.");
		}
	}

	private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		String cpf = request.getParameter("cpf");

		boolean inseriu = uDAO.inserirUsuario(login, senha, nome, email, telefone, cpf);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	private void fazerLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");

		Usuario usuario = uDAO.procurarUsuario(login);

		if (usuario != null && usuario.getSenha().equals(senha)) {

			HttpSession session = request.getSession();
			session.setAttribute("usuario", usuario);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/indexPessoa.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("erro", true);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void fazerLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	private void cancelarConta(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("login");

		boolean sucesso = uDAO.cancelarConta(login);

		request.setAttribute("status", sucesso);

		if (sucesso) {
			request.setAttribute("msgConta", "Conta cancelada com sucesso.");
		} else {
			request.setAttribute("msgConta", "Erro ao cancelar a conta.");
		}

		request.getRequestDispatcher("/statusCancelamento.jsp").forward(request, response);
	}

}
