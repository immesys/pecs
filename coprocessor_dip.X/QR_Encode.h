/**
 * Obtained under a BSD license from https://github.com/swex/QR-Image-embedded
 */
/*
 * QR_Encode.h
 *
 *  Created on: Jan 18, 2012
 *      Author: swex
 */

#include <string.h>
#include <stdlib.h>
#include <stdint.h>

// Constant

// Error correction level
#define QR_LEVEL_L	0
#define QR_LEVEL_M	1
#define QR_LEVEL_Q	2
#define QR_LEVEL_H	3


//Data Mode
#define QR_MODE_NUMERAL		0
#define QR_MODE_ALPHABET	1
#define QR_MODE_8BIT		2
#define QR_MODE_KANJI		3


//Group version (model number)
#define QR_VERSION_S	0 // 1 ~ 9
#define QR_VERSION_M	1 // 10 ~ 26
#define QR_VERSION_L	2 // 27 ~ 40

//#define MAX_ALLCODEWORD	 3706 //The maximum total number of code words
//#define MAX_DATACODEWORD 2956 //Maximum data word code (version 40-L)
#define MAX_ALLCODEWORD 500
#define MAX_DATACODEWORD 500

#define MAX_CODEBLOCK	  153 //(Including RS code word) the maximum number of block data code word
//#define MAX_MODULESIZE	  177 //Maximum number of modules in a side
#define MAX_MODULESIZE 40
//#define MAX_BITDATA		 3917 // finfile data
#define MAX_BITDATA 500
//Margin when drawing a bitmap
//#define QR_MARGIN	4


/////////////////////////////////////////////////////////////////////////////

typedef struct tagRS_BLOCKINFO
{
	uint32_t ncRSBlock;		//RS block number
	uint32_t ncAllCodeWord;	//The number of codewords in the block
	uint32_t ncDataCodeWord;	//The number of data code words (the number of code words - the number of RS code word)

} RS_BLOCKINFO, *LPRS_BLOCKINFO;



/////////////////////////////////////////////////////////////////////////////
//Version code-related information (model number)

typedef struct tagQR_VERSIONINFO
{
	uint32_t nVersionNo;
	uint32_t ncAllCodeWord;

	// Error correction levels (0 = L, 1 = M, 2 = Q, 3 = H)
	uint32_t ncDataCodeWord[4];	// data len

	uint32_t ncAlignPouint32_t;	// position
	uint32_t nAlignPouint32_t[6];	// numberof

	RS_BLOCKINFO RS_BlockInfo1[4]; // EC pos
	RS_BLOCKINFO RS_BlockInfo2[4]; // EC pos

} QR_VERSIONINFO, *LPQR_VERSIONINFO;


typedef unsigned short WORD;

typedef unsigned char BYTE;

typedef BYTE* LPBYTE;

typedef const char* LPCSTR;

//#define ZeroMemory(Destination,Length) memset((Destination),0,(Length))
#define ZeroMemory(Destinatio, Len)

uint32_t EncodeData(uint32_t nLevel, uint32_t nVersion , LPCSTR lpsSource, uint32_t sourcelen,unsigned char QR_m_data[]);

