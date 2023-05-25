import TopCate from "../components/top/TopCate"

import Shop from "../components/shops/Shop"



import React from 'react'

export default function Products({addToCart, shopItems}) {



  return (
    <>
        <TopCate />      
        <Shop shopItems={shopItems} addToCart={addToCart} />
    </>
  )
}
