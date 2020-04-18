class Response<T> {
  Stat status;
  T data;
  String message;

  Response.loading(this.message) : status = Stat.LOADING;
  Response.completed(this.data) : status = Stat.COMPLETED;
  Response.error(this.message) : status = Stat.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Stat { LOADING, COMPLETED, ERROR }