import React from "react"
import Dcard from "./Dcard"
import "./Discount.css"

const Discount = () => {
  return (
    <>
      <section className='Discount background NewArrivals'>
        <div className='container'>
          <div className='heading d_flex'>
            <div className='heading-left row  f_flex'>
              
              <h2>Big Discounts</h2>
              
            </div>
          </div>
          <Dcard />
        </div>
      </section>
    </>
  )
}

export default Discount
