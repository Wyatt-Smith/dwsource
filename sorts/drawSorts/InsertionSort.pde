int arr[];
int ARRSIZE = 10;

void setup() {
  size(400, 400);
  background(0);
  arr = randomArray(ARRSIZE);
}//setup

void draw() {
  background(0);
  displayArray(arr);
}

void bubleSort(int[] arr) {
  for (int endPos = arr.length-1; endPos >= 0; endPos--) {
    for (int pos=0; pos < endPos; pos++) {
      if (arr[pos] > arr[endPos]) {
        swap(arr, pos, endPos);
      }
    }
  }
}//bubleSort

void selectionSort(int[] arr) {
  int smallPos;
  for (int pos = 0; pos < arr.length; pos ++) {
    smallPos = pos;
    for (int testPos = pos + 1; testPos < arr.length; testPos ++) {
      if (arr[testPos] < arr[smallPos]) {
        smallPos = testPos;
      }
    }
    swap(arr,smallPos, pos);
  }
}//selectionSort

void insertionSort(int[] arr) {
  int insertVal;
  for (int endSort = 0; endSort < arr.length; endSort ++) {
    insertVal = arr[endSort];
    for (int testPos = endSort+1; testPos >= 0; testPos --) {
      if (insertVal < arr[testPos]) {
        swap(arr,endSort,testPos);
      }
    }
  }
}//insertionSort


void swap(int[] arr, int i0, int i1) {
  int t = arr[i0];
  arr[i0] = arr[i1];
  arr[i1] = t;
}//swap

int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(100, 400));
  }//random value loop
  return values;
}//randomArray

void displayArray(int[] arr) {
  int barWidth = width / arr.length;
  int x = 0;
  int y = 0;
  fill(255);
  noStroke();
  for (int i=0; i<arr.length; i++) {
    y = height - arr[i];
    rect(x, y, barWidth, arr[i]);
    x+= barWidth;
  }
}//displayArray

void keyPressed() {
  if (key == 'n') {
    arr = randomArray(ARRSIZE);
  }
  else if (key == 'b') {
    bubleSort(arr);
  }
  else if (key == 's') {
    selectionSort(arr);
  }
  else if (key == 'i') {
    insertionSort(arr);
  }
}
