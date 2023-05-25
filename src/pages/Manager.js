import React, {useRef, useState} from 'react'
import "./Manager.css"








function Manager() {
    
  const list = [
  {
      id: 1,
      name: "JSneaker Nam 42",
      price: "100$",
      cover: "./images/flash/flash-1.png",
    },
    {
      id: 2,
      name: "Defy Skyline Skeleton",
      price: "20$",
      cover: "./images/flash/flash-2.png",
    },
    {
      id: 3,
      name: "Iphone Xs-Max",
      price: "200$",
      cover: "./images/flash/flash-3.png",
    },
    {
      id: 4,
      name: "Smart Watch Black",
      price: "50$",
      cover: "./images/flash/flash-4.png",
    },
    {
      id: 5,
      name: "Defy Skyline Skeleton",
      price: "20$",
      cover: "./images/flash/flash-2.png",
    },
    {
      id: 6,
      name: "Iphone Xs-Max 256 Black",
      price: "200$",
      cover: "./images/flash/flash-3.png",
    },
    {
      id: 7,
      name: "Mapple Earphones",
      price: "180$",
      cover: "./images/shops/shops-1.png",
  
    },
    {
      id: 8,
      name: "Vivo android one",
      price: "120$",
      cover: "./images/shops/shops-2.png",
    },
    {
      id: 9,
      name: "Sony Light",
      price: "20$", 
      cover: "./images/shops/shops-3.png",
    },
    {
      id: 10,
      name: "Iphone",
      price: "999$", 
      cover: "./images/shops/shops-4.png",
    },
    {
      id: 11,
      name: "Ceats wireless earphone",
      price: "80$",
      cover: "./images/shops/shops-5.png",
    },
    {
      id: 12,
      name: "Redimi Phone",
      price: "400$", 
      cover: "./images/shops/shops-7.png",
    },
    {
      id: 13,
      name: "Xeats Bluetooth earphones",
      price: "60$", 
      cover: "./images/shops/shops-8.png",
    },
    {
      id: 14,
      name: "Airpod",
      price: "120$", 
      cover: "./images/shops/shops-9.png",
    },
    {
      id: 15,
      name: "Silver Cap",
      price: "5$",
      cover: "./images/shops/shops-10.png",
    },
  ]




    const[lists, setList] = useState(list)
    const [updateState, setUpdateState] = useState(-1)

    return (
    
        
        
        <div className='dave'>
          <div className='content'>
            <AddList setList = {setList} />
            <form onSubmit={handleSubmit}>
              <table>
                <td className='t'>ID</td>
                <td className='t'>Name</td>
                <td className='t'>Price</td>
                <td className='t'>Description photo</td>
                <td className='t'>Manager</td>
                {
                    lists.map((current) => (
                      updateState === current.id ? <EditList current={current} lists={lists} setList={setList}/>:
                        <tr>
                            <td>{current.id}</td>
                            <td>{current.name}</td>
                            <td>{current.price}</td>
                            <td><img className='img-manager' src={current.cover} alt={current.cover}/></td>
                            <td>
                                <button className='edit' onClick={() => handleEdit(current.id)}><i class="fa-regular fa-pen-to-square"></i></button>
                                <button className='delete' type='button' onClick={() => handleDelete(current.id)}><i class="fa-regular fa-trash-can"></i></button>
                            </td>
                        </tr>
                    ))
                }

            
              </table>
            </form>
          </div>
            
        </div>

    )
  function handleEdit(id) {
    setUpdateState(id)
  }
  function handleDelete(id) {
    const newlist = lists.filter((li) => li.id !== id)
    setList(newlist)
  }
  function handleSubmit(event) {
    event.preventDefault()
    const id = event.target.elements.id.value
    const name = event.target.elements.name.value
    const price = event.target.elements.price.value
    const cover = './images/discount/discount-9.png'
    const newlist = lists.map((li) => (
        li.id === updateState ? {...li,id: id, name:name, price: price, cover: cover} : li
    ))

    setList(newlist)
    setUpdateState(-1)
  }            
  
  

}

function EditList({current, lists, setList}) {
  function handInputid(event) {
    const value = event.target.value;
    const newlist = lists.map((li) => (
        li.id === current.id ? {...li, id :value} : li
    ))

    setList(newlist)
  }
  function handInputname(event) {
      const value = event.target.value;
      const newlist = lists.map((li) => (
          li.id === current.id ? {...li, name :value} : li
      ))

      setList(newlist)
  }
  function handInputprice(event) {
      const value = event.target.value;
      const newlist = lists.map((li) => (
          li.id === current.id ? {...li, price :value} : li
      ))

      setList(newlist)
  }
  function handInputcover(event) {
    const value = event.target.value;
    const newlist = lists.map((li) => (
        li.id === current.id ? {...li, cover :value} : li
    ))

    setList(newlist)
  }


  return(
      <tr>
          <td><input type="number" onChange={handInputid} name='id' value={current.id}/></td>
          <td><input type="text" onChange={handInputname} name='name' value={current.name}/></td>
          <td><input type="text" onChange={handInputprice} name='price' value={current.price}/></td>
          <td><input type="file" onChange={handInputcover} name='cover'/></td>
          
          <td><button type='submit'><i class="fa-solid fa-pen-nib"></i></button></td>
      </tr>
  )
}



function AddList(setList){
  const idRef = useRef()
  const nameRef = useRef()
  const priceRef = useRef()
  const coverRef = useRef()

  function handleSubmit(event) {
    event.preventDefaut();
    const id = event.target.elements.id.value;
    const name = event.target.elements.name.value;
    const price = event.target.elements.price.value;
    const cover = event.target.elements.cover.value;
    const newlist = {
      id,
      name,
      price,
      cover


    }
    setList((prevList)=>{
      return prevList.concat(newlist)
    })
    idRef.current.value = ""
    nameRef.current.value = ""
    priceRef.current.value = ""
    coverRef.current.value = "./images/discount/discount-7.png"
  }

  return (
      <form className='add-form' onSubmit={handleSubmit}>
          <input className='add-i' type="number" name='id' ref={idRef}/>
          <input className='add-n' type="text" name='name' placeholder='JSneaker Nam 42' ref={nameRef} />
          <input className='add-p' type="text" name='price' placeholder='100$' ref={priceRef} />
          <input className='add-d' type="file" name='cover' ref={coverRef} />
          <button className='btn-add' type='submit'><i className='fa fa-plus'></i></button>
      </form>
  )
}



export default Manager;