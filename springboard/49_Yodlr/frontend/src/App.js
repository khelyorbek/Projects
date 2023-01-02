import './App.css';
import Admin from './routes/Admin';
import Register from './routes/Register';
import Home from './routes/Home';
import Navigation from './routes/Navigation';
import Error from './routes/Error';
import { BrowserRouter, Routes, Route } from "react-router-dom";

function App() {
  return (
    <>
      <BrowserRouter>

      <Navigation></Navigation>

        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="register" element={<Register />} />
          <Route path="admin" element={<Admin />} />
          <Route path="*" element={<Error />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
