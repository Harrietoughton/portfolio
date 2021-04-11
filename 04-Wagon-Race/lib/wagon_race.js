// TODO: write your code here
const playerOne = document.getElementById("player1-race");
const playerOneCells = playerOne.querySelectorAll("td");
// console.log(playerOneCells[1]);

const playerTwo = document.getElementById("player2-race");
const playerTwoCells = playerTwo.querySelectorAll("td");

let p1Index = 0;
let p2Index = 0;

const redWins = () => {
  const body = document.querySelector("body");
  body.insertAdjacentHTML("beforeend", "<h3>Red wins!</h3>");
};

const yellowWins = () => {
  const body = document.querySelector("body");
  body.insertAdjacentHTML("beforeend", "<h3>Yellow wins!</h3>");
};

document.addEventListener("keyup", (event) => {
  if (event.keyCode === 81) {
    playerOneCells[p1Index].classList.remove("active");
    playerOneCells[p1Index += 1].classList.add("active");
  } else if (event.keyCode === 87) {
    playerTwoCells[p2Index].classList.remove("active");
    playerTwoCells[p2Index += 1].classList.add("active");
  } else if (event.keyCode === 32) {
    playerOneCells[p1Index].classList.remove("active");
    playerTwoCells[p2Index].classList.remove("active");
    playerOneCells[0].classList.add("active");
    playerTwoCells[0].classList.add("active");
  } else {
    console.log("key not recognised");
  }
  if (p1Index === 14) {
    redWins();
  } else if (p2Index === 14) {
    yellowWins();
  }
});

// const redWinning = () => {
//   const body = document.querySelector("body");
//   body.insertAdjacentHTML("beforeend", "<h3>Red is in the lead!</h3>");
// }

// const yellowWinning = () => {
//   const body = document.querySelector("body");
//   body.insertAdjacentHTML("beforeend", "<h3>Yellow is in the lead!</h3>");
// }

// const draw = () => {
//   const body = document.querySelector("body");
// //   body.insertAdjacentHTML("beforeend", "<h3>it's a draw...</h3>");
// }
