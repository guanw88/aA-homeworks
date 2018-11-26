document.addEventListener("DOMContentLoaded", function(){

  // Set up canvas dimensions as 500px by 500px
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.heigth = 500;
  ctx = canvas.getContext('2d');

  // Draw blue rectangle
  ctx.fillStyle = 'blue';
  ctx.fillRect(10, 10, 200, 100); // left pos, right pos, width, height

  // Overlay red circle
  ctx.beginPath();
  ctx.arc(60, 60, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 1;
  ctx.stroke();
  ctx.fillStyle = 'red';
  ctx.fill();

});
