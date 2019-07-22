const HOST = "https://www.e-luckylu.com/";
const TIME_OUT = 10 * 1000;
const CODE_SUCCESS = 200;

class AppConfigs {
  static host() {
    return HOST;
  }

  static timeOut() {
    return TIME_OUT;
  }

  static httpOk() {
    return CODE_SUCCESS;
  }
}
