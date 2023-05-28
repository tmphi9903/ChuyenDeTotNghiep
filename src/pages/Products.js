

import Shop from "../components/shops/Shop"



import React from 'react'

export default function Products({addToCart, shopItems}) {



  return (
    <>
        
        <Shop shopItems={shopItems} addToCart={addToCart} />
    </>
  )
}
