/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */
extern signed int horiz_operator[3][3];
extern signed int vert_operator[3][3];

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
signed int convolution2D(signed int llvm_cbe_posy, signed int llvm_cbe_posx,  char *llvm_cbe_input, signed int (*llvm_cbe_operator)[3]);
double sobel( char *llvm_cbe_input,  char *llvm_cbe_output,  char *llvm_cbe_golden);


/* Global Variable Definitions and Initialization */
signed int horiz_operator[3][3] = { { 4294967295u, 0u, 1u }, { 4294967294u, 0u, 2u }, { 4294967295u, 0u, 1u } };
signed int vert_operator[3][3] = { { 1u, 2u, 1u }, { 0u, 0u, 0u }, { 4294967295u, 4294967294u, 4294967295u } };


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

signed int convolution2D(signed int llvm_cbe_posy, signed int llvm_cbe_posx,  char *llvm_cbe_input, signed int (*llvm_cbe_operator)[3]) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
   char *llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned char llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  signed int *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  unsigned int llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
   char *llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  unsigned char llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  signed int *llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  unsigned int llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  unsigned int llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  unsigned int llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
   char *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  unsigned char llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  unsigned int llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  signed int *llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  unsigned int llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  unsigned int llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
   char *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  unsigned char llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  signed int *llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
   char *llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  unsigned char llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  unsigned int llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  signed int *llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  unsigned int llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned int llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
   char *llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  unsigned char llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  unsigned int llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  signed int *llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  unsigned int llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  unsigned int llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
   char *llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  unsigned char llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  signed int *llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  unsigned int llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  unsigned int llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
   char *llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  unsigned char llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  signed int *llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  unsigned int llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  unsigned int llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
   char *llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  unsigned char llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  unsigned int llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  signed int *llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @convolution2D\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%0 = shl i32 %%posy, 10, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__1 = (unsigned int )llvm_cbe_posy << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = add i32 %%0, -1024, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_18_count);
  llvm_cbe_tmp__2 = (unsigned int )((unsigned int )(llvm_cbe_tmp__1&4294967295ull)) + ((unsigned int )(4294966272u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__2&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i32 %%posx, -1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_23_count);
  llvm_cbe_tmp__3 = (unsigned int )((unsigned int )(llvm_cbe_posx&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__3&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = add i32 %%2, %%1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__4 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__2&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__4&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i8* %%input, i32 %%3, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__5 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__4))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__4));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i8* %%4, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__6 = (unsigned char )*llvm_cbe_tmp__5;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = zext i8 %%5 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__7 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__6&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [3 x i32]* %%operator, i32 0, i32 0, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__8 = (signed int *)(&(*llvm_cbe_operator)[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )0u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%7, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__9 = (unsigned int )*llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = mul nsw i32 %%6, %%8, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__10 = (unsigned int )((unsigned int )(llvm_cbe_tmp__7&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__9&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__10&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = shl i32 %%posy, 10, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_39_count);
  llvm_cbe_tmp__11 = (unsigned int )llvm_cbe_posy << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add i32 %%2, %%10, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_40_count);
  llvm_cbe_tmp__12 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__11&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__12&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i8* %%input, i32 %%11, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_41_count);
  llvm_cbe_tmp__13 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__12))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__12));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* %%12, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__14 = (unsigned char )*llvm_cbe_tmp__13;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = zext i8 %%13 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_43_count);
  llvm_cbe_tmp__15 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__14&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds [3 x i32]* %%operator, i32 1, i32 0, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_44_count);
  llvm_cbe_tmp__16 = (signed int *)(&llvm_cbe_operator[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )0u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )0u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%15, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_45_count);
  llvm_cbe_tmp__17 = (unsigned int )*llvm_cbe_tmp__16;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = mul nsw i32 %%14, %%16, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__18 = (unsigned int )((unsigned int )(llvm_cbe_tmp__15&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__17&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__18&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add nsw i32 %%17, %%9, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_47_count);
  llvm_cbe_tmp__19 = (unsigned int )((unsigned int )(llvm_cbe_tmp__18&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__10&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__19&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = shl i32 %%posy, 10, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__20 = (unsigned int )llvm_cbe_posy << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = add i32 %%19, 1024, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__21 = (unsigned int )((unsigned int )(llvm_cbe_tmp__20&4294967295ull)) + ((unsigned int )(1024u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__21&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = add i32 %%2, %%20, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )(llvm_cbe_tmp__3&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__21&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__22&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i8* %%input, i32 %%21, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__23 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__22))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__22));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i8* %%22, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__24 = (unsigned char )*llvm_cbe_tmp__23;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = zext i8 %%23 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_61_count);
  llvm_cbe_tmp__25 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__24&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [3 x i32]* %%operator, i32 2, i32 0, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__26 = (signed int *)(&llvm_cbe_operator[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )0u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )0u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* %%25, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_63_count);
  llvm_cbe_tmp__27 = (unsigned int )*llvm_cbe_tmp__26;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__27);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = mul nsw i32 %%24, %%26, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_64_count);
  llvm_cbe_tmp__28 = (unsigned int )((unsigned int )(llvm_cbe_tmp__25&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__27&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__28&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%27, %%18, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_65_count);
  llvm_cbe_tmp__29 = (unsigned int )((unsigned int )(llvm_cbe_tmp__28&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__19&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__29&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add i32 %%1, %%posx, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_83_count);
  llvm_cbe_tmp__30 = (unsigned int )((unsigned int )(llvm_cbe_tmp__2&4294967295ull)) + ((unsigned int )(llvm_cbe_posx&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__30&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds i8* %%input, i32 %%29, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_84_count);
  llvm_cbe_tmp__31 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__30))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__30));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = load i8* %%30, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_85_count);
  llvm_cbe_tmp__32 = (unsigned char )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = zext i8 %%31 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_86_count);
  llvm_cbe_tmp__33 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__32&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [3 x i32]* %%operator, i32 0, i32 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_87_count);
  llvm_cbe_tmp__34 = (signed int *)(&(*llvm_cbe_operator)[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 3
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* %%33, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_88_count);
  llvm_cbe_tmp__35 = (unsigned int )*llvm_cbe_tmp__34;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = mul nsw i32 %%32, %%34, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_89_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(llvm_cbe_tmp__33&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__35&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__36&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = add nsw i32 %%35, %%28, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_90_count);
  llvm_cbe_tmp__37 = (unsigned int )((unsigned int )(llvm_cbe_tmp__36&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__29&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__37&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add i32 %%10, %%posx, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_99_count);
  llvm_cbe_tmp__38 = (unsigned int )((unsigned int )(llvm_cbe_tmp__11&4294967295ull)) + ((unsigned int )(llvm_cbe_posx&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__38&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds i8* %%input, i32 %%37, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_100_count);
  llvm_cbe_tmp__39 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__38))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__38));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i8* %%38, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_101_count);
  llvm_cbe_tmp__40 = (unsigned char )*llvm_cbe_tmp__39;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = zext i8 %%39 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_102_count);
  llvm_cbe_tmp__41 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__40&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = getelementptr inbounds [3 x i32]* %%operator, i32 1, i32 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__42 = (signed int *)(&llvm_cbe_operator[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )1u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = load i32* %%41, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__43 = (unsigned int )*llvm_cbe_tmp__42;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__43);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = mul nsw i32 %%40, %%42, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__44 = (unsigned int )((unsigned int )(llvm_cbe_tmp__41&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__43&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__44&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = add nsw i32 %%43, %%36, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__45 = (unsigned int )((unsigned int )(llvm_cbe_tmp__44&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__37&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__45&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = add i32 %%20, %%posx, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__46 = (unsigned int )((unsigned int )(llvm_cbe_tmp__21&4294967295ull)) + ((unsigned int )(llvm_cbe_posx&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__46&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = getelementptr inbounds i8* %%input, i32 %%45, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__47 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__46))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__46));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = load i8* %%46, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__48 = (unsigned char )*llvm_cbe_tmp__47;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = zext i8 %%47 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_118_count);
  llvm_cbe_tmp__49 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__48&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__49);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = getelementptr inbounds [3 x i32]* %%operator, i32 2, i32 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_119_count);
  llvm_cbe_tmp__50 = (signed int *)(&llvm_cbe_operator[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )1u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )1u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = load i32* %%49, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_120_count);
  llvm_cbe_tmp__51 = (unsigned int )*llvm_cbe_tmp__50;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = mul nsw i32 %%48, %%50, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_121_count);
  llvm_cbe_tmp__52 = (unsigned int )((unsigned int )(llvm_cbe_tmp__49&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__51&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__52&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = add nsw i32 %%51, %%44, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_122_count);
  llvm_cbe_tmp__53 = (unsigned int )((unsigned int )(llvm_cbe_tmp__52&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__45&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__53&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = add i32 %%posx, 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_140_count);
  llvm_cbe_tmp__54 = (unsigned int )((unsigned int )(llvm_cbe_posx&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__54&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = add i32 %%53, %%1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_141_count);
  llvm_cbe_tmp__55 = (unsigned int )((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__2&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__55&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds i8* %%input, i32 %%54, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_142_count);
  llvm_cbe_tmp__56 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__55))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__55));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i8* %%55, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_143_count);
  llvm_cbe_tmp__57 = (unsigned char )*llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = zext i8 %%56 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__58 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__57&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = getelementptr inbounds [3 x i32]* %%operator, i32 0, i32 2, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_145_count);
  llvm_cbe_tmp__59 = (signed int *)(&(*llvm_cbe_operator)[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 3
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )2u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = load i32* %%58, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_146_count);
  llvm_cbe_tmp__60 = (unsigned int )*llvm_cbe_tmp__59;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = mul nsw i32 %%57, %%59, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_147_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(llvm_cbe_tmp__58&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__60&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = add nsw i32 %%60, %%52, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_148_count);
  llvm_cbe_tmp__62 = (unsigned int )((unsigned int )(llvm_cbe_tmp__61&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__53&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__62&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = add i32 %%53, %%10, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_157_count);
  llvm_cbe_tmp__63 = (unsigned int )((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__11&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__63&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = getelementptr inbounds i8* %%input, i32 %%62, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_158_count);
  llvm_cbe_tmp__64 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__63))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__63));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = load i8* %%63, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__65 = (unsigned char )*llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__65);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = zext i8 %%64 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_160_count);
  llvm_cbe_tmp__66 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__65&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = getelementptr inbounds [3 x i32]* %%operator, i32 1, i32 2, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_161_count);
  llvm_cbe_tmp__67 = (signed int *)(&llvm_cbe_operator[(((signed int )1u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )2u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )2u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = load i32* %%66, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_162_count);
  llvm_cbe_tmp__68 = (unsigned int )*llvm_cbe_tmp__67;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__68);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = mul nsw i32 %%65, %%67, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__69 = (unsigned int )((unsigned int )(llvm_cbe_tmp__66&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__68&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__69&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = add nsw i32 %%68, %%61, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__70 = (unsigned int )((unsigned int )(llvm_cbe_tmp__69&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__62&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__70&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = add i32 %%53, %%20, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_173_count);
  llvm_cbe_tmp__71 = (unsigned int )((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__21&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__71&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = getelementptr inbounds i8* %%input, i32 %%70, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_174_count);
  llvm_cbe_tmp__72 = ( char *)(&llvm_cbe_input[(((signed int )llvm_cbe_tmp__71))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__71));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = load i8* %%71, align 1, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_175_count);
  llvm_cbe_tmp__73 = (unsigned char )*llvm_cbe_tmp__72;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = zext i8 %%72 to i32, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_176_count);
  llvm_cbe_tmp__74 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__73&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = getelementptr inbounds [3 x i32]* %%operator, i32 2, i32 2, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_177_count);
  llvm_cbe_tmp__75 = (signed int *)(&llvm_cbe_operator[(((signed int )2u))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed int )2u))]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed int )2u) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'operator' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = load i32* %%74, align 4, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_178_count);
  llvm_cbe_tmp__76 = (unsigned int )*llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = mul nsw i32 %%73, %%75, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_179_count);
  llvm_cbe_tmp__77 = (unsigned int )((unsigned int )(llvm_cbe_tmp__74&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__76&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__77&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = add nsw i32 %%76, %%69, !dbg !5 for 0x%I64xth hint within @convolution2D  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__78 = (unsigned int )((unsigned int )(llvm_cbe_tmp__77&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__70&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__78&4294967295ull)));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @convolution2D}\n");
  return llvm_cbe_tmp__78;
}

static const ConstantDoubleTy FPConstant0 = 0x3EB0000000000000ULL;    /* 9.536743e-07 */
static const ConstantDoubleTy FPConstant1 = 0x40F0000000000000ULL;    /* 6.553600e+04 */
static const ConstantDoubleTy FPConstant2 = 0x4024000000000000ULL;    /* 1.000000e+01 */

double sobel( char *llvm_cbe_input,  char *llvm_cbe_output,  char *llvm_cbe_golden) {
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge18_count = 0;
  unsigned int llvm_cbe_storemerge18;
  unsigned int llvm_cbe_storemerge18__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  unsigned int llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
   char *llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
   char *llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  unsigned int llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond25_count = 0;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge215_count = 0;
  unsigned int llvm_cbe_storemerge215;
  unsigned int llvm_cbe_storemerge215__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge513_count = 0;
  unsigned int llvm_cbe_storemerge513;
  unsigned int llvm_cbe_storemerge513__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  unsigned int llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  unsigned int llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  double llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  double llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  unsigned int llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  unsigned int llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  unsigned int llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
   char *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  unsigned char llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  unsigned int llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  unsigned int llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
   char *llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  unsigned int llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond22_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  unsigned int llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond23_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge39_count = 0;
  unsigned int llvm_cbe_storemerge39;
  unsigned int llvm_cbe_storemerge39__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  double llvm_cbe_tmp__101;
  double llvm_cbe_tmp__101__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  unsigned int llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge46_count = 0;
  unsigned int llvm_cbe_storemerge46;
  unsigned int llvm_cbe_storemerge46__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  double llvm_cbe_tmp__103;
  double llvm_cbe_tmp__103__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  unsigned int llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
   char *llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  unsigned char llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
   char *llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  unsigned char llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  unsigned int llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  unsigned int llvm_cbe_tmp__111;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  double llvm_cbe_tmp__112;
  static  unsigned long long aesl_llvm_cbe_pow2_count = 0;
  double llvm_cbe_pow2;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  double llvm_cbe_tmp__113;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  unsigned int llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  unsigned int llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond19_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  double llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  double llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  double llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  double llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @sobel\n");
  llvm_cbe_storemerge18__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe_tmp__120;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__120:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge18 = phi i32 [ 1, %%0 ], [ %%6, %%1  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge18_count);
  llvm_cbe_storemerge18 = (unsigned int )llvm_cbe_storemerge18__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge18 = 0x%X",llvm_cbe_storemerge18);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__83);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl nsw i32 %%storemerge18, 10, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__79 = (unsigned int )llvm_cbe_storemerge18 << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__79);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i8* %%output, i32 %%2, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_236_count);
  llvm_cbe_tmp__80 = ( char *)(&llvm_cbe_output[(((signed int )llvm_cbe_tmp__79))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__79));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%3, align 1, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_237_count);
  *llvm_cbe_tmp__80 = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = or i32 %%2, 1023, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_238_count);
  llvm_cbe_tmp__81 = (unsigned int )llvm_cbe_tmp__79 | 1023u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds i8* %%output, i32 %%4, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__82 = ( char *)(&llvm_cbe_output[(((signed int )llvm_cbe_tmp__81))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__81));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%5, align 1, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_240_count);
  *llvm_cbe_tmp__82 = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%storemerge18, 1, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_241_count);
  llvm_cbe_tmp__83 = (unsigned int )((unsigned int )(llvm_cbe_storemerge18&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__83&4294967295ull)));
  if (((llvm_cbe_tmp__83&4294967295U) == (1023u&4294967295U))) {
    llvm_cbe_storemerge215__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    goto llvm_cbe__2e_preheader10;
  } else {
    llvm_cbe_storemerge18__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__83;   /* for PHI node */
    goto llvm_cbe_tmp__120;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader10' to make GCC happy */
llvm_cbe__2e_preheader10:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge215 = phi i32 [ %%29, %%28 ], [ 1, %%1  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge215_count);
  llvm_cbe_storemerge215 = (unsigned int )llvm_cbe_storemerge215__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge215 = 0x%X",llvm_cbe_storemerge215);
printf("\n = 0x%X",llvm_cbe_tmp__100);
printf("\n = 0x%X",1u);
}
  llvm_cbe_storemerge513__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe_tmp__121;

llvm_cbe_tmp__122:
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i32 %%storemerge215, 1, !dbg !10 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_331_count);
  llvm_cbe_tmp__100 = (unsigned int )((unsigned int )(llvm_cbe_storemerge215&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__100&4294967295ull)));
  if (((llvm_cbe_tmp__100&4294967295U) == (1023u&4294967295U))) {
    llvm_cbe_storemerge39__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    llvm_cbe_tmp__101__PHI_TEMPORARY = (double )0x0p0;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge215__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__100;   /* for PHI node */
    goto llvm_cbe__2e_preheader10;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__121:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge513 = phi i32 [ 1, %%.preheader10 ], [ %%27, %%26  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge513_count);
  llvm_cbe_storemerge513 = (unsigned int )llvm_cbe_storemerge513__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge513 = 0x%X",llvm_cbe_storemerge513);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__99);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call i32 @convolution2D(i32 %%storemerge513, i32 %%storemerge215, i8* %%input, [3 x i32]* getelementptr inbounds ([3 x [3 x i32]]* @horiz_operator, i32 0, i32 0)), !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_283_count);
  llvm_cbe_tmp__84 = (unsigned int ) /*tail*/ convolution2D(llvm_cbe_storemerge513, llvm_cbe_storemerge215, ( char *)llvm_cbe_input, ((&horiz_operator[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument storemerge513 = 0x%X",llvm_cbe_storemerge513);
printf("\nArgument storemerge215 = 0x%X",llvm_cbe_storemerge215);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__84);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = mul nsw i32 %%8, %%8, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_284_count);
  llvm_cbe_tmp__85 = (unsigned int )((unsigned int )(llvm_cbe_tmp__84&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__84&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__85&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = tail call i32 @convolution2D(i32 %%storemerge513, i32 %%storemerge215, i8* %%input, [3 x i32]* getelementptr inbounds ([3 x [3 x i32]]* @vert_operator, i32 0, i32 0)), !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_285_count);
  llvm_cbe_tmp__86 = (unsigned int ) /*tail*/ convolution2D(llvm_cbe_storemerge513, llvm_cbe_storemerge215, ( char *)llvm_cbe_input, ((&vert_operator[(((signed int )0u))
#ifdef AESL_BC_SIM
 % 3
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument storemerge513 = 0x%X",llvm_cbe_storemerge513);
printf("\nArgument storemerge215 = 0x%X",llvm_cbe_storemerge215);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__86);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = mul nsw i32 %%10, %%10, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_286_count);
  llvm_cbe_tmp__87 = (unsigned int )((unsigned int )(llvm_cbe_tmp__86&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__86&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__87&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%11, %%9, !dbg !5 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_287_count);
  llvm_cbe_tmp__88 = (unsigned int )((unsigned int )(llvm_cbe_tmp__87&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__85&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__88&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = uitofp i32 %%12 to double, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_290_count);
  llvm_cbe_tmp__89 = (double )((double )(unsigned int )llvm_cbe_tmp__88);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__89, *(long long*)(&llvm_cbe_tmp__89));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = tail call double @sqrt(double %%13) nounwind readnone, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_291_count);
  llvm_cbe_tmp__90 = (double ) /*tail*/ sqrt(llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__89, *(long long*)(&llvm_cbe_tmp__89));
printf("\nReturn  = %lf",llvm_cbe_tmp__90);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = fptosi double %%14 to i32, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_292_count);
  llvm_cbe_tmp__91 = (unsigned int )((signed int )llvm_cbe_tmp__90&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__91);
  if ((((signed int )llvm_cbe_tmp__91) > ((signed int )255u))) {
    goto llvm_cbe_tmp__123;
  } else {
    goto llvm_cbe_tmp__124;
  }

llvm_cbe_tmp__125:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%storemerge513, 1, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_309_count);
  llvm_cbe_tmp__99 = (unsigned int )((unsigned int )(llvm_cbe_storemerge513&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__99&4294967295ull)));
  if (((llvm_cbe_tmp__99&4294967295U) == (1023u&4294967295U))) {
    goto llvm_cbe_tmp__122;
  } else {
    llvm_cbe_storemerge513__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__99;   /* for PHI node */
    goto llvm_cbe_tmp__121;
  }

llvm_cbe_tmp__123:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = shl i32 %%storemerge513, 10, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_298_count);
  llvm_cbe_tmp__92 = (unsigned int )llvm_cbe_storemerge513 << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__92);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = add nsw i32 %%18, %%storemerge215, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_299_count);
  llvm_cbe_tmp__93 = (unsigned int )((unsigned int )(llvm_cbe_tmp__92&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge215&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__93&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds i8* %%output, i32 %%19, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_300_count);
  llvm_cbe_tmp__94 = ( char *)(&llvm_cbe_output[(((signed int )llvm_cbe_tmp__93))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__93));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 -1, i8* %%20, align 1, !dbg !6 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_301_count);
  *llvm_cbe_tmp__94 = ((unsigned char )-1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )-1));
  goto llvm_cbe_tmp__125;

llvm_cbe_tmp__124:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = trunc i32 %%15 to i8, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_303_count);
  llvm_cbe_tmp__95 = (unsigned char )((unsigned char )llvm_cbe_tmp__91&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = shl i32 %%storemerge513, 10, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_304_count);
  llvm_cbe_tmp__96 = (unsigned int )llvm_cbe_storemerge513 << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = add nsw i32 %%23, %%storemerge215, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_305_count);
  llvm_cbe_tmp__97 = (unsigned int )((unsigned int )(llvm_cbe_tmp__96&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge215&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__97&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i8* %%output, i32 %%24, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_306_count);
  llvm_cbe_tmp__98 = ( char *)(&llvm_cbe_output[(((signed int )llvm_cbe_tmp__97))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__97));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%22, i8* %%25, align 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_307_count);
  *llvm_cbe_tmp__98 = llvm_cbe_tmp__95;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
  goto llvm_cbe_tmp__125;

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader10' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge39 = phi i32 [ %%46, %%45 ], [ 1, %%28  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge39_count);
  llvm_cbe_storemerge39 = (unsigned int )llvm_cbe_storemerge39__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge39 = 0x%X",llvm_cbe_storemerge39);
printf("\n = 0x%X",llvm_cbe_tmp__115);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = phi double [ %%43, %%45 ], [ 0.000000e+00, %%28  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_346_count);
  llvm_cbe_tmp__101 = (double )llvm_cbe_tmp__101__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = %lf",llvm_cbe_tmp__101);
printf("\n = %lf",llvm_cbe_tmp__113);
printf("\n = %lf",0x0p0);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = shl nsw i32 %%storemerge39, 10, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_359_count);
  llvm_cbe_tmp__102 = (unsigned int )llvm_cbe_storemerge39 << 10u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__102);
  llvm_cbe_storemerge46__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__103__PHI_TEMPORARY = (double )llvm_cbe_tmp__101;   /* for PHI node */
  goto llvm_cbe_tmp__126;

llvm_cbe_tmp__127:
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = add nsw i32 %%storemerge39, 1, !dbg !9 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_394_count);
  llvm_cbe_tmp__115 = (unsigned int )((unsigned int )(llvm_cbe_storemerge39&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__115&4294967295ull)));
  if (((llvm_cbe_tmp__115&4294967295U) == (1023u&4294967295U))) {
    goto llvm_cbe_tmp__128;
  } else {
    llvm_cbe_storemerge39__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__115;   /* for PHI node */
    llvm_cbe_tmp__101__PHI_TEMPORARY = (double )llvm_cbe_tmp__113;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__126:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge46 = phi i32 [ 1, %%.preheader ], [ %%44, %%32  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_storemerge46_count);
  llvm_cbe_storemerge46 = (unsigned int )llvm_cbe_storemerge46__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge46 = 0x%X",llvm_cbe_storemerge46);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__114);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = phi double [ %%30, %%.preheader ], [ %%43, %%32  for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_361_count);
  llvm_cbe_tmp__103 = (double )llvm_cbe_tmp__103__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = %lf",llvm_cbe_tmp__103);
printf("\n = %lf",llvm_cbe_tmp__101);
printf("\n = %lf",llvm_cbe_tmp__113);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = add nsw i32 %%storemerge46, %%31, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_362_count);
  llvm_cbe_tmp__104 = (unsigned int )((unsigned int )(llvm_cbe_storemerge46&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__102&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__104&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds i8* %%output, i32 %%34, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_363_count);
  llvm_cbe_tmp__105 = ( char *)(&llvm_cbe_output[(((signed int )llvm_cbe_tmp__104))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__104));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = load i8* %%35, align 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_364_count);
  llvm_cbe_tmp__106 = (unsigned char )*llvm_cbe_tmp__105;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__106);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = zext i8 %%36 to i32, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_365_count);
  llvm_cbe_tmp__107 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__106&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds i8* %%golden, i32 %%34, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_366_count);
  llvm_cbe_tmp__108 = ( char *)(&llvm_cbe_golden[(((signed int )llvm_cbe_tmp__104))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",((signed int )llvm_cbe_tmp__104));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = load i8* %%38, align 1, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_367_count);
  llvm_cbe_tmp__109 = (unsigned char )*llvm_cbe_tmp__108;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__109);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = zext i8 %%39 to i32, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_368_count);
  llvm_cbe_tmp__110 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__109&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__110);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = sub nsw i32 %%37, %%40, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_369_count);
  llvm_cbe_tmp__111 = (unsigned int )((unsigned int )(llvm_cbe_tmp__107&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__110&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__111&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = sitofp i32 %%41 to double, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_370_count);
  llvm_cbe_tmp__112 = (double )((double )(signed int )llvm_cbe_tmp__111);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__112, *(long long*)(&llvm_cbe_tmp__112));
if (AESL_DEBUG_TRACE)
printf("\n  %%pow2 = fmul double %%42, %%42, !dbg !7 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_pow2_count);
  llvm_cbe_pow2 = (double )llvm_cbe_tmp__112 * llvm_cbe_tmp__112;
if (AESL_DEBUG_TRACE)
printf("\npow2 = %lf,  0x%llx\n", llvm_cbe_pow2, *(long long*)(&llvm_cbe_pow2));
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = fadd double %%33, %%pow2, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_373_count);
  llvm_cbe_tmp__113 = (double )llvm_cbe_tmp__103 + llvm_cbe_pow2;
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__113, *(long long*)(&llvm_cbe_tmp__113));
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = add nsw i32 %%storemerge46, 1, !dbg !10 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_379_count);
  llvm_cbe_tmp__114 = (unsigned int )((unsigned int )(llvm_cbe_storemerge46&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__114&4294967295ull)));
  if (((llvm_cbe_tmp__114&4294967295U) == (1023u&4294967295U))) {
    goto llvm_cbe_tmp__127;
  } else {
    llvm_cbe_storemerge46__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__114;   /* for PHI node */
    llvm_cbe_tmp__103__PHI_TEMPORARY = (double )llvm_cbe_tmp__113;   /* for PHI node */
    goto llvm_cbe_tmp__126;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__128:
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = fmul double %%43, 0x3EB0000000000000, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_416_count);
  llvm_cbe_tmp__116 = (double )llvm_cbe_tmp__113 * (*(double*)&FPConstant0);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__116, *(long long*)(&llvm_cbe_tmp__116));
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = fdiv double 6.553600e+04, %%48, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_422_count);
  llvm_cbe_tmp__117 = (double )(*(double*)&FPConstant1) / llvm_cbe_tmp__116;
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__117, *(long long*)(&llvm_cbe_tmp__117));
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = tail call double @log10(double %%49) nounwind, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_423_count);
  llvm_cbe_tmp__118 = (double ) /*tail*/ log10(llvm_cbe_tmp__117);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = %lf,  0x%llx",llvm_cbe_tmp__117, *(long long*)(&llvm_cbe_tmp__117));
printf("\nReturn  = %lf",llvm_cbe_tmp__118);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = fmul double %%50, 1.000000e+01, !dbg !8 for 0x%I64xth hint within @sobel  --> \n", ++aesl_llvm_cbe_424_count);
  llvm_cbe_tmp__119 = (double )llvm_cbe_tmp__118 * (*(double*)&FPConstant2);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__119, *(long long*)(&llvm_cbe_tmp__119));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @sobel}\n");
  return llvm_cbe_tmp__119;
}

