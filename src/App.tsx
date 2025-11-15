import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div>
          <img src="https://peoplentech.com/assets/frontend/images/logo.png" className="logo" alt="Vite logo" />

      </div>
    
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
      </div>
      <div className="connect-section">
        {/*p tag this is version one */}
        <h3>welcome to peopleNtech v1.0.0</h3>
      </div>
    </>
  )
}

export default App
