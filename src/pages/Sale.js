import React from 'react'
import Discount from "../components/discount/Discount"
import FlashDeals from "../components/flashDeals/FlashDeals"


export default function Sale({productItems, addToCart}) {
  return (
    <>
        <Discount />
        <FlashDeals productItems={productItems} addToCart={addToCart} />
    </>
  )
}
