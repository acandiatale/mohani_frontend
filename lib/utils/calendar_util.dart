bool isLeapYear(int year) {
  return year % 4 == 0 && year % 100 != 0 || year % 400 == 0 ? true : false;
}

int getMonthRange(DateTime date) {
  int year, month;
  year = date.year;
  month = date.month;
  if (month % 2 == 0) {
    if (month == 2) {
      return isLeapYear(year) ? 28 : 29;
    }
    return 30;
  } else {
    return 31;
  }
}
