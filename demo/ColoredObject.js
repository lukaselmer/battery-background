function ColoredObject(object) {

    this.object = object;
    this.date = Date.now();

    this.original_background = new RGBColor($(object).css("background-color"));

    this.background = function () {
        return new RGBColor($(object).css("background-color"));
    }

    this.original_foreground = new RGBColor($(object).css("color"));

    this.foreground = function () {
        return new RGBColor($(object).css("color"));
    }

}
