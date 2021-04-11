const getDate = (timezone) => {
  const now = new Date();
  const offset = now.getTimezoneOffset() * 60;
  const localDate = new Date(now.setUTCSeconds(offset + timezone));
  const options = {
    weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric'
  };
  const formattedDate = localDate.toLocaleDateString("en-GB", options);
  return formattedDate;
};
export { getDate };
