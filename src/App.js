import React, { useState } from "react"
import "./App.css"
import { BrowserRouter as Router, Route } from "react-router-dom"
import Header from "./common/header/Header"
import Home from "./pages/Home"
import Products from "./pages/Products"
import Data from "./components/Data"
import Cart from "./common/Cart/Cart"
import Footer from "./common/footer/Footer"
import Sdata from "./components/shops/Sdata"
import Manager from "./pages/Manager"
import Sale from "./pages/Sale"
import Login from "./pages/Login"






function App() {



  const { productItems } = Data
  const { shopItems } = Sdata


  const [CartItem, setCartItem] = useState([])

  
  const addToCart = (product) => {
   
    const productExit = CartItem.find((item) => item.id === product.id)
    
    if (productExit) {
      setCartItem(CartItem.map((item) => (item.id === product.id ? { ...productExit, qty: productExit.qty + 1 } : item)))
    } else {
      
      setCartItem([...CartItem, { ...product, qty: 1 }])
    }
  }

  
  const decreaseQty = (product) => {
    
    const productExit = CartItem.find((item) => item.id === product.id)

 
    if (productExit.qty === 1) {
      setCartItem(CartItem.filter((item) => item.id !== product.id))
    } else {
   
      setCartItem(CartItem.map((item) => (item.id === product.id ? { ...productExit, qty: productExit.qty - 1 } : item)))
    }
  }

  return (
    <>
      
      <Router>
        
        
          <Route path='/'  exact>
            <Login />
          </Route>
          <Route path='/home'  exact>
            <Header CartItem={CartItem} />
            <Home />
            <Footer />
          </Route>
          <Route path='/products' exact>
            <Header CartItem={CartItem} />  
            <Products productItems={productItems} addToCart={addToCart} shopItems={shopItems} />
            <Footer />
          </Route>
          <Route path='/manager' exact>
            <Header CartItem={CartItem} />
            <Manager productItems={productItems} addToCart={addToCart} shopItems={shopItems} />
            <Footer />
          </Route>
          <Route path='/discount' exact>
            <Header CartItem={CartItem} />
            <Sale productItems={productItems} addToCart={addToCart} />
            <Footer />
          </Route>
          <Route path='/cart' exact>
            <Header CartItem={CartItem} />
            <Cart CartItem={CartItem} addToCart={addToCart} decreaseQty={decreaseQty} />
            <Footer />
          </Route>
       

      </Router>
    </>
  )
}

export default App
