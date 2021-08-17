import CreateMem from "./components/CreateMem";
import Last10Mems from "./components/Last10Mems";
import './App.css';


function App() {
  return (
    <div>
      <div className="container">
        <div className="header">
          Memy w Chmurze
        </div>
        <div>
          <div>
            <CreateMem/>
            <Last10Mems/>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;
