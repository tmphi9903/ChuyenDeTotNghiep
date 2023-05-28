import React, {useState} from "react"
import { Link } from "react-router-dom"
import "./Search.css"
import { Icon } from "@mui/material"










  const Search = ({ CartItem }) => {
  // fixed Header
  window.addEventListener("scroll", function () {
    const search = document.querySelector(".search")
    search.classList.toggle("active", window.scrollY > 100)
  })














  return (
    <>
      <section className='search'>


        <div className='container c_flex'>



          <div className='name-shop width '>
            <p>Meanfi shop</p>
          </div>




          <div className='logo f_flex'>
            <img src="./images/logo/logo.png"/>
          </div>








          <div className='icon f_flex width'>
            <i className='fa fa-user icon-circle'></i>
            <div className='cart'>
              <Link to='/cart'>
                <i className='fa fa-shopping-bag icon-circle'></i>
                <span>{CartItem.length === 0 ? "" : CartItem.length}</span>
              </Link>
            </div>
          </div>




        </div>




      </section>
    </>
  )
}

export default Search
