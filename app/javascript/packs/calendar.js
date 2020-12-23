document.addEventListener("turbolinks:load", () => {
  flatpickr.localize(flatpickr.l10ns.ja)

  const selectedDate = gon.valid_dates
  const config = {
    inline: true,
    mode: "multiple",
    minDate: "today",
    maxDate: new Date().fp_incr(30),
    dateFormat: "Y-m-d",
    disableMobile: true,
    // disable: [
    //   function (date) {
    //     return (date.getDay() === 0);
    //   }
    // ],
    defaultDate: selectedDate,
  }
  flatpickr('#edit_calendar', config);

});