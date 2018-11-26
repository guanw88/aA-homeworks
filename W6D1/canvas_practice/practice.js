document.addEventListener("DOMContentLoaded", function(){

  // Set up canvas dimensions as 500px by 500px
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.heigth = 500;
  ctx = canvas.getContext('2d');

  // Create blue rectangle
  ctx.fillStyle = 'blue';
  ctx.fillRect(10, 10, 100, 100);
});
