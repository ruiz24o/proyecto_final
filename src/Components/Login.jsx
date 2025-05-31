import { useState } from "react";
import { useNavigate } from "react-router-dom";
import './Login.css';

const Login = ({ setAuth }) => {
  const [nombre, setNombre] = useState("");
  const [contrasena, setContrasena] = useState("");
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();
    setError(null);

    try {
      const response = await fetch("http://localhost:3000/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nombre, contrasena }),
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        const message =
          errorData.message ||
          (response.status === 401
            ? "Credenciales incorrectas"
            : "Error desconocido del servidor");
        setError(message);
        return;
      }

      const result = await response.json();

      if (result.auth) {
        setAuth?.(true);
        navigate("/home");
      } else {
        setError(result.message || "Credenciales incorrectas");
      }
    } catch (err) {
      console.error("Error en login:", err);
      setError("Error al intentar iniciar sesión.");
    }
  };

  return (
    <div className="login-background">
      <div className="login-card">
        <h2>Iniciar Sesión</h2>
        <form onSubmit={handleLogin}>
          <div className="mb-3">
            <label>Email:</label>
            <input
              type="email"
              className="form-control"
              value={nombre}
              onChange={(e) => setNombre(e.target.value)}
              required
            />
          </div>
          <div className="mb-3">
            <label>Contraseña:</label>
            <input
              type="password"
              className="form-control"
              value={contrasena}
              onChange={(e) => setContrasena(e.target.value)}
              required
            />
          </div>
          {error && <div className="alert alert-danger">{error}</div>}
          <div className="d-grid gap-2 mt-3">
            <button type="submit" className="btn btn-primary">Acceder</button>
            <button
              type="button"
              className="btn btn-secondary"
              onClick={() => navigate("/create-account")}
            >
              Crear Cuenta
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
