const {
  Japanese
} = require("flatpickr/dist/l10n/ja");

document.addEventListener("turbolinks:load", () => {
  const selectedDate = gon.valid_dates
  const config = {
    locale: Japanese,
    inline: true,
    mode: "multiple",
    minDate: "today",
    maxDate: new Date().fp_incr(30),
    dateFormat: "Y-m-d",
    disable: [
      function (date) {
        return (date.getDay() === 0);
      }
    ],
    defaultDate: selectedDate,
  }
  flatpickr('.edit_calendar', config);

});