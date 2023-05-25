
import { Link } from "react-router-dom"
import "./Navbar.css"

const Navbar = () => {
  // Toogle Menu
  
  return (
    <>
      <header className='header'>
        <div className='container'>
        

          <div className='navlink'>
              <Link className="h" to ="/home">Home</Link>
              <Link className="s" to ="/discount">Discount</Link>
              <Link className="m" to ="/manager">Manager</Link>
              <Link className="p" to ="/products">Products</Link>
          </div>

        </div>
      </header>
    </>
  )
}

export default Navbar
