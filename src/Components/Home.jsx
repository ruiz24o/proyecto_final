import { useEffect, useState } from 'react';
import './Home.css';

const Home = () => {
  const [netflix, setNetflix] = useState([]);
  const [amazon, setAmazon] = useState([]);
  const [amazon10, setAmazon10] = useState([]);
  const [netflix10, setNetflix10] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/top/50/peliculas/netflix')
      .then((res) => res.json())
      .then((data) => setNetflix(data))
      .catch((err) => console.error('Error al obtener usuarios:', err));

    fetch('http://localhost:3000/top/50/peliculas/amazon')
      .then((res) => res.json())
      .then((data) => setAmazon(data))
      .catch((err) => console.error('Error al obtener usuarios:', err));

    fetch('http://localhost:3000/top/10/peliculas/amazon')
      .then((res) => res.json())
      .then((data) => setAmazon10(data))
      .catch((err) => console.error('Error al obtener usuarios:', err));

    fetch('http://localhost:3000/top/10/peliculas/netflix')
      .then((res) => res.json())
      .then((data) => setNetflix10(data))
      .catch((err) => console.error('Error al obtener usuarios:', err));
  }, []);

  return (
    <div className="page-container">
      <div className="themed-section">
        <h2 className="text-primary-dark">Top 50 películas de Netflix</h2>
        <table className="table table-striped table-themed">
          <thead>
            <tr>
              <th>Posición</th>
              <th>Título</th>
              <th>Calificación</th>
              <th>Clasificación</th>
              <th>Géneros</th>
              <th>Año</th>
              <th>Duración</th>
            </tr>
          </thead>
          <tbody>
            {netflix.map((user) => (
              <tr key={user.id}>
                <td>{user.posicion}</td>
                <td>{user.titulo_pelicula}</td>
                <td>{user.calificacion}</td>
                <td>{user.clasificacion}</td>
                <td>{user.genero}</td>
                <td>{user.anno}</td>
                <td>{user.duracion}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="themed-section">
        <h2 className="text-primary-dark">Top 50 películas de Amazon</h2>
        <table className="table table-striped table-themed">
          <thead>
            <tr>
              <th>Posición</th>
              <th>Título</th>
              <th>Calificación</th>
              <th>Clasificación</th>
              <th>Géneros</th>
              <th>Año</th>
              <th>Duración</th>
            </tr>
          </thead>
          <tbody>
            {amazon.map((pelicula) => (
              <tr key={pelicula.id}>
                <td>{pelicula.posicion}</td>
                <td>{pelicula.titulo_pelicula}</td>
                <td>{pelicula.calificacion}</td>
                <td>{pelicula.clasificacion}</td>
                <td>{pelicula.genero}</td>
                <td>{pelicula.anno}</td>
                <td>{pelicula.duracion}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="themed-section">
        <h2 className="text-primary-dark">Mejores películas de Amazon</h2>
        <table className="table table-striped table-themed">
          <thead>
            <tr>
              <th>Título</th>
              <th>Calificación</th>
              <th>Clasificación</th>
              <th>Géneros</th>
              <th>Año</th>
            </tr>
          </thead>
          <tbody>
            {amazon10.map((top) => (
              <tr key={top.id}>
                <td>{top.titulo_pelicula}</td>
                <td>{top.calificacion}</td>
                <td>{top.clasificacion}</td>
                <td>{top.genero}</td>
                <td>{top.anno}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="themed-section">
        <h2 className="text-primary-dark">Mejores películas de Netflix</h2>
        <table className="table table-striped table-themed">
          <thead>
            <tr>
              <th>Título</th>
              <th>Calificación</th>
              <th>Clasificación</th>
              <th>Géneros</th>
              <th>Año</th>
            </tr>
          </thead>
          <tbody>
            {netflix10.map((top) => (
              <tr key={top.id}>
                <td>{top.titulo_pelicula}</td>
                <td>{top.calificacion}</td>
                <td>{top.clasificacion}</td>
                <td>{top.genero}</td>
                <td>{top.anno}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Home;
