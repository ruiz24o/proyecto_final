import { useState } from "react";
import { useNavigate } from "react-router-dom";

const API_URL = "http://localhost:3000/api/agregar/usuarios";

const CreateAccount = ({ setAuth }) => {
  const [nombre, setNombre] = useState("");
  const [contrasena, setContrasena] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleCreateAccount = async (e) => {
  e.preventDefault();
  const newPost = { nombre: nombre, contrasena: contrasena };

  try {
    // Intentar obtener usuarios existentes (si la API lo permite)
    const response = await fetch('http://localhost:3000/api/usuarios');
    if (!response.ok) throw new Error("Error en la respuesta del servidor");

    const data = await response.json();
    if (!Array.isArray(data)) throw new Error("La respuesta de la API no es válida");

    const existeUsuario = data.some(user => user.nombre === nombre || user.contrasena === contrasena);

    if (existeUsuario) {
      console.log("El usuario o la contraseña ya están en uso...");
      alert("El usuario o la contraseña ya están en uso");
    } else {
      // Intentar registrar usuario
      const postResponse = await fetch(API_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(newPost)
      });

      if (!postResponse.ok) throw new Error("Error al enviar datos");

      let result;
      try {
        result = await postResponse.json();
      } catch {
        throw new Error("Error al procesar la respuesta de la API");
      }

      console.log("Cuenta creada:", result);
      alert("Cuenta creada exitosamente");
      setAuth(true);
      navigate("/home");
    }
  } catch (error) {
    console.error("Error al consumir la API:", error);
    setError(error.message);
  }
};

    return (
    <div className="container mt-5">
        <h2>Crear Cuenta</h2>
        <form onSubmit={handleCreateAccount}>
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
        <div className="d-flex gap-2">
            <button type="submit" className="btn btn-primary">Crear Cuenta</button>
            <button
            type="button"
            className="btn btn-secondary"
            onClick={() => navigate("/login")}
            >
            Volver al Login
            </button>
        </div>
        </form>
        {error && <p className="text-danger mt-3">{error}</p>}
    </div>
    );

 
};

export default CreateAccount;