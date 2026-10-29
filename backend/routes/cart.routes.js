const express = require('express');
const router = express.Router();

// Cart operations - Note: Cart is session-based in frontend (localStorage)
// This route is for future server-side cart persistence if needed

router.post('/add', (req, res) => {
  // Cart will be handled in frontend using localStorage
  res.json({
    success: true,
    message: 'Cart handled in frontend (localStorage)'
  });
});

router.put('/update', (req, res) => {
  res.json({
    success: true,
    message: 'Cart handled in frontend (localStorage)'
  });
});

router.delete('/remove', (req, res) => {
  res.json({
    success: true,
    message: 'Cart handled in frontend (localStorage)'
  });
});

router.delete('/clear', (req, res) => {
  res.json({
    success: true,
    message: 'Cart handled in frontend (localStorage)'
  });
});

module.exports = router;
