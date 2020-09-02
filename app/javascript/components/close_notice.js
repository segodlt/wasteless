const closeNotice = () => {
  window.setTimeout(closeDiv, 3600);
};

function closeDiv() {
  const notice = document.querySelector(".flash");
  if (notice) {
    notice.style.display = "none";
  }
}

export { closeNotice };