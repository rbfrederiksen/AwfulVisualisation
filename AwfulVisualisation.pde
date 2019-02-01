
//Befolkningens gennemsnitsalder
float[] data = {39.7, 39.8, 39.9, 40.0, 40.1, 40.2, 40.4, 40.6, 40.7, 40.9, 41.1, 41.2, 41.4, 41.5};

//Langtidsledige siden 2007
//float[] data = {4.7, 4.6, 4.3, 3.9, 3.8, 3.5, 3.1, 3.2, 3.1, 3.1, 3.0, 3.1, 3.2, 3.1, 2.9, 2.5, 2.5, 
//  2.3, 2.1, 2.3, 2.4, 2.5, 2.8, 3.2, 3.8, 4.2, 4.6, 4.6, 4.7, 4.8, 4.3, 4.8, 5.0, 5.3, 5.6, 5.9, 6.7, 6.9, 6.8, 6.0, 
//  6.1, 5.9, 5.1, 5.6, 5.8, 5.8, 6.0, 6.3, 6.8, 6.7, 6.5, 5.9, 6.0, 5.8, 5.0, 5.5, 5.6, 5.7, 5.9, 6.0, 6.5, 6.7, 6.5, 
//  6.0, 6.1, 6.0, 5.3, 5.7, 5.8, 5.8, 6.0, 6.3, 6.6, 6.5, 6.3, 5.8, 5.8, 5.6, 5.1, 5.3, 5.4, 5.4, 5.6, 5.7, 5.8, 5.8, 
//  5.5, 4.9, 4.9, 4.8, 4.5, 4.7, 4.7, 4.7, 4.8, 5.0, 5.3, 5.3, 5.0, 4.6, 4.6, 4.5, 4.1, 4.3, 4.2, 4.2, 4.3, 4.4, 4.7, 
//  4.6, 4.4, 4.0, 4.0, 3.9, 3.8, 3.9, 3.9, 4.0, 4.1, 4.3, 4.6, 4.7, 4.5, 4.1, 4.1, 4.1, 4.0, 4.1, 4.1, 4.1, 4.2, 4.2, 
//  4.5, 4.4, 4.3, 3.9, 3.9, 3.8 };


//Langtidsledige sidste 51 måneder
//float[] data = {4.9, 4.9, 4.8, 4.5, 4.7, 4.7, 4.7, 4.8, 5.0, 5.3, 5.3, 5.0, 4.6, 4.6, 4.5, 4.1, 4.3, 4.2, 4.2, 4.3, 4.4, 4.7, 
//  4.6, 4.4, 4.0, 4.0, 3.9, 3.8, 3.9, 3.9, 4.0, 4.1, 4.3, 4.6, 4.7, 4.5, 4.1, 4.1, 4.1, 4.0, 4.1, 4.1, 4.1, 4.2, 4.2, 
//  4.5, 4.4, 4.3, 3.9, 3.9, 3.8 };

int width = 1200;
int height = 700;
float barWidth = width / data.length;
float barHeight = height;

int blueHue = 208;
int blueSaturation = 69;
int redHue = 5;
int redSaturation = 82;
int minBrightness = 30;

void setup() {

  size(1200, 700);
  colorMode(HSB, 360, 100, 100);
  println("Lowest value:" + lowestValue(data));
  println("Highest value:" + highestValue(data));
  println("Median value:" + medianValue(data));
  println("Number of data points: "+ data.length);

  noStroke();
  for (int i = 0; i < data.length; i++) {
    fill(barColor(data[i]));
    rect(i*barWidth, 0, barWidth, height);
  }
}


color barColor(float dataPoint) {
  //if the value is higher than the median value
  float hue;
  float saturation;
  float brightness;
  float high = highestValue(data);
  float low = lowestValue(data);
  float median = medianValue(data);

  if (dataPoint > medianValue(data)) {
    hue = redHue;
    saturation = (map(dataPoint, medianValue(data), highestValue(data), 0, redSaturation) * 2);
    brightness = map(dataPoint, medianValue(data), highestValue(data), 100, minBrightness);
  } else {
    hue = blueHue;
    saturation = (map(dataPoint, medianValue(data), lowestValue(data), 0, blueSaturation) * 2);
    brightness = map(dataPoint, medianValue(data), lowestValue(data), 100, minBrightness);
  }
  if (saturation > 100) {
    saturation = 100;
  }
  return color(hue, saturation, brightness);
}



float highestValue(float[] array) {
  float max = array[0];
  for (int i = 1; i < array.length; i++) {
    if (array[i] > max) {
      max = array[i];
    }
  }
  return max;
}

float lowestValue(float[] array) {
  float min = array[0];
  for (int i = 1; i < array.length; i++) {
    if (array[i] < min) {
      min = array[i];
    }
  }
  return min;
}

float medianValue(float[] array) {
  float[] sortedArray = sort(array);
  if (sortedArray.length%2 == 0) {
    return (sortedArray[sortedArray.length/2] + sortedArray[(sortedArray.length/2)+1])/2.0;
  } else {
    return sortedArray[sortedArray.length/2];
  }
}
