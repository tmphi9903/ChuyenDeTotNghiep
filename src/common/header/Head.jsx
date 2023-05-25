import React from "react"
import "./Head.css";
const Head = () => {
  return (
    <>
      <section className='head'>
        <div className='container d_flex'>
          <div className='left row'>
            <i className='fa fa-phone'></i>
            <label> 086 907 9903</label>
            <i className='fa fa-envelope'></i>
            <label> phi.tm.61cntt@ntu.edu.vn</label>
          </div>
          <div className='right row RText'>
            <label>Website for managing products in many fields</label>
          </div>
        </div>
      </section>
    </>
  )
}

export default Head
