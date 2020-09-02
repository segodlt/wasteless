const closeNotice = () => {
  window.setTimeout(closeDiv, 4500);
};

function closeDiv() {
  const notice = document.querySelector(".flash");
  if (notice) {
    notice.style.display = "none";
  }
}

export { closeNotice };