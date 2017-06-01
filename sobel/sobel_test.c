 #include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <string.h>
#include <sys/time.h>

//timer info

#define SIZE	1024

static char INPUT_FILE[32] = "input.gre";
static char OUTPUT_FILE[32] = "output.gre";
static char GOLDEN_FILE[32] = "golden.gre";
static char *Log_File;

static FILE *file1,*file2,*file3;
/* The horizontal and vertical operators to be used in the sobel filter */
//Use -fsigned-char flag in order to use signed chars

/* The arrays holding the input image, the output image and the output used *
 * as golden standard. The luminosity (intensity) of each pixel in the      *
 * grayscale image is represented by a value between 0 and 255 (an unsigned *
 * character). The arrays (and the files) contain these values in row-major *
 * order (element after element within each row and row after row. 			*/
unsigned char input[SIZE*SIZE], output[SIZE*SIZE], golden[SIZE*SIZE];


/* Implement a 2D convolution of the matrix with the operator */
/* posy and posx correspond to the vertical and horizontal disposition of the *
 * pixel we process in the original image, input is the input image and       *
 * operator the operator we apply (horizontal or vertical). The function ret. *
 * value is the convolution of the operator with the neighboring pixels of the*
 * pixel we process.														  */



int main(int argc, char* argv[])
{
    const char *Path = "0:/";
    int res,f_out;
	printf("Sobel filter start!\n");
		/* Open the input, output, golden files, read the input and golden    *
	     * and store them to the corresponding arrays.						  */
		Log_File = (char *)INPUT_FILE;
		file1 = fopen(Log_File, "r");
		if (file1==NULL) {
			printf("File  INPUT_FILE  not found\n");
			return 1;
		}
		Log_File = (char *)GOLDEN_FILE;
		file2 = fopen(Log_File, "r");
		if (file2==NULL) {
					printf("File  GOLDEN  not found\n");
				return 1;
			}

		Log_File = (char *)OUTPUT_FILE;
		file3 = fopen(Log_File, "w");
		if (file3==NULL) {
			printf("File  output  not found\n");
			return 1;
		}



		unsigned int readBytes=SIZE*SIZE;
		int off =0;
		off=fread(&input[off],1,readBytes,file1);
		printf("readbytes = %d\n",off);


		unsigned int readBytes2=SIZE*SIZE;
		off =0;
		off=fread(&golden[off],1,readBytes2,file2);
		//off+=readBytes2;

		printf("Just read from golden with start %p\n",&golden[0]);
		printf("Read:%d bytes\n",off);

		fclose(file1);
		fclose(file2);
	double PSNR;
	PSNR = sobel(input, output, golden);
	printf("PSNR of original Sobel and computed Sobel image: %g\n", PSNR);
	printf("Create the output image with:$convert -depth 8 -size 1024x1024 GRAY:output_sobel.grey output_sobel.jpg\n");
	fseek ( file3 , 0 , SEEK_SET );
	off =0;
	int writtenBytes=0;

		f_out = fwrite(&output[off],1,SIZE*SIZE,file3);
		if (f_out==0) {
			printf(" ERROR: f_write2 returned \r\n");
			//return XST_FAILURE;
		}


	if (f_out==0) {
		printf(" ERROR: f_write2 returned %d\r\n",f_out);

		return 1;
	}
	off+=writtenBytes;

	printf("Just written to output with start %p\n",&output[0]);
	printf("Written:%d bytes\n",writtenBytes);

	fclose(file3);

	return 0;
}

