function validateForm() {
  // return false;
  if (document.errors.any?) {
    alert();
    return false; //suppresses form submission
  } else {
    return true; //form will submit
  }
}