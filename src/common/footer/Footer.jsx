import React from "react"
import "./Footer.css"

const Footer = () => {
  return (
    <>
      <footer>
        <div className='container grid2'>
          <div className='box'>
            <h1>MEANFI SHOP</h1>
        
            <div>
              <div>
                <i className='fa-brands fa-google-play'></i>
                <span> Google Play</span>
              </div>
              <hr/>
              <div>
                <i className='fa-brands fa-app-store-ios'></i>
                <span> App Store</span>
              </div>
            </div>
          </div>

          <div className='box'>
            <h2>About Us</h2>
            <ul>
              <li>Careers</li>
              <li>Our Stores</li>
              <li>Our Cares</li>
              <li>Terms & Conditions</li>
              <li>Privacy Policy</li>
            </ul>
          </div>
          <div className='box'>
            <h2>Customer Care</h2>
            <ul>
              <li>Help Center </li>
              <li>How to Buy </li>
              <li>Track Your Order </li>
              <li>Corporate & Bulk Purchasing </li>
              <li>Returns & Refunds </li>
            </ul>
          </div>
          <div className='box'>
            <h2>Contact Us</h2>
            <ul>
              <li>02 NGUYEN DINH CHIEU - TP.NHA TRANG - KHANH HOA </li>
              <li>Email: phi.tm.61cntt@ntu.edu.vn</li>
              <li>Phone: 086 907 9903</li>
            </ul>
          </div>
        </div>
      </footer>
    </>
  )
}

export default Footer
