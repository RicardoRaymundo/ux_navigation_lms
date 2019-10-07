class Util {
  static String calculateTime(String hourA, String hourB) {
    if (hourA.length != 5 || hourB.length != 5) return "00:00";

    if (hourA.length == 5) {
      hourA = '00:' + hourA;
    }
    if (hourB.length == 5) {
      hourB = '00:' + hourB;
    }
    if (hourA.length == 8) {
      hourA = '00:' + hourA;
    }
    if (hourB.length == 8) {
      hourB = '00:' + hourB;
    }

    int temp = 0;
    int newDay = 0;
    int newHour = 0;
    int newMinute = 0;
    int newSecond = 0;

    List<String> listHourA = hourA.split(':');
    List<String> listHourB = hourB.split(':');

    int day1 = int.parse(listHourA[0]);
    int hour1 = int.parse(listHourA[1]);
    int min1 = int.parse(listHourA[2]);
    int sec1 = int.parse(listHourA[3]);

    int day2 = int.parse(listHourB[0]);
    int hour2 = int.parse(listHourB[1]);
    int min2 = int.parse(listHourB[2]);
    int sec2 = int.parse(listHourB[3]);

    /// Calcula os segundos
    temp = sec1 + sec2 + newSecond;
    while (temp > 59) {
      newMinute++;
      temp = temp - 60;
    }
    int second = temp;

    /// Calcula os minutos
    temp = min1 + min2 + newMinute;
    while (temp > 59) {
      newHour++;
      temp = temp - 60;
    }
    int minute = temp;

    /// Calcula as horas
    temp = hour1 + hour2 + newHour;
    newDay = day1 + day2;
    while (temp > 23) {
      newDay++;
      temp = temp - 24;
    }
    int hour = temp;
    int day = newDay;

    List<String> result = [];
    if (day > 0) {
      if (day.toString().length == 2) {
        result.add(day.toString());
      } else {
        result.add('0' + day.toString());
      }
    }

    if (hour > 0) {
      if (hour.toString().length == 2) {
        result.add(hour.toString());
      } else {
        result.add('0' + hour.toString());
      }
    }

    if (minute.toString().length == 2) {
      result.add(minute.toString());
    } else {
      result.add('0' + minute.toString());
    }

    if (second.toString().length == 2) {
      result.add(second.toString());
    } else {
      result.add('0' + second.toString());
    }

    return result.join(':');
  }
}
