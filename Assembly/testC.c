#include <stdio.h>
#include <stdbool.h>
// SOLUTION FILE

main()
{
  int var_int;                    // 2
  char var_char;
  unsigned char var_uchar;
  short int var_sint;
  unsigned short int var_usint;
  unsigned int var_uint;
  long int var_lint;
  unsigned long int var_ulint;
  float var_f;
  double var_doub;


  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Taehyon! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type char = %d ", sizeof(var_char));
  printf("\n size of data type unsigned char = %d ", sizeof(var_uchar));
  printf("\n size of data type short int = %d ", sizeof(var_sint));
  printf("\n size of data type unsigned short int = %d ", sizeof(var_usint));
  printf("\n size of data type int = %d ", sizeof(var_int));
  printf("\n size of data type unsigned int = %d ", sizeof(var_uint));
  printf("\n size of data type long int = %d ", sizeof(var_lint));
  printf("\n size of data type unsigned long int = %d ", sizeof(var_ulint));
  printf("\n size of data type float = %d ", sizeof(var_f));
  printf("\n size of data type double = %d ", sizeof(var_doub));


  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);
  printf("\n uchar ranges from 0 to 255, while schar ranges from -128 to 127. Therefore 255 does not exist in schar");

  if (uchar1 > uchar2)
	  printf("\n uchar1 is larger with the value of: %d ", uchar1);
  else
	  printf("\n uchar2 is larger with the value of: %d ", uchar2);

  if (schar1 > schar2)
	  printf("\n schar1 is larger with the value of: %d ", schar1);
  else
	  printf("\n schar2 is larger with the value of: %d ", schar2);


  if (schar1 > uchar1)
	  printf("\n comparing uchar1 and schar1, schar1 is larger with the value of: %d ", schar1);
  else
	  printf("\n comparing uchar1 and schar1, uchar1 is larger with the value of: %d ", uchar1);

  printf("\n adding schar1 and schar2: %d ", schar1 + schar2);
  printf("\n adding uchar1 and uchar2: %d ", uchar1 + uchar2);
  printf("\n adding schar1 and uchar1: %d ", schar1 + uchar1);


  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;
  (y > x) ? printf("\n True") : printf("\n False");
  (x > y) ? printf("\n True") : printf("\n False");


  printf("\n size of boolean expression is %d", sizeof(bool));

  printf("\n x & y = %d", x & y);
  printf("\n x && y = %d", x && y);

  printf("\n ~x = %d", ~x);
  printf("\n !x = %d", !x);


  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;
  char i2 = 2;
  char i3 = 5;
  char i4 = 8;

  printf("\n shift_char << %d = %d", i, shift_char << i);
  printf("\n shift_char >> %d = %d", i2, shift_char >> i2);

  printf("\n shift_char << %d = %d", i3, shift_char << i3);
  printf("\n basically shifting left is multiplying 2 with the number of shift times. 15 * 2^5 = 480");
  printf("\n shift_char << %d = %d", i4, shift_char << i4);
  printf("\n 15 * 2^8 = 3840");



  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = &a[0];
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[0], *(ip-1), *(ip), *ip++, *(ip+1), *(ip+4), *(ip-1));

  ip2 = &a[0];
  printf("\nstart %d %d %d %d %d %d %d \n",
	  a[1], *(ip2 + 1), *(ip2 + 2), *(ip2 + 1), *(ip2 + 2), *(ip2 + 5), a[1]);

  printf("\n size of integer pointer data type is %d", sizeof(ip));
  printf("\n size of pointer is %x", sizeof(ip));
  printf("\n size of pointer +1 is %x", sizeof(ip + 1));
  printf("\n size of pointer indicates address where pointer is, address doesnt change by increase in pointer");

  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");

  printf("\n 1st frag: \n");
  for (i = 0; i < 10; i++) {
	  b[i] = a[9 - i];
	  printf(" %d", b[i]);
  }

  printf("\n 2nd frag: \n");
  ip = b;
  ip2 = c;
  for (i = 0; i < 10; i++) {
	  *(ip2 + i) = *(ip + i);
	  printf(" %d", c[i]);
  }

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);
  for (i = 0; i < 3; i++) {
	  printf("\n ASCII value of %c = %d", AString[i], AString[i]);
  }

  printf("\n NULL marks the end of array, byte after last character: %s", AString[3]);

  for (i = 0; i < 3; i++) {
	  AString[i] = AString[i] + 1;
  }
  printf("\n After Adding 1 to each character, results in '%s' \n", AString);

  AString[3] = AString[3] + 60;
  printf("\n After adding 60 to byte after last character : %s \n", AString);


  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  printf("\n 1st frag: \n");
  for (k = 0; k < 10; k++) {         // direct reference to array element
	  b[k] = a[k];
	  printf(" %x", &b[k]);
  }

  printf("\n 2nd frag: \n");
  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++) {      // indirect reference to array element
	  *ip2++ = *ip++;
	  printf(" %x", &b[k]);
  }

  // all done
  printf("\n\n ALL DONE\n");
}
