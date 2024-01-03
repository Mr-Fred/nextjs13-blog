import React from 'react'

function handler(req, res) {
  
  res.status(200).json({text: 'hello'});
  
}

export default handler