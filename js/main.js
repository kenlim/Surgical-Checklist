(function() {
  var log,
    __slice = Array.prototype.slice;

  log = function() {
    var args;
    args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    if (console.log != null) return console.log.apply(console, args);
  };

  $(function() {
    return log("hello world!");
  });

}).call(this);
