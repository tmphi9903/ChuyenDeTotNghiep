import React from "react"
import Cart from "./Cart"
import "./NewArrivals.css"

const NewArrivals = () => {
  return (
    <>
      <section className='NewArrivals background'>
        <div className='container'>
          <div className='heading d_flex'>
            <div className='heading-left row  f_flex'>

              <h2>New Arrivals</h2>

            </div>
          </div>
          <Cart />
        </div>
      </section>
    </>
  )
}

export default NewArrivals
