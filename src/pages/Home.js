import React from "react"
import Home from "../components/MainPage/Home"


import NewArrivals from "../components/newarrivals/NewArrivals"

import Annocument from "../components/annocument/Annocument"
import Wrapper from "../components/wrapper/Wrapper"


const Pages = ({CartItem}) => {
  return (
    <>
      
      <Home CartItem={CartItem} />

      <NewArrivals />

      <Annocument />
      <Wrapper />
    </>
  )
}

export default Pages
