; ModuleID = 'C:/Users/konto/Documents/embeded/sobel/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@vert_operator = constant [9 x i32] [i32 1, i32 2, i32 1, i32 0, i32 0, i32 0, i32 -1, i32 -2, i32 -1]
@sobel_str = internal unnamed_addr constant [6 x i8] c"sobel\00"
@llvm_global_ctors_1 = appending global [2 x void ()*] [void ()* @_GLOBAL__I_a, void ()* @_GLOBAL__I_a1944]
@llvm_global_ctors_0 = appending global [2 x i32] [i32 65535, i32 65535]
@horiz_operator = constant [9 x i32] [i32 -1, i32 0, i32 1, i32 -2, i32 0, i32 2, i32 -1, i32 0, i32 1]

define double @sobel([1048576 x i8]* %input_r, [1048576 x i8]* %output_r, [1048576 x i8]* %golden) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap([1048576 x i8]* %input_r) nounwind, !map !1208
  call void (...)* @_ssdm_op_SpecBitsMap([1048576 x i8]* %output_r) nounwind, !map !1214
  call void (...)* @_ssdm_op_SpecBitsMap([1048576 x i8]* %golden) nounwind, !map !1218
  call void (...)* @_ssdm_op_SpecBitsMap(double 0.000000e+00) nounwind, !map !1222
  call void (...)* @_ssdm_op_SpecTopModule([6 x i8]* @sobel_str) nounwind
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i10 [ 1, %0 ], [ %i_1, %2 ]
  %exitcond5 = icmp eq i10 %i, -1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1022, i64 1022, i64 1022) nounwind
  br i1 %exitcond5, label %.preheader8.preheader, label %2

.preheader8.preheader:                            ; preds = %1
  br label %.preheader8

; <label>:2                                       ; preds = %1
  %tmp = call i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10 %i, i10 0)
  %tmp_cast = zext i20 %tmp to i32
  %output_addr = getelementptr [1048576 x i8]* %output_r, i32 0, i32 %tmp_cast
  store i8 0, i8* %output_addr, align 1
  %tmp_1 = or i20 %tmp, 1023
  %tmp_1_cast = zext i20 %tmp_1 to i32
  %output_addr_1 = getelementptr [1048576 x i8]* %output_r, i32 0, i32 %tmp_1_cast
  store i8 0, i8* %output_addr_1, align 1
  %i_1 = add i10 %i, 1
  br label %1

.preheader8:                                      ; preds = %.preheader8.preheader, %7
  %j = phi i10 [ %j_2, %7 ], [ 1, %.preheader8.preheader ]
  %exitcond3 = icmp eq i10 %j, -1
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1022, i64 1022, i64 1022) nounwind
  br i1 %exitcond3, label %.preheader6.preheader, label %.preheader7.preheader

.preheader7.preheader:                            ; preds = %.preheader8
  br label %.preheader7

.preheader6.preheader:                            ; preds = %.preheader8
  %PSNR = alloca double
  store double 0.000000e+00, double* %PSNR
  br label %.preheader6

.preheader7:                                      ; preds = %.preheader7.preheader, %6
  %i_2 = phi i10 [ %i_5, %6 ], [ 1, %.preheader7.preheader ]
  %exitcond2 = icmp eq i10 %i_2, -1
  %empty_10 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1022, i64 1022, i64 1022) nounwind
  br i1 %exitcond2, label %7, label %3

; <label>:3                                       ; preds = %.preheader7
  %tmp_2 = call fastcc i32 @convolution2D(i10 %i_2, i10 %j, [1048576 x i8]* %input_r, [9 x i32]* @horiz_operator) nounwind
  %tmp_3 = mul nsw i32 %tmp_2, %tmp_2
  %tmp_4 = call fastcc i32 @convolution2D(i10 %i_2, i10 %j, [1048576 x i8]* %input_r, [9 x i32]* @vert_operator) nounwind
  %tmp_9 = mul nsw i32 %tmp_4, %tmp_4
  %p = add nsw i32 %tmp_9, %tmp_3
  %tmp_s = uitofp i32 %p to double
  %x_assign_2 = call double @llvm.sqrt.f64(double %tmp_s)
  %p_Val2_1 = bitcast double %x_assign_2 to i64
  %p_Result_s = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %p_Val2_1, i32 63)
  %loc_V = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %p_Val2_1, i32 52, i32 62) nounwind
  %loc_V_1 = trunc i64 %p_Val2_1 to i52
  %p_Result_1 = call i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1 true, i52 %loc_V_1) nounwind
  %tmp_i_i = zext i53 %p_Result_1 to i136
  %tmp_i_i_i_cast3 = zext i11 %loc_V to i12
  %sh_assign = add i12 -1023, %tmp_i_i_i_cast3
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i12.i32(i12 %sh_assign, i32 11)
  %tmp_i_i_11 = sub i11 1023, %loc_V
  %tmp_i_i_cast = sext i11 %tmp_i_i_11 to i12
  %sh_assign_1 = select i1 %isNeg, i12 %tmp_i_i_cast, i12 %sh_assign
  %sh_assign_1_cast = sext i12 %sh_assign_1 to i32
  %tmp_18_i_i = zext i32 %sh_assign_1_cast to i136
  %tmp_18_i_i_cast = zext i32 %sh_assign_1_cast to i53
  %tmp_19_i_i = lshr i53 %p_Result_1, %tmp_18_i_i_cast
  %tmp_20_i_i = shl i136 %tmp_i_i, %tmp_18_i_i
  %tmp_13 = call i1 @_ssdm_op_BitSelect.i1.i53.i32(i53 %tmp_19_i_i, i32 52)
  %tmp_5 = zext i1 %tmp_13 to i32
  %tmp_7 = call i32 @_ssdm_op_PartSelect.i32.i136.i32.i32(i136 %tmp_20_i_i, i32 52, i32 83)
  %p_Val2_4 = select i1 %isNeg, i32 %tmp_5, i32 %tmp_7
  %p_Val2_7_i_i = sub i32 0, %p_Val2_4
  %p_Val2_s = select i1 %p_Result_s, i32 %p_Val2_7_i_i, i32 %p_Val2_4
  %tmp_14 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %p_Val2_s, i32 8, i32 31)
  %icmp = icmp sgt i24 %tmp_14, 0
  br i1 %icmp, label %4, label %5

; <label>:4                                       ; preds = %3
  %sum7 = call i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10 %i_2, i10 %j)
  %sum7_cast = zext i20 %sum7 to i32
  %output_addr_2 = getelementptr [1048576 x i8]* %output_r, i32 0, i32 %sum7_cast
  store i8 -1, i8* %output_addr_2, align 1
  br label %6

; <label>:5                                       ; preds = %3
  %tmp_15 = trunc i32 %p_Val2_s to i8
  %sum9 = call i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10 %i_2, i10 %j)
  %sum9_cast = zext i20 %sum9 to i32
  %output_addr_3 = getelementptr [1048576 x i8]* %output_r, i32 0, i32 %sum9_cast
  store i8 %tmp_15, i8* %output_addr_3, align 1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %i_5 = add i10 %i_2, 1
  br label %.preheader7

; <label>:7                                       ; preds = %.preheader7
  %j_2 = add i10 %j, 1
  br label %.preheader8

.preheader6:                                      ; preds = %.preheader6.preheader, %9
  %i_3 = phi i10 [ %i_4, %9 ], [ 1, %.preheader6.preheader ]
  %exitcond1 = icmp eq i10 %i_3, -1
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1022, i64 1022, i64 1022) nounwind
  br i1 %exitcond1, label %10, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader6
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %8
  %j_1 = phi i10 [ %j_3, %8 ], [ 1, %.preheader.preheader ]
  %exitcond = icmp eq i10 %j_1, -1
  %empty_13 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1022, i64 1022, i64 1022) nounwind
  br i1 %exitcond, label %9, label %8

; <label>:8                                       ; preds = %.preheader
  %PSNR_load_1 = load double* %PSNR
  %sum = call i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10 %i_3, i10 %j_1)
  %sum_cast = zext i20 %sum to i32
  %output_addr_4 = getelementptr [1048576 x i8]* %output_r, i32 0, i32 %sum_cast
  %output_load = load i8* %output_addr_4, align 1
  %tmp_11_cast = zext i8 %output_load to i9
  %golden_addr = getelementptr [1048576 x i8]* %golden, i32 0, i32 %sum_cast
  %golden_load = load i8* %golden_addr, align 1
  %tmp_12_cast = zext i8 %golden_load to i9
  %tmp_6 = sub i9 %tmp_11_cast, %tmp_12_cast
  %tmp_10 = sext i9 %tmp_6 to i32
  %tmp_8 = sitofp i32 %tmp_10 to double
  %t = fmul double %tmp_8, %tmp_8
  %PSNR_3 = fadd double %PSNR_load_1, %t
  %j_3 = add i10 %j_1, 1
  store double %PSNR_3, double* %PSNR
  br label %.preheader

; <label>:9                                       ; preds = %.preheader
  %i_4 = add i10 %i_3, 1
  br label %.preheader6

; <label>:10                                      ; preds = %.preheader6
  %PSNR_load = load double* %PSNR
  %PSNR_1 = fmul double %PSNR_load, 0x3EB0000000000000
  %x_assign = fdiv double 6.553600e+04, %PSNR_1
  %tmp_i_i_i1 = call double @llvm.log.f64(double %x_assign) nounwind
  %tmp_i_i1 = fmul double %tmp_i_i_i1, 0x3FDBCB7B1526E50E
  %PSNR_2 = fmul double %tmp_i_i1, 1.000000e+01
  ret double %PSNR_2
}

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i136 @llvm.part.select.i136(i136, i32, i32) nounwind readnone

declare double @llvm.log.f64(double) nounwind readonly

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc i32 @convolution2D(i10 %posy, i10 %posx, [1048576 x i8]* nocapture %input_r, [9 x i32]* nocapture %operator) readonly {
  %res = alloca i32
  %posx_read = call i10 @_ssdm_op_Read.ap_auto.i10(i10 %posx)
  %posy_read = call i10 @_ssdm_op_Read.ap_auto.i10(i10 %posy)
  store i32 0, i32* %res
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  %j = phi i3 [ -1, %0 ], [ %j_4, %.loopexit.loopexit ]
  %exitcond1 = icmp eq i3 %j, 2
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  br i1 %exitcond1, label %2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.loopexit
  %j_4 = add i3 %j, 1
  %j_4_cast = zext i3 %j_4 to i5
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader.preheader
  %i = phi i3 [ %i_6, %1 ], [ -1, %.preheader.preheader ]
  %exitcond = icmp eq i3 %i, 2
  %empty_14 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  br i1 %exitcond, label %.loopexit.loopexit, label %1

; <label>:1                                       ; preds = %.preheader
  %res_load_1 = load i32* %res
  %tmp_5_cast = sext i3 %i to i10
  %tmp5 = add i10 %posy_read, %tmp_5_cast
  %tmp1 = call i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10 %tmp5, i10 %posx_read)
  %tmp1_cast = zext i20 %tmp1 to i22
  %j_cast1 = sext i3 %j to i22
  %sum = add i22 %j_cast1, %tmp1_cast
  %sum_cast = zext i22 %sum to i32
  %input_addr = getelementptr [1048576 x i8]* %input_r, i32 0, i32 %sum_cast
  %input_load = load i8* %input_addr, align 1
  %tmp_s = zext i8 %input_load to i32
  %i_6 = add i3 %i, 1
  %i_6_cast_cast = zext i3 %i_6 to i5
  %tmp = call i5 @_ssdm_op_BitConcatenate.i5.i3.i2(i3 %i_6, i2 0)
  %tmp_11 = sub i5 %tmp, %i_6_cast_cast
  %tmp_12 = add i5 %tmp_11, %j_4_cast
  %tmp_15_cast = zext i5 %tmp_12 to i32
  %operator_addr = getelementptr [9 x i32]* %operator, i32 0, i32 %tmp_15_cast
  %operator_load = load i32* %operator_addr, align 4
  %tmp_9 = mul nsw i32 %tmp_s, %operator_load
  %res_1 = add nsw i32 %res_load_1, %tmp_9
  store i32 %res_1, i32* %res
  br label %.preheader

; <label>:2                                       ; preds = %.loopexit
  %res_load = load i32* %res
  ret i32 %res_load
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i10 @_ssdm_op_Read.ap_auto.i10(i10) {
entry:
  ret i10 %0
}

declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i52 @_ssdm_op_PartSelect.i52.i64.i32.i32(i64, i32, i32) nounwind readnone

define weak i32 @_ssdm_op_PartSelect.i32.i136.i32.i32(i136, i32, i32) nounwind readnone {
entry:
  %empty = call i136 @llvm.part.select.i136(i136 %0, i32 %1, i32 %2)
  %empty_15 = trunc i136 %empty to i32
  ret i32 %empty_15
}

define weak i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_16 = trunc i32 %empty to i24
  ret i24 %empty_16
}

define weak i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_17 = trunc i64 %empty to i11
  ret i11 %empty_17
}

define weak i1 @_ssdm_op_BitSelect.i1.i64.i32(i64, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i64
  %empty_18 = shl i64 1, %empty
  %empty_19 = and i64 %0, %empty_18
  %empty_20 = icmp ne i64 %empty_19, 0
  ret i1 %empty_20
}

define weak i1 @_ssdm_op_BitSelect.i1.i53.i32(i53, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i53
  %empty_21 = shl i53 1, %empty
  %empty_22 = and i53 %0, %empty_21
  %empty_23 = icmp ne i53 %empty_22, 0
  ret i1 %empty_23
}

define weak i1 @_ssdm_op_BitSelect.i1.i12.i32(i12, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i12
  %empty_24 = shl i12 1, %empty
  %empty_25 = and i12 %0, %empty_24
  %empty_26 = icmp ne i12 %empty_25, 0
  ret i1 %empty_26
}

define weak i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1, i52) nounwind readnone {
entry:
  %empty = zext i1 %0 to i53
  %empty_27 = zext i52 %1 to i53
  %empty_28 = shl i53 %empty, 52
  %empty_29 = or i53 %empty_28, %empty_27
  ret i53 %empty_29
}

define weak i5 @_ssdm_op_BitConcatenate.i5.i3.i2(i3, i2) nounwind readnone {
entry:
  %empty = zext i3 %0 to i5
  %empty_30 = zext i2 %1 to i5
  %empty_31 = shl i5 %empty, 2
  %empty_32 = or i5 %empty_31, %empty_30
  ret i5 %empty_32
}

define weak i20 @_ssdm_op_BitConcatenate.i20.i10.i10(i10, i10) nounwind readnone {
entry:
  %empty = zext i10 %0 to i20
  %empty_33 = zext i10 %1 to i20
  %empty_34 = shl i20 %empty, 10
  %empty_35 = or i20 %empty_34, %empty_33
  ret i20 %empty_35
}

declare void @_GLOBAL__I_a1944() nounwind

declare void @_GLOBAL__I_a() nounwind

!opencl.kernels = !{!0, !7, !13, !19, !19, !13, !19, !19, !19, !21, !27, !19, !19, !29, !33, !13, !19, !35, !37, !35, !37, !35, !37, !13, !19, !13, !19, !13, !19, !13, !19, !13, !19, !13, !13, !19, !19, !38, !42, !38, !42, !44, !47, !49, !51, !13, !19, !13, !19, !13, !19, !53, !55, !53, !55, !53, !55, !55, !53, !55, !55, !53, !55, !53, !55, !56, !56, !61, !61, !63, !65, !71, !71, !65, !74, !65, !65, !65, !77, !77, !79, !79, !81, !65, !65, !65, !84, !71, !71, !65, !87, !65, !65, !65, !89, !89, !91, !91, !93, !65, !65, !65, !65, !65, !65, !95, !65, !65, !65, !65, !61, !61, !63, !95, !65, !61, !61, !63, !95, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !97, !97, !97, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !97, !97, !97, !99, !99, !99, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !99, !99, !99, !65, !99, !99, !99, !104, !65, !65, !65, !65, !106, !106, !109, !109, !113, !116, !116, !65, !65, !65, !65, !118, !120, !120, !65, !106, !106, !121, !121, !123, !125, !125, !65, !65, !65, !65, !126, !128, !128, !106, !129, !129, !131, !65, !133, !133, !136, !131, !138, !138, !65, !65, !65, !140, !140, !65, !141, !140, !140, !143, !140, !140, !145, !65, !65, !65, !65, !65, !65, !65, !65, !104, !65, !65, !65, !65, !106, !106, !147, !147, !149, !151, !151, !65, !65, !65, !65, !152, !154, !154, !106, !106, !155, !155, !157, !159, !159, !65, !160, !91, !91, !106, !161, !161, !136, !131, !163, !163, !65, !65, !140, !140, !165, !140, !140, !167, !65, !65, !65, !65, !65, !65, !55, !169, !171, !172, !171, !173, !173, !175, !177, !177, !65, !178, !180, !180, !106, !175, !178, !180, !180, !106, !181, !65, !136, !131, !136, !136, !53, !183, !171, !185, !171, !187, !187, !188, !190, !190, !65, !65, !191, !193, !193, !106, !188, !191, !193, !193, !106, !194, !65, !196, !196, !55, !172, !171, !53, !185, !171, !55, !169, !171, !53, !183, !171, !55, !53, !55, !53, !198, !65, !65, !200, !65, !19, !13, !19, !13, !19, !19, !13, !13, !51, !65, !49, !65, !47, !196, !196, !65, !65, !201, !202, !128, !128, !44, !196, !196, !65, !42, !204, !206, !206, !207, !65, !65, !65, !193, !193, !209, !209, !211, !211, !214, !183, !120, !120, !65, !217, !219, !65, !65, !65, !89, !89, !221, !221, !65, !106, !106, !222, !222, !224, !226, !193, !193, !65, !228, !65, !65, !65, !120, !120, !79, !79, !230, !230, !65, !125, !125, !125, !65, !232, !234, !232, !234, !232, !234, !235, !38, !169, !154, !154, !65, !106, !106, !222, !222, !238, !240, !180, !180, !65, !159, !159, !159, !242, !234, !242, !234, !244, !42, !38, !19, !246, !65, !65, !65, !250, !71, !71, !65, !65, !253, !253, !65, !255, !255, !255, !257, !259, !259, !253, !65, !136, !131, !261, !261, !140, !140, !65, !263, !265, !265, !267, !269, !269, !65, !271, !271, !273, !271, !271, !273, !275, !280, !65, !65, !65, !282, !71, !71, !284, !65, !65, !65, !286, !286, !286, !65, !136, !288, !289, !289, !113, !118, !120, !120, !65, !65, !106, !291, !291, !293, !293, !294, !296, !296, !297, !299, !299, !297, !19, !301, !65, !65, !65, !250, !65, !303, !303, !305, !305, !305, !307, !309, !309, !303, !65, !136, !131, !311, !311, !140, !140, !65, !313, !267, !315, !315, !65, !317, !317, !319, !317, !317, !319, !275, !321, !65, !65, !65, !323, !71, !71, !284, !65, !65, !65, !325, !325, !325, !299, !299, !297, !13, !327, !329, !329, !331, !329, !329, !331, !333, !65, !65, !65, !335, !71, !71, !284, !65, !65, !65, !337, !337, !337, !65, !136, !288, !339, !339, !149, !152, !154, !154, !65, !65, !106, !341, !341, !293, !293, !294, !296, !296, !343, !345, !345, !343, !13, !347, !349, !349, !351, !349, !349, !351, !353, !65, !65, !65, !355, !71, !71, !284, !65, !65, !65, !357, !357, !357, !345, !345, !343, !19, !235, !13, !359, !361, !65, !65, !65, !180, !180, !363, !363, !365, !365, !367, !244, !19, !13, !19, !13, !19, !13, !19, !13, !37, !65, !369, !171, !371, !374, !65, !120, !120, !89, !89, !35, !65, !376, !378, !37, !35, !37, !35, !53, !55, !33, !380, !65, !65, !382, !136, !131, !383, !383, !385, !385, !65, !65, !65, !65, !387, !65, !65, !65, !389, !389, !79, !79, !391, !65, !65, !65, !393, !395, !395, !396, !396, !65, !65, !393, !395, !395, !65, !65, !398, !398, !398, !65, !400, !65, !65, !65, !65, !65, !65, !402, !402, !402, !65, !404, !65, !65, !65, !65, !65, !65, !65, !65, !406, !406, !406, !408, !408, !410, !412, !65, !415, !267, !296, !296, !65, !417, !417, !419, !421, !106, !424, !424, !426, !426, !428, !65, !299, !299, !297, !106, !429, !429, !431, !433, !431, !431, !65, !65, !65, !65, !65, !65, !284, !65, !65, !395, !395, !435, !417, !417, !419, !65, !106, !437, !437, !439, !439, !439, !65, !433, !441, !441, !442, !419, !419, !443, !443, !65, !65, !442, !419, !419, !65, !65, !445, !447, !449, !449, !65, !296, !296, !65, !65, !450, !450, !450, !452, !65, !65, !454, !454, !454, !456, !65, !65, !65, !65, !65, !65, !65, !65, !458, !458, !458, !65, !460, !460, !462, !464, !65, !65, !65, !65, !65, !466, !466, !466, !65, !468, !468, !470, !65, !472, !472, !474, !65, !65, !106, !475, !475, !477, !477, !479, !65, !65, !480, !486, !284, !65, !65, !65, !474, !474, !474, !487, !487, !489, !65, !65, !65, !65, !490, !490, !490, !492, !495, !495, !497, !472, !499, !65, !106, !501, !501, !503, !505, !505, !65, !65, !65, !65, !506, !508, !508, !136, !131, !509, !509, !65, !106, !511, !511, !513, !513, !513, !65, !65, !65, !515, !517, !517, !106, !65, !65, !196, !196, !65, !518, !520, !490, !490, !65, !296, !296, !65, !65, !521, !521, !521, !523, !131, !525, !525, !527, !65, !529, !529, !531, !250, !71, !71, !65, !65, !140, !140, !65, !533, !529, !529, !531, !106, !534, !534, !536, !538, !538, !65, !65, !65, !65, !539, !65, !106, !541, !541, !543, !543, !546, !548, !548, !106, !549, !549, !551, !553, !553, !65, !65, !65, !65, !554, !555, !548, !548, !106, !557, !557, !559, !562, !562, !65, !65, !65, !65, !564, !566, !566, !568, !568, !570, !570, !571, !65, !65, !573, !106, !576, !576, !106, !578, !578, !580, !580, !580, !65, !65, !65, !582, !65, !65, !65, !584, !584, !584, !65, !586, !586, !171, !140, !140, !588, !136, !131, !590, !590, !113, !118, !106, !592, !592, !65, !65, !65, !65, !65, !65, !65, !140, !140, !65, !65, !594, !65, !65, !65, !65, !65, !65, !65, !65, !65, !29, !596, !598, !172, !171, !65, !600, !600, !65, !602, !65, !605, !171, !607, !607, !607, !65, !65, !609, !611, !611, !612, !284, !65, !65, !614, !614, !65, !607, !609, !611, !611, !140, !140, !106, !616, !616, !618, !620, !620, !65, !609, !106, !621, !621, !65, !65, !140, !140, !605, !623, !65, !65, !65, !625, !625, !611, !611, !627, !627, !65, !65, !140, !140, !629, !65, !625, !625, !629, !171, !631, !631, !633, !65, !65, !65, !65, !634, !637, !640, !642, !642, !643, !643, !65, !65, !645, !645, !647, !65, !645, !645, !645, !65, !65, !65, !649, !649, !651, !492, !653, !65, !65, !65, !65, !655, !657, !65, !645, !645, !645, !658, !647, !647, !284, !65, !65, !643, !643, !288, !660, !660, !662, !662, !664, !65, !665, !625, !625, !293, !293, !294, !296, !296, !643, !666, !106, !106, !668, !171, !234, !234, !65, !670, !79, !79, !93, !89, !89, !131, !65, !584, !584, !672, !674, !674, !65, !106, !675, !675, !65, !65, !605, !611, !611, !677, !65, !65, !678, !681, !682, !154, !154, !611, !611, !106, !684, !684, !686, !686, !686, !65, !688, !690, !690, !627, !627, !106, !692, !692, !694, !694, !694, !65, !65, !65, !65, !696, !698, !698, !700, !702, !702, !702, !106, !704, !704, !706, !708, !708, !65, !65, !65, !65, !709, !711, !711, !65, !106, !712, !712, !714, !716, !711, !711, !718, !718, !720, !65, !65, !106, !722, !722, !724, !727, !727, !65, !65, !65, !65, !729, !65, !65, !731, !731, !733, !733, !65, !735, !65, !65, !65, !65, !736, !736, !106, !738, !738, !740, !740, !740, !65, !65, !65, !65, !106, !742, !742, !744, !744, !744, !65, !65, !65, !65, !746, !748, !748, !750, !752, !752, !754, !756, !756, !106, !757, !757, !759, !761, !761, !65, !65, !65, !65, !762, !763, !756, !756, !106, !765, !765, !767, !769, !769, !65, !65, !65, !65, !771, !773, !773, !775, !775, !748, !748, !777, !65, !65, !779, !140, !140, !781, !171, !106, !783, !783, !785, !785, !785, !65, !65, !65, !65, !787, !65, !65, !65, !789, !789, !789, !65, !65, !65, !106, !791, !791, !140, !140, !793, !140, !140, !65, !795, !65, !797, !773, !773, !799, !801, !801, !801, !65, !65, !65, !803, !106, !106, !805, !805, !801, !801, !801, !807, !65, !65, !65, !65, !65, !65, !65, !65, !65, !65, !65, !65, !65, !65, !53, !53, !808, !185, !171, !185, !171, !810, !810, !65, !813, !128, !128, !815, !816, !818, !818, !217, !219, !65, !65, !65, !820, !822, !171, !65, !824, !825, !827, !829, !831, !831, !65, !65, !65, !832, !832, !834, !65, !832, !832, !832, !65, !65, !836, !836, !838, !840, !834, !834, !842, !284, !65, !65, !831, !831, !288, !844, !844, !846, !846, !848, !65, !65, !65, !849, !849, !851, !293, !293, !294, !296, !296, !831, !853, !853, !63, !95, !854, !857, !857, !859, !65, !849, !861, !759, !754, !106, !863, !863, !865, !865, !152, !154, !154, !149, !867, !169, !868, !870, !870, !65, !65, !65, !872, !874, !874, !756, !756, !106, !876, !876, !878, !878, !878, !65, !880, !106, !881, !881, !65, !65, !65, !65, !65, !883, !883, !885, !65, !65, !65, !250, !71, !71, !887, !887, !888, !106, !890, !890, !892, !894, !894, !65, !65, !65, !65, !895, !106, !897, !897, !899, !899, !152, !154, !154, !149, !901, !903, !903, !65, !65, !65, !65, !905, !874, !874, !907, !907, !909, !909, !106, !910, !910, !912, !912, !912, !65, !914, !914, !914, !65, !916, !106, !917, !917, !65, !65, !65, !65, !65, !65, !65, !61, !61, !63, !95, !61, !61, !63, !95, !284, !65, !65, !919, !919, !921, !136, !288, !923, !923, !118, !120, !120, !106, !925, !925, !293, !293, !294, !296, !296, !919, !65, !65, !65, !53, !53, !927, !927, !927, !927, !927, !65, !65, !820, !824, !929, !931, !933, !935, !935, !65, !936, !936, !65, !65, !938, !938, !940, !65, !938, !938, !938, !65, !65, !65, !649, !649, !651, !492, !942, !65, !65, !65, !944, !946, !65, !938, !938, !938, !947, !940, !940, !284, !65, !65, !936, !936, !65, !949, !949, !284, !136, !288, !950, !950, !118, !120, !120, !106, !952, !952, !293, !293, !294, !296, !296, !936, !954, !65, !65, !956, !958, !201, !202, !234, !19, !959, !959, !959, !959, !959, !65, !65, !960, !65, !106, !961, !961, !963, !965, !965, !65, !65, !65, !65, !966, !968, !968, !65, !65, !65, !969, !971, !973, !975, !975, !976, !976, !65, !65, !978, !978, !980, !65, !978, !978, !978, !65, !65, !65, !649, !649, !651, !492, !982, !65, !65, !65, !984, !986, !65, !978, !978, !978, !987, !980, !980, !284, !65, !65, !976, !976, !65, !284, !136, !288, !989, !989, !152, !154, !154, !106, !991, !991, !293, !293, !294, !296, !296, !976, !993, !65, !65, !65, !995, !91, !91, !997, !84, !87, !998, !13, !999, !999, !53, !53, !53, !1001, !1004, !1004, !1006, !1008, !1010, !65, !1012, !171, !1014, !1014, !1014, !65, !1016, !1018, !1018, !284, !65, !65, !1019, !1019, !136, !65, !1014, !1016, !1018, !1018, !1021, !1023, !1023, !65, !1016, !106, !1024, !1024, !1014, !1016, !106, !1026, !1026, !1028, !1028, !1030, !1032, !65, !65, !1034, !1036, !1038, !1040, !1040, !1006, !1006, !65, !65, !1041, !1041, !1043, !65, !1041, !1041, !1041, !65, !65, !649, !649, !651, !492, !1045, !65, !65, !65, !1047, !1049, !65, !1041, !1041, !1041, !1050, !1043, !1043, !284, !65, !65, !1006, !1006, !65, !288, !1052, !1052, !293, !293, !294, !296, !296, !1006, !1004, !1012, !1016, !1018, !1018, !65, !106, !1054, !1054, !1056, !1056, !1056, !65, !65, !65, !1058, !65, !65, !65, !65, !1060, !1062, !1062, !1064, !566, !566, !106, !1065, !1065, !140, !140, !1067, !140, !140, !1069, !65, !1071, !566, !566, !1073, !1075, !193, !193, !65, !65, !53, !53, !1077, !454, !454, !454, !458, !458, !458, !1080, !1080, !1082, !293, !293, !294, !296, !296, !275, !71, !71, !1084, !71, !71, !1086, !1088, !1088, !1086, !136, !131, !1090, !1090, !477, !477, !479, !1092, !1098, !267, !296, !296, !529, !529, !531, !1100, !171, !234, !234, !1102, !1102, !1104, !53, !53, !55, !55, !53, !53, !53, !53, !55, !55, !19, !19, !19, !19, !13, !13, !13, !13, !19, !19, !19, !19, !13, !13, !13, !13, !1106, !65, !65, !65, !250, !71, !71, !65, !65, !65, !65, !140, !140, !65, !263, !265, !265, !65, !267, !269, !269, !65, !329, !329, !331, !329, !329, !331, !275, !71, !71, !333, !65, !65, !65, !335, !71, !71, !65, !65, !65, !84, !71, !71, !87, !65, !65, !65, !89, !89, !91, !91, !284, !65, !65, !65, !337, !337, !337, !65, !136, !288, !339, !339, !106, !106, !147, !147, !149, !151, !151, !65, !65, !65, !65, !152, !154, !154, !65, !65, !106, !341, !341, !293, !293, !294, !296, !296, !343, !345, !345, !343, !173, !173, !175, !177, !177, !65, !65, !178, !180, !180, !106, !106, !161, !161, !175, !178, !180, !180, !65, !106, !155, !155, !131, !163, !163, !181, !65, !136, !131, !133, !133, !136, !136, !65, !65, !65, !65, !65, !65, !65, !65, !1108, !65, !65, !65, !250, !71, !71, !65, !65, !140, !140, !65, !313, !267, !315, !315, !65, !349, !349, !351, !349, !349, !351, !275, !353, !65, !65, !65, !355, !71, !71, !284, !65, !65, !65, !357, !357, !357, !345, !345, !343, !1110, !65, !65, !65, !250, !71, !71, !65, !65, !140, !140, !65, !1112, !267, !1114, !1114, !65, !1116, !1116, !1118, !1116, !1116, !1118, !275, !1120, !65, !65, !65, !1122, !71, !71, !284, !65, !65, !65, !1124, !1124, !1124, !345, !345, !343, !1126, !65, !65, !65, !250, !71, !71, !65, !65, !140, !140, !65, !1128, !267, !1130, !1130, !65, !1132, !1132, !1134, !1132, !1132, !1134, !275, !1136, !65, !65, !65, !1138, !71, !71, !284, !65, !65, !65, !1140, !1140, !1140, !345, !345, !343, !1142, !65, !271, !271, !273, !271, !271, !273, !280, !65, !65, !65, !282, !71, !71, !65, !201, !202, !128, !128, !284, !65, !65, !65, !286, !286, !286, !65, !136, !288, !289, !289, !106, !106, !109, !109, !113, !116, !116, !65, !65, !65, !65, !118, !120, !120, !65, !65, !106, !291, !291, !293, !293, !294, !296, !296, !297, !299, !299, !297, !187, !187, !188, !190, !190, !65, !65, !191, !193, !193, !106, !106, !129, !129, !188, !191, !193, !193, !106, !121, !121, !131, !138, !138, !194, !65, !196, !196, !65, !65, !65, !65, !1144, !317, !317, !319, !317, !317, !319, !321, !65, !65, !65, !323, !71, !71, !284, !65, !65, !65, !325, !325, !325, !299, !299, !297, !1146, !1148, !1148, !1150, !1148, !1148, !1150, !1152, !65, !65, !65, !1154, !71, !71, !284, !65, !65, !65, !1156, !1156, !1156, !299, !299, !297, !1158, !1160, !1160, !1162, !1160, !1160, !1162, !1164, !65, !65, !65, !1166, !71, !71, !284, !65, !65, !65, !1167, !1167, !1167, !299, !299, !297, !1169, !65, !65, !65, !250, !65, !303, !303, !305, !305, !305, !307, !309, !309, !303, !65, !136, !131, !311, !311, !140, !140, !65, !1171, !65, !65, !65, !250, !71, !71, !65, !65, !1173, !1173, !65, !1175, !1175, !1175, !1177, !1179, !1179, !1173, !65, !136, !131, !1181, !1181, !140, !140, !65, !1183, !65, !65, !65, !250, !71, !71, !65, !65, !1185, !1185, !65, !1187, !1187, !1187, !1189, !1191, !1191, !1185, !65, !136, !131, !1193, !1193, !140, !140, !65, !1195, !1197, !1199, !61, !61, !63, !65, !74, !65, !65, !65, !77, !77, !79, !79, !81, !65, !65, !65, !93, !65, !65, !65, !65, !95, !65, !61, !61, !63, !95, !65, !61, !61, !63, !95, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !97, !97, !97, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !246, !65, !65, !65, !250, !71, !71, !65, !65, !253, !253, !65, !255, !255, !255, !257, !259, !259, !253, !65, !136, !131, !261, !261, !140, !140, !65, !327, !97, !97, !97, !65, !97, !97, !97, !97, !97, !97, !99, !99, !99, !65, !97, !97, !97, !65, !97, !97, !97, !65, !97, !97, !97, !65, !99, !99, !99, !65, !99, !99, !99}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!1201}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int", metadata !"uchar*", metadata !"int [3]*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"const", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"posy", metadata !"posx", metadata !"input", metadata !"operator"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"uchar*", metadata !"uchar*", metadata !"uchar*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"input", metadata !"output", metadata !"golden"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"double"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"x"}
!19 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !18, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"float"}
!21 = metadata !{null, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !6}
!22 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!23 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"double"}
!25 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"y", metadata !"x"}
!27 = metadata !{null, metadata !22, metadata !23, metadata !28, metadata !25, metadata !26, metadata !6}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"float"}
!29 = metadata !{null, metadata !30, metadata !9, metadata !31, metadata !11, metadata !32, metadata !6}
!30 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"double*", metadata !"double*"}
!32 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"sin", metadata !"cos"}
!33 = metadata !{null, metadata !30, metadata !9, metadata !34, metadata !11, metadata !32, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"float*", metadata !"float*"}
!35 = metadata !{null, metadata !22, metadata !23, metadata !24, metadata !25, metadata !36, metadata !6}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y"}
!37 = metadata !{null, metadata !22, metadata !23, metadata !28, metadata !25, metadata !36, metadata !6}
!38 = metadata !{null, metadata !39, metadata !23, metadata !40, metadata !25, metadata !41, metadata !6}
!39 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"double*"}
!41 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"intpart"}
!42 = metadata !{null, metadata !39, metadata !23, metadata !43, metadata !25, metadata !41, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"float*"}
!44 = metadata !{null, metadata !39, metadata !23, metadata !45, metadata !25, metadata !46, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"int*"}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"exp"}
!47 = metadata !{null, metadata !39, metadata !23, metadata !48, metadata !25, metadata !46, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"int*"}
!49 = metadata !{null, metadata !22, metadata !23, metadata !50, metadata !25, metadata !46, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"int"}
!51 = metadata !{null, metadata !22, metadata !23, metadata !52, metadata !25, metadata !46, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"int"}
!53 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !54, metadata !6}
!54 = metadata !{metadata !"kernel_arg_name", metadata !"t_in"}
!55 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !54, metadata !6}
!56 = metadata !{null, metadata !57, metadata !15, metadata !58, metadata !59, metadata !60, metadata !6}
!57 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!58 = metadata !{metadata !"kernel_arg_type", metadata !"char*"}
!59 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const"}
!60 = metadata !{metadata !"kernel_arg_name", metadata !"p"}
!61 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !62, metadata !6}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!63 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !64, metadata !6}
!64 = metadata !{metadata !"kernel_arg_name", metadata !"d"}
!65 = metadata !{null, metadata !66, metadata !67, metadata !68, metadata !69, metadata !70, metadata !6}
!66 = metadata !{metadata !"kernel_arg_addr_space"}
!67 = metadata !{metadata !"kernel_arg_access_qual"}
!68 = metadata !{metadata !"kernel_arg_type"}
!69 = metadata !{metadata !"kernel_arg_type_qual"}
!70 = metadata !{metadata !"kernel_arg_name"}
!71 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !73, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!73 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!74 = metadata !{null, metadata !22, metadata !23, metadata !75, metadata !25, metadata !76, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<54, true> &"}
!76 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!77 = metadata !{null, metadata !14, metadata !15, metadata !78, metadata !17, metadata !73, metadata !6}
!78 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, true> &"}
!79 = metadata !{null, metadata !14, metadata !15, metadata !80, metadata !17, metadata !73, metadata !6}
!80 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!81 = metadata !{null, metadata !14, metadata !15, metadata !82, metadata !17, metadata !83, metadata !6}
!82 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, true> &"}
!83 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!84 = metadata !{null, metadata !22, metadata !23, metadata !85, metadata !25, metadata !86, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"int"}
!86 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!87 = metadata !{null, metadata !22, metadata !23, metadata !88, metadata !25, metadata !76, metadata !6}
!88 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<32, true> &"}
!89 = metadata !{null, metadata !14, metadata !15, metadata !90, metadata !17, metadata !73, metadata !6}
!90 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!91 = metadata !{null, metadata !14, metadata !15, metadata !92, metadata !17, metadata !73, metadata !6}
!92 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &"}
!93 = metadata !{null, metadata !14, metadata !15, metadata !94, metadata !17, metadata !83, metadata !6}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!95 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !96, metadata !6}
!96 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!97 = metadata !{null, metadata !57, metadata !15, metadata !58, metadata !59, metadata !98, metadata !6}
!98 = metadata !{metadata !"kernel_arg_name", metadata !"str"}
!99 = metadata !{null, metadata !100, metadata !23, metadata !101, metadata !102, metadata !103, metadata !6}
!100 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"char*", metadata !"signed char"}
!102 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !""}
!103 = metadata !{metadata !"kernel_arg_name", metadata !"str", metadata !"radix"}
!104 = metadata !{null, metadata !57, metadata !15, metadata !58, metadata !59, metadata !105, metadata !6}
!105 = metadata !{metadata !"kernel_arg_name", metadata !"tagp"}
!106 = metadata !{null, metadata !22, metadata !23, metadata !107, metadata !25, metadata !108, metadata !6}
!107 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!108 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!109 = metadata !{null, metadata !110, metadata !9, metadata !111, metadata !11, metadata !112, metadata !6}
!110 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!111 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<23, false>*", metadata !"int", metadata !"int"}
!112 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!113 = metadata !{null, metadata !14, metadata !15, metadata !114, metadata !17, metadata !115, metadata !6}
!114 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<23, false> &"}
!115 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!116 = metadata !{null, metadata !14, metadata !15, metadata !114, metadata !17, metadata !117, metadata !6}
!117 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!118 = metadata !{null, metadata !14, metadata !15, metadata !119, metadata !17, metadata !115, metadata !6}
!119 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<23, false> &"}
!120 = metadata !{null, metadata !14, metadata !15, metadata !119, metadata !17, metadata !73, metadata !6}
!121 = metadata !{null, metadata !110, metadata !9, metadata !122, metadata !11, metadata !112, metadata !6}
!122 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<8, false>*", metadata !"int", metadata !"int"}
!123 = metadata !{null, metadata !14, metadata !15, metadata !124, metadata !17, metadata !115, metadata !6}
!124 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<8, false> &"}
!125 = metadata !{null, metadata !14, metadata !15, metadata !124, metadata !17, metadata !117, metadata !6}
!126 = metadata !{null, metadata !14, metadata !15, metadata !127, metadata !17, metadata !115, metadata !6}
!127 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &"}
!128 = metadata !{null, metadata !14, metadata !15, metadata !127, metadata !17, metadata !73, metadata !6}
!129 = metadata !{null, metadata !110, metadata !9, metadata !130, metadata !11, metadata !112, metadata !6}
!130 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<32, false>*", metadata !"int", metadata !"int"}
!131 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !132, metadata !6}
!132 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!133 = metadata !{null, metadata !100, metadata !23, metadata !134, metadata !25, metadata !135, metadata !6}
!134 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<1, false>*", metadata !"int"}
!135 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!136 = metadata !{null, metadata !14, metadata !15, metadata !137, metadata !17, metadata !115, metadata !6}
!137 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!138 = metadata !{null, metadata !100, metadata !23, metadata !139, metadata !25, metadata !135, metadata !6}
!139 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<32, false>*", metadata !"int"}
!140 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !115, metadata !6}
!141 = metadata !{null, metadata !14, metadata !15, metadata !142, metadata !17, metadata !83, metadata !6}
!142 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!143 = metadata !{null, metadata !14, metadata !15, metadata !144, metadata !17, metadata !83, metadata !6}
!144 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!145 = metadata !{null, metadata !14, metadata !15, metadata !146, metadata !17, metadata !83, metadata !6}
!146 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<23> &"}
!147 = metadata !{null, metadata !110, metadata !9, metadata !148, metadata !11, metadata !112, metadata !6}
!148 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<52, false>*", metadata !"int", metadata !"int"}
!149 = metadata !{null, metadata !14, metadata !15, metadata !150, metadata !17, metadata !115, metadata !6}
!150 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<52, false> &"}
!151 = metadata !{null, metadata !14, metadata !15, metadata !150, metadata !17, metadata !117, metadata !6}
!152 = metadata !{null, metadata !14, metadata !15, metadata !153, metadata !17, metadata !115, metadata !6}
!153 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &"}
!154 = metadata !{null, metadata !14, metadata !15, metadata !153, metadata !17, metadata !73, metadata !6}
!155 = metadata !{null, metadata !110, metadata !9, metadata !156, metadata !11, metadata !112, metadata !6}
!156 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<11, false>*", metadata !"int", metadata !"int"}
!157 = metadata !{null, metadata !14, metadata !15, metadata !158, metadata !17, metadata !115, metadata !6}
!158 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<11, false> &"}
!159 = metadata !{null, metadata !14, metadata !15, metadata !158, metadata !17, metadata !117, metadata !6}
!160 = metadata !{null, metadata !14, metadata !15, metadata !92, metadata !17, metadata !115, metadata !6}
!161 = metadata !{null, metadata !110, metadata !9, metadata !162, metadata !11, metadata !112, metadata !6}
!162 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int", metadata !"int"}
!163 = metadata !{null, metadata !100, metadata !23, metadata !164, metadata !25, metadata !135, metadata !6}
!164 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int"}
!165 = metadata !{null, metadata !14, metadata !15, metadata !166, metadata !17, metadata !83, metadata !6}
!166 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<11> &"}
!167 = metadata !{null, metadata !14, metadata !15, metadata !168, metadata !17, metadata !83, metadata !6}
!168 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<52> &"}
!169 = metadata !{null, metadata !22, metadata !23, metadata !170, metadata !25, metadata !76, metadata !6}
!170 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &", metadata !"int"}
!171 = metadata !{null, metadata !14, metadata !15, metadata !90, metadata !17, metadata !83, metadata !6}
!172 = metadata !{null, metadata !22, metadata !23, metadata !85, metadata !25, metadata !76, metadata !6}
!173 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !174, metadata !6}
!174 = metadata !{metadata !"kernel_arg_name", metadata !"f"}
!175 = metadata !{null, metadata !14, metadata !15, metadata !176, metadata !17, metadata !115, metadata !6}
!176 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, false> &"}
!177 = metadata !{null, metadata !14, metadata !15, metadata !176, metadata !17, metadata !117, metadata !6}
!178 = metadata !{null, metadata !14, metadata !15, metadata !179, metadata !17, metadata !115, metadata !6}
!179 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &"}
!180 = metadata !{null, metadata !14, metadata !15, metadata !179, metadata !17, metadata !73, metadata !6}
!181 = metadata !{null, metadata !14, metadata !15, metadata !182, metadata !17, metadata !115, metadata !6}
!182 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<64, false> &"}
!183 = metadata !{null, metadata !22, metadata !23, metadata !184, metadata !25, metadata !76, metadata !6}
!184 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<23, false> &", metadata !"int"}
!185 = metadata !{null, metadata !22, metadata !23, metadata !186, metadata !25, metadata !76, metadata !6}
!186 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"int"}
!187 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !174, metadata !6}
!188 = metadata !{null, metadata !14, metadata !15, metadata !189, metadata !17, metadata !115, metadata !6}
!189 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<32, false> &"}
!190 = metadata !{null, metadata !14, metadata !15, metadata !189, metadata !17, metadata !117, metadata !6}
!191 = metadata !{null, metadata !14, metadata !15, metadata !192, metadata !17, metadata !115, metadata !6}
!192 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!193 = metadata !{null, metadata !14, metadata !15, metadata !192, metadata !17, metadata !73, metadata !6}
!194 = metadata !{null, metadata !14, metadata !15, metadata !195, metadata !17, metadata !115, metadata !6}
!195 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<32, false> &"}
!196 = metadata !{null, metadata !14, metadata !15, metadata !197, metadata !17, metadata !115, metadata !6}
!197 = metadata !{metadata !"kernel_arg_type", metadata !"uint"}
!198 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !199, metadata !6}
!199 = metadata !{metadata !"kernel_arg_name", metadata !"a_re"}
!200 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !199, metadata !6}
!201 = metadata !{null, metadata !22, metadata !23, metadata !186, metadata !25, metadata !86, metadata !6}
!202 = metadata !{null, metadata !22, metadata !23, metadata !203, metadata !25, metadata !76, metadata !6}
!203 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"const ap_int_base<32, true> &"}
!204 = metadata !{null, metadata !22, metadata !23, metadata !205, metadata !25, metadata !86, metadata !6}
!205 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"uint"}
!206 = metadata !{null, metadata !14, metadata !15, metadata !197, metadata !17, metadata !73, metadata !6}
!207 = metadata !{null, metadata !22, metadata !23, metadata !208, metadata !25, metadata !76, metadata !6}
!208 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<32, false> &"}
!209 = metadata !{null, metadata !14, metadata !15, metadata !210, metadata !17, metadata !73, metadata !6}
!210 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, false> &"}
!211 = metadata !{null, metadata !14, metadata !15, metadata !212, metadata !17, metadata !213, metadata !6}
!212 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<32>"}
!213 = metadata !{metadata !"kernel_arg_name", metadata !"data"}
!214 = metadata !{null, metadata !14, metadata !15, metadata !215, metadata !17, metadata !216, metadata !6}
!215 = metadata !{metadata !"kernel_arg_type", metadata !"const class fp_struct<float> &"}
!216 = metadata !{metadata !"kernel_arg_name", metadata !""}
!217 = metadata !{null, metadata !22, metadata !23, metadata !218, metadata !25, metadata !86, metadata !6}
!218 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &", metadata !"int"}
!219 = metadata !{null, metadata !22, metadata !23, metadata !220, metadata !25, metadata !76, metadata !6}
!220 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &", metadata !"const ap_int_base<32, true> &"}
!221 = metadata !{null, metadata !14, metadata !15, metadata !94, metadata !17, metadata !73, metadata !6}
!222 = metadata !{null, metadata !14, metadata !15, metadata !223, metadata !17, metadata !73, metadata !6}
!223 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ulong"}
!224 = metadata !{null, metadata !22, metadata !23, metadata !225, metadata !25, metadata !86, metadata !6}
!225 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<23, false> &", metadata !"uint"}
!226 = metadata !{null, metadata !22, metadata !23, metadata !227, metadata !25, metadata !76, metadata !6}
!227 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<23, false> &", metadata !"const ap_int_base<32, false> &"}
!228 = metadata !{null, metadata !22, metadata !23, metadata !229, metadata !25, metadata !76, metadata !6}
!229 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<23, false> &"}
!230 = metadata !{null, metadata !14, metadata !15, metadata !231, metadata !17, metadata !73, metadata !6}
!231 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<24, true> &"}
!232 = metadata !{null, metadata !22, metadata !23, metadata !233, metadata !25, metadata !76, metadata !6}
!233 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"uint"}
!234 = metadata !{null, metadata !14, metadata !15, metadata !192, metadata !17, metadata !83, metadata !6}
!235 = metadata !{null, metadata !57, metadata !15, metadata !236, metadata !17, metadata !237, metadata !6}
!236 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t*"}
!237 = metadata !{metadata !"kernel_arg_name", metadata !"mask_table"}
!238 = metadata !{null, metadata !22, metadata !23, metadata !239, metadata !25, metadata !86, metadata !6}
!239 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &", metadata !"ap_ulong"}
!240 = metadata !{null, metadata !22, metadata !23, metadata !241, metadata !25, metadata !76, metadata !6}
!241 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<52, false> &", metadata !"const ap_int_base<64, false> &"}
!242 = metadata !{null, metadata !22, metadata !23, metadata !243, metadata !25, metadata !76, metadata !6}
!243 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"uint"}
!244 = metadata !{null, metadata !57, metadata !15, metadata !245, metadata !17, metadata !237, metadata !6}
!245 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t*"}
!246 = metadata !{null, metadata !247, metadata !9, metadata !248, metadata !11, metadata !249, metadata !6}
!247 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!248 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<long long>::is_signed, _Bool>::type"}
!249 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"detect_overflow", metadata !"dummy"}
!250 = metadata !{null, metadata !14, metadata !15, metadata !251, metadata !17, metadata !252, metadata !6}
!251 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool"}
!252 = metadata !{metadata !"kernel_arg_name", metadata !"Cnative"}
!253 = metadata !{null, metadata !14, metadata !15, metadata !254, metadata !17, metadata !73, metadata !6}
!254 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<64, 64, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!255 = metadata !{null, metadata !14, metadata !15, metadata !256, metadata !17, metadata !73, metadata !6}
!256 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<65, 65, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!257 = metadata !{null, metadata !14, metadata !15, metadata !258, metadata !17, metadata !73, metadata !6}
!258 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<64, 64, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!259 = metadata !{null, metadata !14, metadata !15, metadata !260, metadata !17, metadata !73, metadata !6}
!260 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<64, 64, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!261 = metadata !{null, metadata !100, metadata !23, metadata !262, metadata !25, metadata !135, metadata !6}
!262 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, true>*", metadata !"int"}
!263 = metadata !{null, metadata !22, metadata !23, metadata !264, metadata !25, metadata !86, metadata !6}
!264 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 65, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &", metadata !"int"}
!265 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !266, metadata !6}
!266 = metadata !{metadata !"kernel_arg_name", metadata !"i_op"}
!267 = metadata !{null, metadata !14, metadata !15, metadata !268, metadata !17, metadata !83, metadata !6}
!268 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!269 = metadata !{null, metadata !14, metadata !15, metadata !270, metadata !17, metadata !73, metadata !6}
!270 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 65, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &"}
!271 = metadata !{null, metadata !14, metadata !15, metadata !272, metadata !17, metadata !73, metadata !6}
!272 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<87, 87, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!273 = metadata !{null, metadata !14, metadata !15, metadata !274, metadata !17, metadata !73, metadata !6}
!274 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<87, 87, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!275 = metadata !{null, metadata !276, metadata !2, metadata !277, metadata !278, metadata !279, metadata !6}
!276 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!277 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool"}
!278 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!279 = metadata !{metadata !"kernel_arg_name", metadata !"underflow", metadata !"overflow", metadata !"lD", metadata !"sign"}
!280 = metadata !{null, metadata !22, metadata !23, metadata !281, metadata !25, metadata !76, metadata !6}
!281 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<87, false> &", metadata !"int"}
!282 = metadata !{null, metadata !14, metadata !15, metadata !283, metadata !17, metadata !83, metadata !6}
!283 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<87, false> &"}
!284 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !285, metadata !6}
!285 = metadata !{metadata !"kernel_arg_name", metadata !"sh"}
!286 = metadata !{null, metadata !14, metadata !15, metadata !287, metadata !17, metadata !73, metadata !6}
!287 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<110, 87, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!288 = metadata !{null, metadata !14, metadata !15, metadata !197, metadata !17, metadata !132, metadata !6}
!289 = metadata !{null, metadata !100, metadata !23, metadata !290, metadata !25, metadata !135, metadata !6}
!290 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<24, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!291 = metadata !{null, metadata !110, metadata !9, metadata !292, metadata !11, metadata !112, metadata !6}
!292 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<24, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!293 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !62, metadata !6}
!294 = metadata !{null, metadata !14, metadata !15, metadata !72, metadata !17, metadata !295, metadata !6}
!295 = metadata !{metadata !"kernel_arg_name", metadata !"b"}
!296 = metadata !{null, metadata !14, metadata !15, metadata !268, metadata !17, metadata !73, metadata !6}
!297 = metadata !{null, metadata !14, metadata !15, metadata !298, metadata !17, metadata !73, metadata !6}
!298 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<24, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!299 = metadata !{null, metadata !14, metadata !15, metadata !300, metadata !17, metadata !73, metadata !6}
!300 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<24, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!301 = metadata !{null, metadata !247, metadata !9, metadata !302, metadata !11, metadata !249, metadata !6}
!302 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<long>::is_signed, _Bool>::type"}
!303 = metadata !{null, metadata !14, metadata !15, metadata !304, metadata !17, metadata !73, metadata !6}
!304 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!305 = metadata !{null, metadata !14, metadata !15, metadata !306, metadata !17, metadata !73, metadata !6}
!306 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<33, 33, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!307 = metadata !{null, metadata !14, metadata !15, metadata !308, metadata !17, metadata !73, metadata !6}
!308 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<32, 32, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!309 = metadata !{null, metadata !14, metadata !15, metadata !310, metadata !17, metadata !73, metadata !6}
!310 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<32, 32, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!311 = metadata !{null, metadata !100, metadata !23, metadata !312, metadata !25, metadata !135, metadata !6}
!312 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<32, true>*", metadata !"int"}
!313 = metadata !{null, metadata !22, metadata !23, metadata !314, metadata !25, metadata !86, metadata !6}
!314 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 33, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &", metadata !"int"}
!315 = metadata !{null, metadata !14, metadata !15, metadata !316, metadata !17, metadata !73, metadata !6}
!316 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 33, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &"}
!317 = metadata !{null, metadata !14, metadata !15, metadata !318, metadata !17, metadata !73, metadata !6}
!318 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<55, 55, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!319 = metadata !{null, metadata !14, metadata !15, metadata !320, metadata !17, metadata !73, metadata !6}
!320 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<55, 55, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!321 = metadata !{null, metadata !22, metadata !23, metadata !322, metadata !25, metadata !76, metadata !6}
!322 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, false> &", metadata !"int"}
!323 = metadata !{null, metadata !14, metadata !15, metadata !324, metadata !17, metadata !83, metadata !6}
!324 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, false> &"}
!325 = metadata !{null, metadata !14, metadata !15, metadata !326, metadata !17, metadata !73, metadata !6}
!326 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<78, 55, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!327 = metadata !{null, metadata !247, metadata !9, metadata !328, metadata !11, metadata !249, metadata !6}
!328 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<long long>::is_signed, _Bool>::type"}
!329 = metadata !{null, metadata !14, metadata !15, metadata !330, metadata !17, metadata !73, metadata !6}
!330 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<116, 116, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!331 = metadata !{null, metadata !14, metadata !15, metadata !332, metadata !17, metadata !73, metadata !6}
!332 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<116, 116, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!333 = metadata !{null, metadata !22, metadata !23, metadata !334, metadata !25, metadata !76, metadata !6}
!334 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<116, false> &", metadata !"int"}
!335 = metadata !{null, metadata !14, metadata !15, metadata !336, metadata !17, metadata !83, metadata !6}
!336 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<116, false> &"}
!337 = metadata !{null, metadata !14, metadata !15, metadata !338, metadata !17, metadata !73, metadata !6}
!338 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<168, 116, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!339 = metadata !{null, metadata !100, metadata !23, metadata !340, metadata !25, metadata !135, metadata !6}
!340 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<53, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!341 = metadata !{null, metadata !110, metadata !9, metadata !342, metadata !11, metadata !112, metadata !6}
!342 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<53, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!343 = metadata !{null, metadata !14, metadata !15, metadata !344, metadata !17, metadata !73, metadata !6}
!344 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<53, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!345 = metadata !{null, metadata !14, metadata !15, metadata !346, metadata !17, metadata !73, metadata !6}
!346 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<53, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!347 = metadata !{null, metadata !247, metadata !9, metadata !348, metadata !11, metadata !249, metadata !6}
!348 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<long>::is_signed, _Bool>::type"}
!349 = metadata !{null, metadata !14, metadata !15, metadata !350, metadata !17, metadata !73, metadata !6}
!350 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<84, 84, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!351 = metadata !{null, metadata !14, metadata !15, metadata !352, metadata !17, metadata !73, metadata !6}
!352 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<84, 84, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!353 = metadata !{null, metadata !22, metadata !23, metadata !354, metadata !25, metadata !76, metadata !6}
!354 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<84, false> &", metadata !"int"}
!355 = metadata !{null, metadata !14, metadata !15, metadata !356, metadata !17, metadata !83, metadata !6}
!356 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<84, false> &"}
!357 = metadata !{null, metadata !14, metadata !15, metadata !358, metadata !17, metadata !73, metadata !6}
!358 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<136, 84, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!359 = metadata !{null, metadata !22, metadata !23, metadata !360, metadata !25, metadata !86, metadata !6}
!360 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"ap_ulong"}
!361 = metadata !{null, metadata !22, metadata !23, metadata !362, metadata !25, metadata !76, metadata !6}
!362 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<64, false> &"}
!363 = metadata !{null, metadata !14, metadata !15, metadata !364, metadata !17, metadata !73, metadata !6}
!364 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, false> &"}
!365 = metadata !{null, metadata !14, metadata !15, metadata !366, metadata !17, metadata !213, metadata !6}
!366 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<64>"}
!367 = metadata !{null, metadata !14, metadata !15, metadata !368, metadata !17, metadata !216, metadata !6}
!368 = metadata !{metadata !"kernel_arg_type", metadata !"const class fp_struct<double> &"}
!369 = metadata !{null, metadata !22, metadata !23, metadata !370, metadata !25, metadata !76, metadata !6}
!370 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"int"}
!371 = metadata !{null, metadata !22, metadata !23, metadata !372, metadata !25, metadata !373, metadata !6}
!372 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_int_base<23, false> &"}
!373 = metadata !{metadata !"kernel_arg_name", metadata !"i_op", metadata !"op"}
!374 = metadata !{null, metadata !22, metadata !23, metadata !375, metadata !25, metadata !76, metadata !6}
!375 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<23, false> &"}
!376 = metadata !{null, metadata !22, metadata !23, metadata !377, metadata !25, metadata !373, metadata !6}
!377 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ulong", metadata !"const ap_int_base<52, false> &"}
!378 = metadata !{null, metadata !22, metadata !23, metadata !379, metadata !25, metadata !76, metadata !6}
!379 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<52, false> &"}
!380 = metadata !{null, metadata !30, metadata !9, metadata !34, metadata !11, metadata !381, metadata !6}
!381 = metadata !{metadata !"kernel_arg_name", metadata !"t_in", metadata !"s", metadata !"c"}
!382 = metadata !{null, metadata !14, metadata !15, metadata !80, metadata !17, metadata !115, metadata !6}
!383 = metadata !{null, metadata !100, metadata !23, metadata !384, metadata !25, metadata !135, metadata !6}
!384 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, false>*", metadata !"int"}
!385 = metadata !{null, metadata !14, metadata !15, metadata !386, metadata !17, metadata !73, metadata !6}
!386 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<3> &"}
!387 = metadata !{null, metadata !22, metadata !23, metadata !388, metadata !25, metadata !76, metadata !6}
!388 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<8, true> &"}
!389 = metadata !{null, metadata !14, metadata !15, metadata !390, metadata !17, metadata !73, metadata !6}
!390 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, true> &"}
!391 = metadata !{null, metadata !14, metadata !15, metadata !392, metadata !17, metadata !83, metadata !6}
!392 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!393 = metadata !{null, metadata !14, metadata !15, metadata !394, metadata !17, metadata !83, metadata !6}
!394 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!395 = metadata !{null, metadata !14, metadata !15, metadata !394, metadata !17, metadata !73, metadata !6}
!396 = metadata !{null, metadata !14, metadata !15, metadata !397, metadata !17, metadata !73, metadata !6}
!397 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!398 = metadata !{null, metadata !14, metadata !15, metadata !399, metadata !17, metadata !73, metadata !6}
!399 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<64, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!400 = metadata !{null, metadata !14, metadata !15, metadata !401, metadata !17, metadata !83, metadata !6}
!401 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<13, -2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!402 = metadata !{null, metadata !14, metadata !15, metadata !403, metadata !17, metadata !73, metadata !6}
!403 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<30, -16, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!404 = metadata !{null, metadata !14, metadata !15, metadata !405, metadata !17, metadata !83, metadata !6}
!405 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<21, -1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!406 = metadata !{null, metadata !14, metadata !15, metadata !407, metadata !17, metadata !73, metadata !6}
!407 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<38, -8, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!408 = metadata !{null, metadata !14, metadata !15, metadata !409, metadata !17, metadata !73, metadata !6}
!409 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<30, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!410 = metadata !{null, metadata !14, metadata !15, metadata !411, metadata !17, metadata !73, metadata !6}
!411 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<30, 1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!412 = metadata !{null, metadata !247, metadata !9, metadata !413, metadata !11, metadata !414, metadata !6}
!413 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<31, 1>", metadata !"float &", metadata !"int"}
!414 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"result", metadata !"prescale"}
!415 = metadata !{null, metadata !22, metadata !23, metadata !416, metadata !25, metadata !86, metadata !6}
!416 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &", metadata !"int"}
!417 = metadata !{null, metadata !14, metadata !15, metadata !418, metadata !17, metadata !73, metadata !6}
!418 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<31, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!419 = metadata !{null, metadata !14, metadata !15, metadata !420, metadata !17, metadata !73, metadata !6}
!420 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!421 = metadata !{null, metadata !14, metadata !15, metadata !422, metadata !17, metadata !423, metadata !6}
!422 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<1 + SIG_BITS, 1>"}
!423 = metadata !{metadata !"kernel_arg_name", metadata !"mantissa"}
!424 = metadata !{null, metadata !110, metadata !9, metadata !425, metadata !11, metadata !112, metadata !6}
!425 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<23, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!426 = metadata !{null, metadata !14, metadata !15, metadata !427, metadata !17, metadata !73, metadata !6}
!427 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<23, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!428 = metadata !{null, metadata !14, metadata !15, metadata !427, metadata !17, metadata !115, metadata !6}
!429 = metadata !{null, metadata !110, metadata !9, metadata !430, metadata !11, metadata !112, metadata !6}
!430 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<31, 1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!431 = metadata !{null, metadata !14, metadata !15, metadata !432, metadata !17, metadata !115, metadata !6}
!432 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<31, 1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!433 = metadata !{null, metadata !14, metadata !15, metadata !434, metadata !17, metadata !115, metadata !6}
!434 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<31, false> &"}
!435 = metadata !{null, metadata !14, metadata !15, metadata !436, metadata !17, metadata !73, metadata !6}
!436 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<31, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!437 = metadata !{null, metadata !110, metadata !9, metadata !438, metadata !11, metadata !112, metadata !6}
!438 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<31, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!439 = metadata !{null, metadata !14, metadata !15, metadata !440, metadata !17, metadata !115, metadata !6}
!440 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<31, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!441 = metadata !{null, metadata !14, metadata !15, metadata !434, metadata !17, metadata !73, metadata !6}
!442 = metadata !{null, metadata !14, metadata !15, metadata !420, metadata !17, metadata !83, metadata !6}
!443 = metadata !{null, metadata !14, metadata !15, metadata !444, metadata !17, metadata !73, metadata !6}
!444 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 2, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!445 = metadata !{null, metadata !22, metadata !23, metadata !446, metadata !25, metadata !373, metadata !6}
!446 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_fixed_base<33, 3, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!447 = metadata !{null, metadata !14, metadata !15, metadata !448, metadata !17, metadata !83, metadata !6}
!448 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<33, 3, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!449 = metadata !{null, metadata !14, metadata !15, metadata !448, metadata !17, metadata !73, metadata !6}
!450 = metadata !{null, metadata !14, metadata !15, metadata !451, metadata !17, metadata !73, metadata !6}
!451 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<63, 33, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!452 = metadata !{null, metadata !14, metadata !15, metadata !453, metadata !17, metadata !83, metadata !6}
!453 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<15, 0, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!454 = metadata !{null, metadata !14, metadata !15, metadata !455, metadata !17, metadata !73, metadata !6}
!455 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, -14, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!456 = metadata !{null, metadata !14, metadata !15, metadata !457, metadata !17, metadata !83, metadata !6}
!457 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<23, 1, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!458 = metadata !{null, metadata !14, metadata !15, metadata !459, metadata !17, metadata !73, metadata !6}
!459 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<40, -6, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!460 = metadata !{null, metadata !14, metadata !15, metadata !461, metadata !17, metadata !73, metadata !6}
!461 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<29, 0, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!462 = metadata !{null, metadata !14, metadata !15, metadata !463, metadata !17, metadata !73, metadata !6}
!463 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<29, 0, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!464 = metadata !{null, metadata !14, metadata !15, metadata !465, metadata !17, metadata !83, metadata !6}
!465 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<9, -7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!466 = metadata !{null, metadata !14, metadata !15, metadata !467, metadata !17, metadata !73, metadata !6}
!467 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<18, -14, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!468 = metadata !{null, metadata !14, metadata !15, metadata !469, metadata !17, metadata !73, metadata !6}
!469 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<17, -7, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!470 = metadata !{null, metadata !14, metadata !15, metadata !471, metadata !17, metadata !73, metadata !6}
!471 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<17, -7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!472 = metadata !{null, metadata !14, metadata !15, metadata !473, metadata !17, metadata !73, metadata !6}
!473 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<31, 0, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!474 = metadata !{null, metadata !14, metadata !15, metadata !392, metadata !17, metadata !73, metadata !6}
!475 = metadata !{null, metadata !110, metadata !9, metadata !476, metadata !11, metadata !112, metadata !6}
!476 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<31, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!477 = metadata !{null, metadata !14, metadata !15, metadata !478, metadata !17, metadata !73, metadata !6}
!478 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<31, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!479 = metadata !{null, metadata !14, metadata !15, metadata !478, metadata !17, metadata !115, metadata !6}
!480 = metadata !{null, metadata !481, metadata !482, metadata !483, metadata !484, metadata !485, metadata !6}
!481 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0}
!482 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!483 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"ap_uint<3> &", metadata !"ap_ufixed<31, 0> &", metadata !"ap_ufixed<31, 0> &", metadata !"ap_int<fp_struct<float>::EXP_BITS> &"}
!484 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!485 = metadata !{metadata !"kernel_arg_name", metadata !"din", metadata !"k", metadata !"dout", metadata !"Mx", metadata !"Ex"}
!486 = metadata !{null, metadata !14, metadata !15, metadata !390, metadata !17, metadata !83, metadata !6}
!487 = metadata !{null, metadata !14, metadata !15, metadata !488, metadata !17, metadata !83, metadata !6}
!488 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<5, false> &"}
!489 = metadata !{null, metadata !14, metadata !15, metadata !197, metadata !17, metadata !285, metadata !6}
!490 = metadata !{null, metadata !14, metadata !15, metadata !491, metadata !17, metadata !73, metadata !6}
!491 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<49, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!492 = metadata !{null, metadata !247, metadata !9, metadata !493, metadata !11, metadata !494, metadata !6}
!493 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool", metadata !"_Bool", metadata !"_Bool"}
!494 = metadata !{metadata !"kernel_arg_name", metadata !"qb", metadata !"r", metadata !"s"}
!495 = metadata !{null, metadata !14, metadata !15, metadata !496, metadata !17, metadata !73, metadata !6}
!496 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<31, 0, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!497 = metadata !{null, metadata !14, metadata !15, metadata !498, metadata !17, metadata !73, metadata !6}
!498 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 0, false, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!499 = metadata !{null, metadata !14, metadata !15, metadata !500, metadata !17, metadata !18, metadata !6}
!500 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<49, 0>"}
!501 = metadata !{null, metadata !110, metadata !9, metadata !502, metadata !11, metadata !112, metadata !6}
!502 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<19, false>*", metadata !"int", metadata !"int"}
!503 = metadata !{null, metadata !14, metadata !15, metadata !504, metadata !17, metadata !115, metadata !6}
!504 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<19, false> &"}
!505 = metadata !{null, metadata !14, metadata !15, metadata !504, metadata !17, metadata !117, metadata !6}
!506 = metadata !{null, metadata !14, metadata !15, metadata !507, metadata !17, metadata !115, metadata !6}
!507 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<19, false> &"}
!508 = metadata !{null, metadata !14, metadata !15, metadata !507, metadata !17, metadata !73, metadata !6}
!509 = metadata !{null, metadata !100, metadata !23, metadata !510, metadata !25, metadata !135, metadata !6}
!510 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<19, false>*", metadata !"int"}
!511 = metadata !{null, metadata !110, metadata !9, metadata !512, metadata !11, metadata !112, metadata !6}
!512 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<49, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!513 = metadata !{null, metadata !14, metadata !15, metadata !514, metadata !17, metadata !115, metadata !6}
!514 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<49, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!515 = metadata !{null, metadata !14, metadata !15, metadata !516, metadata !17, metadata !115, metadata !6}
!516 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<49, false> &"}
!517 = metadata !{null, metadata !14, metadata !15, metadata !516, metadata !17, metadata !73, metadata !6}
!518 = metadata !{null, metadata !22, metadata !23, metadata !519, metadata !25, metadata !373, metadata !6}
!519 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"const ap_fixed_base<49, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!520 = metadata !{null, metadata !14, metadata !15, metadata !491, metadata !17, metadata !83, metadata !6}
!521 = metadata !{null, metadata !14, metadata !15, metadata !522, metadata !17, metadata !73, metadata !6}
!522 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<82, 33, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!523 = metadata !{null, metadata !14, metadata !15, metadata !524, metadata !17, metadata !73, metadata !6}
!524 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<49, 0, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!525 = metadata !{null, metadata !100, metadata !23, metadata !526, metadata !25, metadata !135, metadata !6}
!526 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<3, false>*", metadata !"int"}
!527 = metadata !{null, metadata !22, metadata !23, metadata !528, metadata !25, metadata !76, metadata !6}
!528 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<3, false> &", metadata !"int"}
!529 = metadata !{null, metadata !14, metadata !15, metadata !530, metadata !17, metadata !73, metadata !6}
!530 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<95, 27, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!531 = metadata !{null, metadata !14, metadata !15, metadata !532, metadata !17, metadata !73, metadata !6}
!532 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<95, 27, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!533 = metadata !{null, metadata !14, metadata !15, metadata !386, metadata !17, metadata !83, metadata !6}
!534 = metadata !{null, metadata !110, metadata !9, metadata !535, metadata !11, metadata !112, metadata !6}
!535 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<95, false>*", metadata !"int", metadata !"int"}
!536 = metadata !{null, metadata !14, metadata !15, metadata !537, metadata !17, metadata !115, metadata !6}
!537 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<95, false> &"}
!538 = metadata !{null, metadata !14, metadata !15, metadata !537, metadata !17, metadata !117, metadata !6}
!539 = metadata !{null, metadata !14, metadata !15, metadata !540, metadata !17, metadata !115, metadata !6}
!540 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<95, false> &"}
!541 = metadata !{null, metadata !110, metadata !9, metadata !542, metadata !11, metadata !112, metadata !6}
!542 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<95, 27, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!543 = metadata !{null, metadata !247, metadata !9, metadata !544, metadata !11, metadata !545, metadata !6}
!544 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<71>", metadata !"ap_uint<24>", metadata !"ap_uint<71 + 24> &"}
!545 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"b", metadata !"m"}
!546 = metadata !{null, metadata !14, metadata !15, metadata !547, metadata !17, metadata !115, metadata !6}
!547 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<41, false> &"}
!548 = metadata !{null, metadata !14, metadata !15, metadata !547, metadata !17, metadata !73, metadata !6}
!549 = metadata !{null, metadata !110, metadata !9, metadata !550, metadata !11, metadata !112, metadata !6}
!550 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<41, false>*", metadata !"int", metadata !"int"}
!551 = metadata !{null, metadata !14, metadata !15, metadata !552, metadata !17, metadata !115, metadata !6}
!552 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<41, false> &"}
!553 = metadata !{null, metadata !14, metadata !15, metadata !552, metadata !17, metadata !117, metadata !6}
!554 = metadata !{null, metadata !14, metadata !15, metadata !547, metadata !17, metadata !83, metadata !6}
!555 = metadata !{null, metadata !22, metadata !23, metadata !556, metadata !25, metadata !76, metadata !6}
!556 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<41, false> &", metadata !"int"}
!557 = metadata !{null, metadata !110, metadata !9, metadata !558, metadata !11, metadata !112, metadata !6}
!558 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<71, false>*", metadata !"int", metadata !"int"}
!559 = metadata !{null, metadata !22, metadata !23, metadata !560, metadata !25, metadata !561, metadata !6}
!560 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<71, false> &", metadata !"const ap_int_base<24, false> &"}
!561 = metadata !{metadata !"kernel_arg_name", metadata !"op1", metadata !"op2"}
!562 = metadata !{null, metadata !14, metadata !15, metadata !563, metadata !17, metadata !117, metadata !6}
!563 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<71, false> &"}
!564 = metadata !{null, metadata !22, metadata !23, metadata !565, metadata !25, metadata !76, metadata !6}
!565 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<71, false> &", metadata !"const ap_int_base<24, false> &"}
!566 = metadata !{null, metadata !14, metadata !15, metadata !567, metadata !17, metadata !73, metadata !6}
!567 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<24, false> &"}
!568 = metadata !{null, metadata !14, metadata !15, metadata !569, metadata !17, metadata !73, metadata !6}
!569 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<71, false> &"}
!570 = metadata !{null, metadata !14, metadata !15, metadata !540, metadata !17, metadata !73, metadata !6}
!571 = metadata !{null, metadata !14, metadata !15, metadata !572, metadata !17, metadata !83, metadata !6}
!572 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<41> &"}
!573 = metadata !{null, metadata !22, metadata !23, metadata !574, metadata !25, metadata !575, metadata !6}
!574 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"float"}
!575 = metadata !{metadata !"kernel_arg_name", metadata !"exp", metadata !"dummy"}
!576 = metadata !{null, metadata !110, metadata !9, metadata !577, metadata !11, metadata !112, metadata !6}
!577 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<100, false>*", metadata !"int", metadata !"int"}
!578 = metadata !{null, metadata !110, metadata !9, metadata !579, metadata !11, metadata !112, metadata !6}
!579 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<9, true>*", metadata !"int", metadata !"int"}
!580 = metadata !{null, metadata !14, metadata !15, metadata !581, metadata !17, metadata !117, metadata !6}
!581 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<9, true> &"}
!582 = metadata !{null, metadata !14, metadata !15, metadata !583, metadata !17, metadata !83, metadata !6}
!583 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<4, false> &"}
!584 = metadata !{null, metadata !14, metadata !15, metadata !585, metadata !17, metadata !117, metadata !6}
!585 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<100, false> &"}
!586 = metadata !{null, metadata !22, metadata !23, metadata !587, metadata !25, metadata !76, metadata !6}
!587 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<9, true> &", metadata !"int"}
!588 = metadata !{null, metadata !14, metadata !15, metadata !589, metadata !17, metadata !83, metadata !6}
!589 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<71> &"}
!590 = metadata !{null, metadata !100, metadata !23, metadata !591, metadata !25, metadata !135, metadata !6}
!591 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<24, false>*", metadata !"int"}
!592 = metadata !{null, metadata !110, metadata !9, metadata !593, metadata !11, metadata !112, metadata !6}
!593 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<24, false>*", metadata !"int", metadata !"int"}
!594 = metadata !{null, metadata !14, metadata !15, metadata !595, metadata !17, metadata !83, metadata !6}
!595 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<8> &"}
!596 = metadata !{null, metadata !30, metadata !9, metadata !31, metadata !11, metadata !597, metadata !6}
!597 = metadata !{metadata !"kernel_arg_name", metadata !"t_in", metadata !"s_out", metadata !"c_out"}
!598 = metadata !{null, metadata !247, metadata !9, metadata !599, metadata !11, metadata !597, metadata !6}
!599 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"double &", metadata !"double &"}
!600 = metadata !{null, metadata !14, metadata !15, metadata !601, metadata !17, metadata !73, metadata !6}
!601 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<78> &"}
!602 = metadata !{null, metadata !14, metadata !15, metadata !603, metadata !17, metadata !604, metadata !6}
!603 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<78>"}
!604 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!605 = metadata !{null, metadata !22, metadata !23, metadata !606, metadata !25, metadata !76, metadata !6}
!606 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, false> &", metadata !"int"}
!607 = metadata !{null, metadata !14, metadata !15, metadata !608, metadata !17, metadata !115, metadata !6}
!608 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<78, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!609 = metadata !{null, metadata !14, metadata !15, metadata !610, metadata !17, metadata !115, metadata !6}
!610 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, false> &"}
!611 = metadata !{null, metadata !14, metadata !15, metadata !610, metadata !17, metadata !73, metadata !6}
!612 = metadata !{null, metadata !14, metadata !15, metadata !613, metadata !17, metadata !73, metadata !6}
!613 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<78, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!614 = metadata !{null, metadata !14, metadata !15, metadata !615, metadata !17, metadata !73, metadata !6}
!615 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<78, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!616 = metadata !{null, metadata !110, metadata !9, metadata !617, metadata !11, metadata !112, metadata !6}
!617 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<78, false>*", metadata !"int", metadata !"int"}
!618 = metadata !{null, metadata !14, metadata !15, metadata !619, metadata !17, metadata !115, metadata !6}
!619 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<78, false> &"}
!620 = metadata !{null, metadata !14, metadata !15, metadata !619, metadata !17, metadata !117, metadata !6}
!621 = metadata !{null, metadata !110, metadata !9, metadata !622, metadata !11, metadata !112, metadata !6}
!622 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<78, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!623 = metadata !{null, metadata !22, metadata !23, metadata !624, metadata !25, metadata !76, metadata !6}
!624 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, false> &", metadata !"const ap_int_base<78, true> &"}
!625 = metadata !{null, metadata !14, metadata !15, metadata !626, metadata !17, metadata !73, metadata !6}
!626 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, true> &"}
!627 = metadata !{null, metadata !14, metadata !15, metadata !628, metadata !17, metadata !73, metadata !6}
!628 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<80, true> &"}
!629 = metadata !{null, metadata !22, metadata !23, metadata !630, metadata !25, metadata !76, metadata !6}
!630 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, true> &", metadata !"int"}
!631 = metadata !{null, metadata !14, metadata !15, metadata !632, metadata !17, metadata !73, metadata !6}
!632 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<79, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!633 = metadata !{null, metadata !14, metadata !15, metadata !632, metadata !17, metadata !115, metadata !6}
!634 = metadata !{null, metadata !247, metadata !9, metadata !635, metadata !11, metadata !636, metadata !6}
!635 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed<79, 3> &", metadata !"ap_fixed<79, 3> &", metadata !"ap_fixed<79, 3> &"}
!636 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"z"}
!637 = metadata !{null, metadata !247, metadata !9, metadata !638, metadata !11, metadata !639, metadata !6}
!638 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<79, 3, 5, 3, 0>", metadata !"struct ap_fixed<79, 3, 0, 3, 0>", metadata !"struct ap_uint<1>"}
!639 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"b", metadata !"add"}
!640 = metadata !{null, metadata !14, metadata !15, metadata !641, metadata !17, metadata !83, metadata !6}
!641 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<79, 3, true, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!642 = metadata !{null, metadata !14, metadata !15, metadata !641, metadata !17, metadata !73, metadata !6}
!643 = metadata !{null, metadata !14, metadata !15, metadata !644, metadata !17, metadata !73, metadata !6}
!644 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<79, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!645 = metadata !{null, metadata !14, metadata !15, metadata !646, metadata !17, metadata !73, metadata !6}
!646 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<80, 4, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!647 = metadata !{null, metadata !14, metadata !15, metadata !648, metadata !17, metadata !73, metadata !6}
!648 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<80, 4, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!649 = metadata !{null, metadata !14, metadata !15, metadata !650, metadata !17, metadata !73, metadata !6}
!650 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<128, 2, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!651 = metadata !{null, metadata !14, metadata !15, metadata !652, metadata !17, metadata !73, metadata !6}
!652 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<128, 2, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!653 = metadata !{null, metadata !14, metadata !15, metadata !654, metadata !17, metadata !73, metadata !6}
!654 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<79, 3, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!655 = metadata !{null, metadata !247, metadata !9, metadata !656, metadata !11, metadata !639, metadata !6}
!656 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<79, 3, 5, 3, 0>", metadata !"struct ap_fixed<79, 3, 5, 3, 0>", metadata !"_Bool"}
!657 = metadata !{null, metadata !14, metadata !15, metadata !644, metadata !17, metadata !83, metadata !6}
!658 = metadata !{null, metadata !247, metadata !9, metadata !659, metadata !11, metadata !639, metadata !6}
!659 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<79, 3, 5, 3, 0>", metadata !"struct ap_fixed<79, 3, 5, 3, 0>", metadata !"struct ap_uint<1>"}
!660 = metadata !{null, metadata !100, metadata !23, metadata !661, metadata !25, metadata !135, metadata !6}
!661 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<79, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!662 = metadata !{null, metadata !14, metadata !15, metadata !663, metadata !17, metadata !73, metadata !6}
!663 = metadata !{metadata !"kernel_arg_type", metadata !"const af_bit_ref<79, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!664 = metadata !{null, metadata !14, metadata !15, metadata !663, metadata !17, metadata !115, metadata !6}
!665 = metadata !{null, metadata !14, metadata !15, metadata !626, metadata !17, metadata !115, metadata !6}
!666 = metadata !{null, metadata !14, metadata !15, metadata !667, metadata !17, metadata !73, metadata !6}
!667 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<79, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!668 = metadata !{null, metadata !22, metadata !23, metadata !669, metadata !25, metadata !76, metadata !6}
!669 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<100, false> &", metadata !"int"}
!670 = metadata !{null, metadata !22, metadata !23, metadata !671, metadata !25, metadata !76, metadata !6}
!671 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<32, true> &"}
!672 = metadata !{null, metadata !14, metadata !15, metadata !673, metadata !17, metadata !115, metadata !6}
!673 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<100, false> &"}
!674 = metadata !{null, metadata !14, metadata !15, metadata !673, metadata !17, metadata !73, metadata !6}
!675 = metadata !{null, metadata !110, metadata !9, metadata !676, metadata !11, metadata !112, metadata !6}
!676 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<79, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!677 = metadata !{null, metadata !14, metadata !15, metadata !601, metadata !17, metadata !83, metadata !6}
!678 = metadata !{null, metadata !247, metadata !9, metadata !679, metadata !11, metadata !680, metadata !6}
!679 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"ap_uint<3> &", metadata !"ap_uint<78> &"}
!680 = metadata !{metadata !"kernel_arg_name", metadata !"din", metadata !"k", metadata !"dout"}
!681 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !604, metadata !6}
!682 = metadata !{null, metadata !22, metadata !23, metadata !683, metadata !25, metadata !76, metadata !6}
!683 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<78, false> &", metadata !"const ap_int_base<52, false> &"}
!684 = metadata !{null, metadata !110, metadata !9, metadata !685, metadata !11, metadata !112, metadata !6}
!685 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<79, false>*", metadata !"int", metadata !"int"}
!686 = metadata !{null, metadata !14, metadata !15, metadata !687, metadata !17, metadata !117, metadata !6}
!687 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<79, false> &"}
!688 = metadata !{null, metadata !22, metadata !23, metadata !689, metadata !25, metadata !76, metadata !6}
!689 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<79, false> &", metadata !"const ap_int_base<79, false> &"}
!690 = metadata !{null, metadata !14, metadata !15, metadata !691, metadata !17, metadata !73, metadata !6}
!691 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<79, false> &"}
!692 = metadata !{null, metadata !110, metadata !9, metadata !693, metadata !11, metadata !112, metadata !6}
!693 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<156, false>*", metadata !"int", metadata !"int"}
!694 = metadata !{null, metadata !14, metadata !15, metadata !695, metadata !17, metadata !117, metadata !6}
!695 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<156, false> &"}
!696 = metadata !{null, metadata !247, metadata !9, metadata !697, metadata !11, metadata !545, metadata !6}
!697 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<78>", metadata !"ap_uint<78>", metadata !"ap_uint<78 + 78> &"}
!698 = metadata !{null, metadata !14, metadata !15, metadata !699, metadata !17, metadata !73, metadata !6}
!699 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<188> &"}
!700 = metadata !{null, metadata !14, metadata !15, metadata !701, metadata !17, metadata !83, metadata !6}
!701 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<156> &"}
!702 = metadata !{null, metadata !247, metadata !9, metadata !703, metadata !11, metadata !545, metadata !6}
!703 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<94>", metadata !"ap_uint<94>", metadata !"ap_uint<2 * 94> &"}
!704 = metadata !{null, metadata !110, metadata !9, metadata !705, metadata !11, metadata !112, metadata !6}
!705 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<48, false>*", metadata !"int", metadata !"int"}
!706 = metadata !{null, metadata !14, metadata !15, metadata !707, metadata !17, metadata !115, metadata !6}
!707 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<48, false> &"}
!708 = metadata !{null, metadata !14, metadata !15, metadata !707, metadata !17, metadata !117, metadata !6}
!709 = metadata !{null, metadata !14, metadata !15, metadata !710, metadata !17, metadata !115, metadata !6}
!710 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, false> &"}
!711 = metadata !{null, metadata !14, metadata !15, metadata !710, metadata !17, metadata !73, metadata !6}
!712 = metadata !{null, metadata !110, metadata !9, metadata !713, metadata !11, metadata !112, metadata !6}
!713 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<188, false>*", metadata !"int", metadata !"int"}
!714 = metadata !{null, metadata !14, metadata !15, metadata !715, metadata !17, metadata !83, metadata !6}
!715 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<34, false> &"}
!716 = metadata !{null, metadata !22, metadata !23, metadata !717, metadata !25, metadata !76, metadata !6}
!717 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, false> &", metadata !"int"}
!718 = metadata !{null, metadata !14, metadata !15, metadata !719, metadata !17, metadata !73, metadata !6}
!719 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<34> &"}
!720 = metadata !{null, metadata !14, metadata !15, metadata !721, metadata !17, metadata !83, metadata !6}
!721 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<48> &"}
!722 = metadata !{null, metadata !110, metadata !9, metadata !723, metadata !11, metadata !112, metadata !6}
!723 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<94, false>*", metadata !"int", metadata !"int"}
!724 = metadata !{null, metadata !22, metadata !23, metadata !725, metadata !25, metadata !726, metadata !6}
!725 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<94, false> &", metadata !"const ap_range_ref<94, false> &"}
!726 = metadata !{metadata !"kernel_arg_name", metadata !"lhs", metadata !"rhs"}
!727 = metadata !{null, metadata !14, metadata !15, metadata !728, metadata !17, metadata !117, metadata !6}
!728 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<94, false> &"}
!729 = metadata !{null, metadata !22, metadata !23, metadata !730, metadata !25, metadata !76, metadata !6}
!730 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<94, false> &", metadata !"const ap_int_base<94, false> &"}
!731 = metadata !{null, metadata !14, metadata !15, metadata !732, metadata !17, metadata !73, metadata !6}
!732 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<94, false> &"}
!733 = metadata !{null, metadata !14, metadata !15, metadata !734, metadata !17, metadata !73, metadata !6}
!734 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<188, false> &"}
!735 = metadata !{null, metadata !14, metadata !15, metadata !719, metadata !17, metadata !83, metadata !6}
!736 = metadata !{null, metadata !14, metadata !15, metadata !737, metadata !17, metadata !73, metadata !6}
!737 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<78> &"}
!738 = metadata !{null, metadata !110, metadata !9, metadata !739, metadata !11, metadata !112, metadata !6}
!739 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<56, false>*", metadata !"int", metadata !"int"}
!740 = metadata !{null, metadata !14, metadata !15, metadata !741, metadata !17, metadata !117, metadata !6}
!741 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<56, false> &"}
!742 = metadata !{null, metadata !110, metadata !9, metadata !743, metadata !11, metadata !112, metadata !6}
!743 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<178, false>*", metadata !"int", metadata !"int"}
!744 = metadata !{null, metadata !14, metadata !15, metadata !745, metadata !17, metadata !117, metadata !6}
!745 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<178, false> &"}
!746 = metadata !{null, metadata !22, metadata !23, metadata !747, metadata !25, metadata !76, metadata !6}
!747 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<178, false> &", metadata !"int"}
!748 = metadata !{null, metadata !14, metadata !15, metadata !749, metadata !17, metadata !73, metadata !6}
!749 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<178, false> &"}
!750 = metadata !{null, metadata !14, metadata !15, metadata !751, metadata !17, metadata !83, metadata !6}
!751 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<56> &"}
!752 = metadata !{null, metadata !247, metadata !9, metadata !753, metadata !11, metadata !545, metadata !6}
!753 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<125>", metadata !"ap_uint<53>", metadata !"ap_uint<125 + 53> &"}
!754 = metadata !{null, metadata !14, metadata !15, metadata !755, metadata !17, metadata !115, metadata !6}
!755 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<70, false> &"}
!756 = metadata !{null, metadata !14, metadata !15, metadata !755, metadata !17, metadata !73, metadata !6}
!757 = metadata !{null, metadata !110, metadata !9, metadata !758, metadata !11, metadata !112, metadata !6}
!758 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<70, false>*", metadata !"int", metadata !"int"}
!759 = metadata !{null, metadata !14, metadata !15, metadata !760, metadata !17, metadata !115, metadata !6}
!760 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<70, false> &"}
!761 = metadata !{null, metadata !14, metadata !15, metadata !760, metadata !17, metadata !117, metadata !6}
!762 = metadata !{null, metadata !14, metadata !15, metadata !755, metadata !17, metadata !83, metadata !6}
!763 = metadata !{null, metadata !22, metadata !23, metadata !764, metadata !25, metadata !76, metadata !6}
!764 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<70, false> &", metadata !"int"}
!765 = metadata !{null, metadata !110, metadata !9, metadata !766, metadata !11, metadata !112, metadata !6}
!766 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<125, false>*", metadata !"int", metadata !"int"}
!767 = metadata !{null, metadata !22, metadata !23, metadata !768, metadata !25, metadata !561, metadata !6}
!768 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<125, false> &", metadata !"const ap_int_base<53, false> &"}
!769 = metadata !{null, metadata !14, metadata !15, metadata !770, metadata !17, metadata !117, metadata !6}
!770 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<125, false> &"}
!771 = metadata !{null, metadata !22, metadata !23, metadata !772, metadata !25, metadata !76, metadata !6}
!772 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<125, false> &", metadata !"const ap_int_base<53, false> &"}
!773 = metadata !{null, metadata !14, metadata !15, metadata !774, metadata !17, metadata !73, metadata !6}
!774 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<53, false> &"}
!775 = metadata !{null, metadata !14, metadata !15, metadata !776, metadata !17, metadata !73, metadata !6}
!776 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<125, false> &"}
!777 = metadata !{null, metadata !14, metadata !15, metadata !778, metadata !17, metadata !83, metadata !6}
!778 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<70> &"}
!779 = metadata !{null, metadata !22, metadata !23, metadata !780, metadata !25, metadata !575, metadata !6}
!780 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"double"}
!781 = metadata !{null, metadata !22, metadata !23, metadata !782, metadata !25, metadata !76, metadata !6}
!782 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<12, true> &", metadata !"int"}
!783 = metadata !{null, metadata !110, metadata !9, metadata !784, metadata !11, metadata !112, metadata !6}
!784 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<256, false>*", metadata !"int", metadata !"int"}
!785 = metadata !{null, metadata !14, metadata !15, metadata !786, metadata !17, metadata !117, metadata !6}
!786 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<12, true> &"}
!787 = metadata !{null, metadata !14, metadata !15, metadata !788, metadata !17, metadata !83, metadata !6}
!788 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<7, false> &"}
!789 = metadata !{null, metadata !14, metadata !15, metadata !790, metadata !17, metadata !117, metadata !6}
!790 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<256, false> &"}
!791 = metadata !{null, metadata !110, metadata !9, metadata !792, metadata !11, metadata !112, metadata !6}
!792 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<12, true>*", metadata !"int", metadata !"int"}
!793 = metadata !{null, metadata !14, metadata !15, metadata !794, metadata !17, metadata !83, metadata !6}
!794 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<125> &"}
!795 = metadata !{null, metadata !22, metadata !23, metadata !796, metadata !25, metadata !76, metadata !6}
!796 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<53, false> &", metadata !"int"}
!797 = metadata !{null, metadata !22, metadata !23, metadata !798, metadata !25, metadata !76, metadata !6}
!798 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<53, false> &", metadata !"const ap_int_base<52, false> &"}
!799 = metadata !{null, metadata !14, metadata !15, metadata !800, metadata !17, metadata !83, metadata !6}
!800 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<53> &"}
!801 = metadata !{null, metadata !14, metadata !15, metadata !802, metadata !17, metadata !117, metadata !6}
!802 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<400, false> &"}
!803 = metadata !{null, metadata !14, metadata !15, metadata !804, metadata !17, metadata !83, metadata !6}
!804 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<79> &"}
!805 = metadata !{null, metadata !110, metadata !9, metadata !806, metadata !11, metadata !112, metadata !6}
!806 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<400, false>*", metadata !"int", metadata !"int"}
!807 = metadata !{null, metadata !14, metadata !15, metadata !737, metadata !17, metadata !83, metadata !6}
!808 = metadata !{null, metadata !247, metadata !9, metadata !809, metadata !11, metadata !597, metadata !6}
!809 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"float &", metadata !"float &"}
!810 = metadata !{null, metadata !14, metadata !15, metadata !811, metadata !17, metadata !812, metadata !6}
!811 = metadata !{metadata !"kernel_arg_type", metadata !"uint32_t"}
!812 = metadata !{metadata !"kernel_arg_name", metadata !"i"}
!813 = metadata !{null, metadata !22, metadata !23, metadata !814, metadata !25, metadata !76, metadata !6}
!814 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<8, false> &"}
!815 = metadata !{null, metadata !22, metadata !23, metadata !587, metadata !25, metadata !86, metadata !6}
!816 = metadata !{null, metadata !22, metadata !23, metadata !817, metadata !25, metadata !76, metadata !6}
!817 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<9, true> &", metadata !"const ap_int_base<32, true> &"}
!818 = metadata !{null, metadata !14, metadata !15, metadata !819, metadata !17, metadata !73, metadata !6}
!819 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<9, true> &"}
!820 = metadata !{null, metadata !14, metadata !15, metadata !197, metadata !17, metadata !821, metadata !6}
!821 = metadata !{metadata !"kernel_arg_name", metadata !"pi"}
!822 = metadata !{null, metadata !22, metadata !23, metadata !823, metadata !25, metadata !76, metadata !6}
!823 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<8, true> &", metadata !"int"}
!824 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !96, metadata !6}
!825 = metadata !{null, metadata !247, metadata !9, metadata !826, metadata !11, metadata !636, metadata !6}
!826 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<34, 2, 5, 3, 0> &", metadata !"struct ap_fixed<34, 2, 5, 3, 0> &", metadata !"struct ap_fixed<34, 2, 5, 3, 0> &"}
!827 = metadata !{null, metadata !247, metadata !9, metadata !828, metadata !11, metadata !639, metadata !6}
!828 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<34, 2, 5, 3, 0>", metadata !"struct ap_fixed<34, 2, 5, 3, 0>", metadata !"struct ap_uint<1>"}
!829 = metadata !{null, metadata !14, metadata !15, metadata !830, metadata !17, metadata !83, metadata !6}
!830 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<34, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!831 = metadata !{null, metadata !14, metadata !15, metadata !830, metadata !17, metadata !73, metadata !6}
!832 = metadata !{null, metadata !14, metadata !15, metadata !833, metadata !17, metadata !73, metadata !6}
!833 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<35, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!834 = metadata !{null, metadata !14, metadata !15, metadata !835, metadata !17, metadata !73, metadata !6}
!835 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<35, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!836 = metadata !{null, metadata !14, metadata !15, metadata !837, metadata !17, metadata !73, metadata !6}
!837 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<128, 4, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!838 = metadata !{null, metadata !14, metadata !15, metadata !839, metadata !17, metadata !73, metadata !6}
!839 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<128, 4, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!840 = metadata !{null, metadata !247, metadata !9, metadata !841, metadata !11, metadata !639, metadata !6}
!841 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<34, 2, 5, 3, 0>", metadata !"struct ap_fixed<34, 2, 5, 3, 0>", metadata !"_Bool"}
!842 = metadata !{null, metadata !14, metadata !15, metadata !843, metadata !17, metadata !73, metadata !6}
!843 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<34, 2, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!844 = metadata !{null, metadata !100, metadata !23, metadata !845, metadata !25, metadata !135, metadata !6}
!845 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<34, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!846 = metadata !{null, metadata !14, metadata !15, metadata !847, metadata !17, metadata !73, metadata !6}
!847 = metadata !{metadata !"kernel_arg_type", metadata !"const af_bit_ref<34, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!848 = metadata !{null, metadata !14, metadata !15, metadata !847, metadata !17, metadata !115, metadata !6}
!849 = metadata !{null, metadata !14, metadata !15, metadata !850, metadata !17, metadata !73, metadata !6}
!850 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<35, 0, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!851 = metadata !{null, metadata !14, metadata !15, metadata !852, metadata !17, metadata !73, metadata !6}
!852 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<35, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!853 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !62, metadata !6}
!854 = metadata !{null, metadata !247, metadata !9, metadata !855, metadata !11, metadata !856, metadata !6}
!855 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"ap_uint<7 + 1> &", metadata !"ap_ufixed<fp_struct<float>::SIG_BITS + 12, 0> &"}
!856 = metadata !{metadata !"kernel_arg_name", metadata !"t_in", metadata !"k", metadata !"t_out"}
!857 = metadata !{null, metadata !14, metadata !15, metadata !858, metadata !17, metadata !73, metadata !6}
!858 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<70, 0, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!859 = metadata !{null, metadata !14, metadata !15, metadata !860, metadata !17, metadata !73, metadata !6}
!860 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<70, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!861 = metadata !{null, metadata !247, metadata !9, metadata !862, metadata !11, metadata !545, metadata !6}
!862 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<35, 0>", metadata !"ap_ufixed<35, 0>", metadata !"ap_ufixed<35 + 35, 0 + 0> &"}
!863 = metadata !{null, metadata !110, metadata !9, metadata !864, metadata !11, metadata !112, metadata !6}
!864 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<70, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!865 = metadata !{null, metadata !247, metadata !9, metadata !866, metadata !11, metadata !545, metadata !6}
!866 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<35>", metadata !"ap_uint<35>", metadata !"ap_uint<35 + 35> &"}
!867 = metadata !{null, metadata !14, metadata !15, metadata !153, metadata !17, metadata !83, metadata !6}
!868 = metadata !{null, metadata !22, metadata !23, metadata !869, metadata !25, metadata !561, metadata !6}
!869 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<35, false> &", metadata !"const ap_int_base<35, false> &"}
!870 = metadata !{null, metadata !14, metadata !15, metadata !871, metadata !17, metadata !117, metadata !6}
!871 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<35, false> &"}
!872 = metadata !{null, metadata !22, metadata !23, metadata !873, metadata !25, metadata !76, metadata !6}
!873 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<35, false> &", metadata !"const ap_int_base<35, false> &"}
!874 = metadata !{null, metadata !14, metadata !15, metadata !875, metadata !17, metadata !73, metadata !6}
!875 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<35, false> &"}
!876 = metadata !{null, metadata !110, metadata !9, metadata !877, metadata !11, metadata !112, metadata !6}
!877 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<35, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!878 = metadata !{null, metadata !14, metadata !15, metadata !879, metadata !17, metadata !115, metadata !6}
!879 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<35, 0, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!880 = metadata !{null, metadata !14, metadata !15, metadata !875, metadata !17, metadata !115, metadata !6}
!881 = metadata !{null, metadata !110, metadata !9, metadata !882, metadata !11, metadata !112, metadata !6}
!882 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<35, false>*", metadata !"int", metadata !"int"}
!883 = metadata !{null, metadata !14, metadata !15, metadata !884, metadata !17, metadata !73, metadata !6}
!884 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<77, 8, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!885 = metadata !{null, metadata !14, metadata !15, metadata !886, metadata !17, metadata !73, metadata !6}
!886 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<77, 8, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!887 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !115, metadata !6}
!888 = metadata !{null, metadata !247, metadata !9, metadata !889, metadata !11, metadata !545, metadata !6}
!889 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<42, 7>", metadata !"ap_ufixed<35, 1>", metadata !"ap_ufixed<42 + 35, 7 + 1> &"}
!890 = metadata !{null, metadata !110, metadata !9, metadata !891, metadata !11, metadata !112, metadata !6}
!891 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<77, false>*", metadata !"int", metadata !"int"}
!892 = metadata !{null, metadata !14, metadata !15, metadata !893, metadata !17, metadata !115, metadata !6}
!893 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<77, false> &"}
!894 = metadata !{null, metadata !14, metadata !15, metadata !893, metadata !17, metadata !117, metadata !6}
!895 = metadata !{null, metadata !14, metadata !15, metadata !896, metadata !17, metadata !115, metadata !6}
!896 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<77, false> &"}
!897 = metadata !{null, metadata !110, metadata !9, metadata !898, metadata !11, metadata !112, metadata !6}
!898 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<77, 8, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!899 = metadata !{null, metadata !247, metadata !9, metadata !900, metadata !11, metadata !545, metadata !6}
!900 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<42>", metadata !"ap_uint<35>", metadata !"ap_uint<42 + 35> &"}
!901 = metadata !{null, metadata !22, metadata !23, metadata !902, metadata !25, metadata !561, metadata !6}
!902 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<42, false> &", metadata !"const ap_int_base<35, false> &"}
!903 = metadata !{null, metadata !14, metadata !15, metadata !904, metadata !17, metadata !117, metadata !6}
!904 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<42, false> &"}
!905 = metadata !{null, metadata !22, metadata !23, metadata !906, metadata !25, metadata !76, metadata !6}
!906 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<42, false> &", metadata !"const ap_int_base<35, false> &"}
!907 = metadata !{null, metadata !14, metadata !15, metadata !908, metadata !17, metadata !73, metadata !6}
!908 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<42, false> &"}
!909 = metadata !{null, metadata !14, metadata !15, metadata !896, metadata !17, metadata !73, metadata !6}
!910 = metadata !{null, metadata !110, metadata !9, metadata !911, metadata !11, metadata !112, metadata !6}
!911 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<35, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!912 = metadata !{null, metadata !14, metadata !15, metadata !913, metadata !17, metadata !115, metadata !6}
!913 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<35, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!914 = metadata !{null, metadata !14, metadata !15, metadata !915, metadata !17, metadata !115, metadata !6}
!915 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<42, 7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!916 = metadata !{null, metadata !14, metadata !15, metadata !908, metadata !17, metadata !115, metadata !6}
!917 = metadata !{null, metadata !110, metadata !9, metadata !918, metadata !11, metadata !112, metadata !6}
!918 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<42, false>*", metadata !"int", metadata !"int"}
!919 = metadata !{null, metadata !14, metadata !15, metadata !920, metadata !17, metadata !73, metadata !6}
!920 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<42, 7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!921 = metadata !{null, metadata !14, metadata !15, metadata !922, metadata !17, metadata !73, metadata !6}
!922 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<42, 7, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!923 = metadata !{null, metadata !100, metadata !23, metadata !924, metadata !25, metadata !135, metadata !6}
!924 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<42, 7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!925 = metadata !{null, metadata !110, metadata !9, metadata !926, metadata !11, metadata !112, metadata !6}
!926 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<42, 7, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!927 = metadata !{null, metadata !22, metadata !23, metadata !28, metadata !25, metadata !928, metadata !6}
!928 = metadata !{metadata !"kernel_arg_name", metadata !"y_in", metadata !"x_in"}
!929 = metadata !{null, metadata !247, metadata !9, metadata !930, metadata !11, metadata !636, metadata !6}
!930 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed<41, 2> &", metadata !"ap_fixed<41, 2> &", metadata !"ap_fixed<41, 2> &"}
!931 = metadata !{null, metadata !247, metadata !9, metadata !932, metadata !11, metadata !639, metadata !6}
!932 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 2, 5, 3, 0>", metadata !"struct ap_fixed<41, 2, 0, 3, 0>", metadata !"struct ap_uint<1>"}
!933 = metadata !{null, metadata !14, metadata !15, metadata !934, metadata !17, metadata !83, metadata !6}
!934 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<41, 2, true, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!935 = metadata !{null, metadata !14, metadata !15, metadata !934, metadata !17, metadata !73, metadata !6}
!936 = metadata !{null, metadata !14, metadata !15, metadata !937, metadata !17, metadata !73, metadata !6}
!937 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<41, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!938 = metadata !{null, metadata !14, metadata !15, metadata !939, metadata !17, metadata !73, metadata !6}
!939 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<42, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!940 = metadata !{null, metadata !14, metadata !15, metadata !941, metadata !17, metadata !73, metadata !6}
!941 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<42, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!942 = metadata !{null, metadata !14, metadata !15, metadata !943, metadata !17, metadata !73, metadata !6}
!943 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<41, 2, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!944 = metadata !{null, metadata !247, metadata !9, metadata !945, metadata !11, metadata !639, metadata !6}
!945 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 2, 5, 3, 0>", metadata !"struct ap_fixed<41, 2, 5, 3, 0>", metadata !"_Bool"}
!946 = metadata !{null, metadata !14, metadata !15, metadata !937, metadata !17, metadata !83, metadata !6}
!947 = metadata !{null, metadata !247, metadata !9, metadata !948, metadata !11, metadata !639, metadata !6}
!948 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 2, 5, 3, 0>", metadata !"struct ap_fixed<41, 2, 5, 3, 0>", metadata !"struct ap_uint<1>"}
!949 = metadata !{null, metadata !14, metadata !15, metadata !251, metadata !17, metadata !115, metadata !6}
!950 = metadata !{null, metadata !100, metadata !23, metadata !951, metadata !25, metadata !135, metadata !6}
!951 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<41, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!952 = metadata !{null, metadata !110, metadata !9, metadata !953, metadata !11, metadata !112, metadata !6}
!953 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<41, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!954 = metadata !{null, metadata !14, metadata !15, metadata !955, metadata !17, metadata !73, metadata !6}
!955 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<41, 2, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!956 = metadata !{null, metadata !22, metadata !23, metadata !957, metadata !25, metadata !76, metadata !6}
!957 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"const ap_int_base<8, false> &"}
!958 = metadata !{null, metadata !14, metadata !15, metadata !127, metadata !17, metadata !83, metadata !6}
!959 = metadata !{null, metadata !22, metadata !23, metadata !24, metadata !25, metadata !928, metadata !6}
!960 = metadata !{null, metadata !14, metadata !15, metadata !137, metadata !17, metadata !821, metadata !6}
!961 = metadata !{null, metadata !110, metadata !9, metadata !962, metadata !11, metadata !112, metadata !6}
!962 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<88, true>*", metadata !"int", metadata !"int"}
!963 = metadata !{null, metadata !14, metadata !15, metadata !964, metadata !17, metadata !115, metadata !6}
!964 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<88, true> &"}
!965 = metadata !{null, metadata !14, metadata !15, metadata !964, metadata !17, metadata !117, metadata !6}
!966 = metadata !{null, metadata !14, metadata !15, metadata !967, metadata !17, metadata !115, metadata !6}
!967 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<88, false> &"}
!968 = metadata !{null, metadata !14, metadata !15, metadata !967, metadata !17, metadata !73, metadata !6}
!969 = metadata !{null, metadata !247, metadata !9, metadata !970, metadata !11, metadata !636, metadata !6}
!970 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed<87, 2> &", metadata !"ap_fixed<87, 2> &", metadata !"ap_fixed<87, 2> &"}
!971 = metadata !{null, metadata !247, metadata !9, metadata !972, metadata !11, metadata !639, metadata !6}
!972 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<87, 2, 5, 3, 0>", metadata !"struct ap_fixed<87, 2, 0, 3, 0>", metadata !"struct ap_uint<1>"}
!973 = metadata !{null, metadata !14, metadata !15, metadata !974, metadata !17, metadata !83, metadata !6}
!974 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<87, 2, true, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!975 = metadata !{null, metadata !14, metadata !15, metadata !974, metadata !17, metadata !73, metadata !6}
!976 = metadata !{null, metadata !14, metadata !15, metadata !977, metadata !17, metadata !73, metadata !6}
!977 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<87, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!978 = metadata !{null, metadata !14, metadata !15, metadata !979, metadata !17, metadata !73, metadata !6}
!979 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<88, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!980 = metadata !{null, metadata !14, metadata !15, metadata !981, metadata !17, metadata !73, metadata !6}
!981 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<88, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!982 = metadata !{null, metadata !14, metadata !15, metadata !983, metadata !17, metadata !73, metadata !6}
!983 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<87, 2, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!984 = metadata !{null, metadata !247, metadata !9, metadata !985, metadata !11, metadata !639, metadata !6}
!985 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<87, 2, 5, 3, 0>", metadata !"struct ap_fixed<87, 2, 5, 3, 0>", metadata !"_Bool"}
!986 = metadata !{null, metadata !14, metadata !15, metadata !977, metadata !17, metadata !83, metadata !6}
!987 = metadata !{null, metadata !247, metadata !9, metadata !988, metadata !11, metadata !639, metadata !6}
!988 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<87, 2, 5, 3, 0>", metadata !"struct ap_fixed<87, 2, 5, 3, 0>", metadata !"struct ap_uint<1>"}
!989 = metadata !{null, metadata !100, metadata !23, metadata !990, metadata !25, metadata !135, metadata !6}
!990 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<87, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!991 = metadata !{null, metadata !110, metadata !9, metadata !992, metadata !11, metadata !112, metadata !6}
!992 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<87, 2, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!993 = metadata !{null, metadata !14, metadata !15, metadata !994, metadata !17, metadata !73, metadata !6}
!994 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<87, 2, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!995 = metadata !{null, metadata !22, metadata !23, metadata !996, metadata !25, metadata !76, metadata !6}
!996 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<11, false> &"}
!997 = metadata !{null, metadata !14, metadata !15, metadata !92, metadata !17, metadata !83, metadata !6}
!998 = metadata !{null, metadata !14, metadata !15, metadata !179, metadata !17, metadata !83, metadata !6}
!999 = metadata !{null, metadata !14, metadata !15, metadata !1000, metadata !17, metadata !812, metadata !6}
!1000 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t"}
!1001 = metadata !{null, metadata !22, metadata !23, metadata !1002, metadata !25, metadata !1003, metadata !6}
!1002 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"float &"}
!1003 = metadata !{metadata !"kernel_arg_name", metadata !"t_in", metadata !"t_out"}
!1004 = metadata !{null, metadata !14, metadata !15, metadata !1005, metadata !17, metadata !73, metadata !6}
!1005 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<41, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1006 = metadata !{null, metadata !14, metadata !15, metadata !1007, metadata !17, metadata !73, metadata !6}
!1007 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<41, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1008 = metadata !{null, metadata !14, metadata !15, metadata !1009, metadata !17, metadata !604, metadata !6}
!1009 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ufixed<40, 3>"}
!1010 = metadata !{null, metadata !14, metadata !15, metadata !1011, metadata !17, metadata !604, metadata !6}
!1011 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<40>"}
!1012 = metadata !{null, metadata !22, metadata !23, metadata !1013, metadata !25, metadata !76, metadata !6}
!1013 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<40, false> &", metadata !"int"}
!1014 = metadata !{null, metadata !14, metadata !15, metadata !1015, metadata !17, metadata !115, metadata !6}
!1015 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<40, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1016 = metadata !{null, metadata !14, metadata !15, metadata !1017, metadata !17, metadata !115, metadata !6}
!1017 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<40, false> &"}
!1018 = metadata !{null, metadata !14, metadata !15, metadata !1017, metadata !17, metadata !73, metadata !6}
!1019 = metadata !{null, metadata !14, metadata !15, metadata !1020, metadata !17, metadata !73, metadata !6}
!1020 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<40, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1021 = metadata !{null, metadata !14, metadata !15, metadata !1022, metadata !17, metadata !115, metadata !6}
!1022 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<40, false> &"}
!1023 = metadata !{null, metadata !14, metadata !15, metadata !1022, metadata !17, metadata !117, metadata !6}
!1024 = metadata !{null, metadata !110, metadata !9, metadata !1025, metadata !11, metadata !112, metadata !6}
!1025 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<40, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!1026 = metadata !{null, metadata !110, metadata !9, metadata !1027, metadata !11, metadata !112, metadata !6}
!1027 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<40, false>*", metadata !"int", metadata !"int"}
!1028 = metadata !{null, metadata !14, metadata !15, metadata !1029, metadata !17, metadata !73, metadata !6}
!1029 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<40, 3, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1030 = metadata !{null, metadata !14, metadata !15, metadata !1031, metadata !17, metadata !73, metadata !6}
!1031 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<40, 3, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1032 = metadata !{null, metadata !14, metadata !15, metadata !1033, metadata !17, metadata !73, metadata !6}
!1033 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<40, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1034 = metadata !{null, metadata !247, metadata !9, metadata !1035, metadata !11, metadata !636, metadata !6}
!1035 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed<41, 3> &", metadata !"ap_fixed<41, 3> &", metadata !"ap_fixed<41, 3> &"}
!1036 = metadata !{null, metadata !247, metadata !9, metadata !1037, metadata !11, metadata !639, metadata !6}
!1037 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 3, 5, 3, 0>", metadata !"struct ap_fixed<41, 3, 0, 3, 0>", metadata !"struct ap_uint<1>"}
!1038 = metadata !{null, metadata !14, metadata !15, metadata !1039, metadata !17, metadata !83, metadata !6}
!1039 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<41, 3, true, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!1040 = metadata !{null, metadata !14, metadata !15, metadata !1039, metadata !17, metadata !73, metadata !6}
!1041 = metadata !{null, metadata !14, metadata !15, metadata !1042, metadata !17, metadata !73, metadata !6}
!1042 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<42, 4, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1043 = metadata !{null, metadata !14, metadata !15, metadata !1044, metadata !17, metadata !73, metadata !6}
!1044 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<42, 4, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1045 = metadata !{null, metadata !14, metadata !15, metadata !1046, metadata !17, metadata !73, metadata !6}
!1046 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<41, 3, (enum ap_q_mode)0, (enum ap_o_mode)3, 0> &"}
!1047 = metadata !{null, metadata !247, metadata !9, metadata !1048, metadata !11, metadata !639, metadata !6}
!1048 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 3, 5, 3, 0>", metadata !"struct ap_fixed<41, 3, 5, 3, 0>", metadata !"_Bool"}
!1049 = metadata !{null, metadata !14, metadata !15, metadata !1007, metadata !17, metadata !83, metadata !6}
!1050 = metadata !{null, metadata !247, metadata !9, metadata !1051, metadata !11, metadata !639, metadata !6}
!1051 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<41, 3, 5, 3, 0>", metadata !"struct ap_fixed<41, 3, 5, 3, 0>", metadata !"struct ap_uint<1>"}
!1052 = metadata !{null, metadata !100, metadata !23, metadata !1053, metadata !25, metadata !135, metadata !6}
!1053 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<41, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int"}
!1054 = metadata !{null, metadata !110, metadata !9, metadata !1055, metadata !11, metadata !112, metadata !6}
!1055 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<41, 3, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!1056 = metadata !{null, metadata !14, metadata !15, metadata !1057, metadata !17, metadata !117, metadata !6}
!1057 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<66, false> &"}
!1058 = metadata !{null, metadata !14, metadata !15, metadata !1059, metadata !17, metadata !83, metadata !6}
!1059 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<40> &"}
!1060 = metadata !{null, metadata !22, metadata !23, metadata !1061, metadata !25, metadata !76, metadata !6}
!1061 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<66, false> &", metadata !"int"}
!1062 = metadata !{null, metadata !14, metadata !15, metadata !1063, metadata !17, metadata !73, metadata !6}
!1063 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<66, false> &"}
!1064 = metadata !{null, metadata !14, metadata !15, metadata !567, metadata !17, metadata !115, metadata !6}
!1065 = metadata !{null, metadata !110, metadata !9, metadata !1066, metadata !11, metadata !112, metadata !6}
!1066 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<66, false>*", metadata !"int", metadata !"int"}
!1067 = metadata !{null, metadata !14, metadata !15, metadata !1068, metadata !17, metadata !83, metadata !6}
!1068 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<66> &"}
!1069 = metadata !{null, metadata !22, metadata !23, metadata !1070, metadata !25, metadata !76, metadata !6}
!1070 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<24, false> &", metadata !"int"}
!1071 = metadata !{null, metadata !22, metadata !23, metadata !1072, metadata !25, metadata !76, metadata !6}
!1072 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<24, false> &", metadata !"const ap_int_base<23, false> &"}
!1073 = metadata !{null, metadata !22, metadata !23, metadata !1074, metadata !25, metadata !373, metadata !6}
!1074 = metadata !{metadata !"kernel_arg_type", metadata !"uint", metadata !"const ap_int_base<8, false> &"}
!1075 = metadata !{null, metadata !22, metadata !23, metadata !1076, metadata !25, metadata !76, metadata !6}
!1076 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"const ap_int_base<8, false> &"}
!1077 = metadata !{null, metadata !247, metadata !9, metadata !1078, metadata !11, metadata !1079, metadata !6}
!1078 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"_Bool"}
!1079 = metadata !{metadata !"kernel_arg_name", metadata !"t_in", metadata !"do_cos", metadata !"do_pi"}
!1080 = metadata !{null, metadata !14, metadata !15, metadata !1081, metadata !17, metadata !73, metadata !6}
!1081 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<30, 1, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1082 = metadata !{null, metadata !14, metadata !15, metadata !1083, metadata !17, metadata !73, metadata !6}
!1083 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<30, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1084 = metadata !{null, metadata !22, metadata !23, metadata !1085, metadata !25, metadata !76, metadata !6}
!1085 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &", metadata !"int"}
!1086 = metadata !{null, metadata !14, metadata !15, metadata !1087, metadata !17, metadata !73, metadata !6}
!1087 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 0, false, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!1088 = metadata !{null, metadata !14, metadata !15, metadata !1089, metadata !17, metadata !73, metadata !6}
!1089 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<31, 0, (enum ap_q_mode)0, (enum ap_o_mode)0, 0> &"}
!1090 = metadata !{null, metadata !100, metadata !23, metadata !1091, metadata !25, metadata !135, metadata !6}
!1091 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<8, false>*", metadata !"int"}
!1092 = metadata !{null, metadata !1093, metadata !1094, metadata !1095, metadata !1096, metadata !1097, metadata !6}
!1093 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!1094 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!1095 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"ap_uint<3> &", metadata !"ap_ufixed<31, 0> &", metadata !"ap_ufixed<31, 0> &", metadata !"ap_int<fp_struct<float>::EXP_BITS> &", metadata !"int &"}
!1096 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!1097 = metadata !{metadata !"kernel_arg_name", metadata !"din", metadata !"k", metadata !"dout", metadata !"Mx", metadata !"Ex", metadata !"exactly_pi_over_2"}
!1098 = metadata !{null, metadata !22, metadata !23, metadata !1099, metadata !25, metadata !86, metadata !6}
!1099 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<49, 1, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &", metadata !"int"}
!1100 = metadata !{null, metadata !22, metadata !23, metadata !1101, metadata !25, metadata !76, metadata !6}
!1101 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<95, false> &", metadata !"int"}
!1102 = metadata !{null, metadata !14, metadata !15, metadata !1103, metadata !17, metadata !73, metadata !6}
!1103 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<24> &"}
!1104 = metadata !{null, metadata !14, metadata !15, metadata !1105, metadata !17, metadata !83, metadata !6}
!1105 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<95> &"}
!1106 = metadata !{null, metadata !247, metadata !9, metadata !1107, metadata !11, metadata !249, metadata !6}
!1107 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<ulong long>::is_signed, _Bool>::type"}
!1108 = metadata !{null, metadata !247, metadata !9, metadata !1109, metadata !11, metadata !249, metadata !6}
!1109 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<uint>::is_signed, _Bool>::type"}
!1110 = metadata !{null, metadata !247, metadata !9, metadata !1111, metadata !11, metadata !249, metadata !6}
!1111 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<ushort>::is_signed, _Bool>::type"}
!1112 = metadata !{null, metadata !22, metadata !23, metadata !1113, metadata !25, metadata !86, metadata !6}
!1113 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 17, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &", metadata !"int"}
!1114 = metadata !{null, metadata !14, metadata !15, metadata !1115, metadata !17, metadata !73, metadata !6}
!1115 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 17, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &"}
!1116 = metadata !{null, metadata !14, metadata !15, metadata !1117, metadata !17, metadata !73, metadata !6}
!1117 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<68, 68, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1118 = metadata !{null, metadata !14, metadata !15, metadata !1119, metadata !17, metadata !73, metadata !6}
!1119 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<68, 68, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1120 = metadata !{null, metadata !22, metadata !23, metadata !1121, metadata !25, metadata !76, metadata !6}
!1121 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<68, false> &", metadata !"int"}
!1122 = metadata !{null, metadata !14, metadata !15, metadata !1123, metadata !17, metadata !83, metadata !6}
!1123 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<68, false> &"}
!1124 = metadata !{null, metadata !14, metadata !15, metadata !1125, metadata !17, metadata !73, metadata !6}
!1125 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<120, 68, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1126 = metadata !{null, metadata !247, metadata !9, metadata !1127, metadata !11, metadata !249, metadata !6}
!1127 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<uchar>::is_signed, _Bool>::type"}
!1128 = metadata !{null, metadata !22, metadata !23, metadata !1129, metadata !25, metadata !86, metadata !6}
!1129 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 9, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &", metadata !"int"}
!1130 = metadata !{null, metadata !14, metadata !15, metadata !1131, metadata !17, metadata !73, metadata !6}
!1131 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<1, 9, false, (enum ap_q_mode)5, (enum ap_o_mode)0, 0> &"}
!1132 = metadata !{null, metadata !14, metadata !15, metadata !1133, metadata !17, metadata !73, metadata !6}
!1133 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<60, 60, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1134 = metadata !{null, metadata !14, metadata !15, metadata !1135, metadata !17, metadata !73, metadata !6}
!1135 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<60, 60, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1136 = metadata !{null, metadata !22, metadata !23, metadata !1137, metadata !25, metadata !76, metadata !6}
!1137 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<60, false> &", metadata !"int"}
!1138 = metadata !{null, metadata !14, metadata !15, metadata !1139, metadata !17, metadata !83, metadata !6}
!1139 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<60, false> &"}
!1140 = metadata !{null, metadata !14, metadata !15, metadata !1141, metadata !17, metadata !73, metadata !6}
!1141 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<112, 60, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1142 = metadata !{null, metadata !247, metadata !9, metadata !1143, metadata !11, metadata !249, metadata !6}
!1143 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<ulong long>::is_signed, _Bool>::type"}
!1144 = metadata !{null, metadata !247, metadata !9, metadata !1145, metadata !11, metadata !249, metadata !6}
!1145 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<uint>::is_signed, _Bool>::type"}
!1146 = metadata !{null, metadata !247, metadata !9, metadata !1147, metadata !11, metadata !249, metadata !6}
!1147 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<ushort>::is_signed, _Bool>::type"}
!1148 = metadata !{null, metadata !14, metadata !15, metadata !1149, metadata !17, metadata !73, metadata !6}
!1149 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<39, 39, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1150 = metadata !{null, metadata !14, metadata !15, metadata !1151, metadata !17, metadata !73, metadata !6}
!1151 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<39, 39, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1152 = metadata !{null, metadata !22, metadata !23, metadata !1153, metadata !25, metadata !76, metadata !6}
!1153 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, false> &", metadata !"int"}
!1154 = metadata !{null, metadata !14, metadata !15, metadata !1155, metadata !17, metadata !83, metadata !6}
!1155 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<39, false> &"}
!1156 = metadata !{null, metadata !14, metadata !15, metadata !1157, metadata !17, metadata !73, metadata !6}
!1157 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<62, 39, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1158 = metadata !{null, metadata !247, metadata !9, metadata !1159, metadata !11, metadata !249, metadata !6}
!1159 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<!std::numeric_limits<uchar>::is_signed, _Bool>::type"}
!1160 = metadata !{null, metadata !14, metadata !15, metadata !1161, metadata !17, metadata !73, metadata !6}
!1161 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<31, 31, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1162 = metadata !{null, metadata !14, metadata !15, metadata !1163, metadata !17, metadata !73, metadata !6}
!1163 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<31, 31, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1164 = metadata !{null, metadata !22, metadata !23, metadata !1165, metadata !25, metadata !76, metadata !6}
!1165 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<31, false> &", metadata !"int"}
!1166 = metadata !{null, metadata !14, metadata !15, metadata !434, metadata !17, metadata !83, metadata !6}
!1167 = metadata !{null, metadata !14, metadata !15, metadata !1168, metadata !17, metadata !73, metadata !6}
!1168 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<54, 31, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1169 = metadata !{null, metadata !247, metadata !9, metadata !1170, metadata !11, metadata !249, metadata !6}
!1170 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<int>::is_signed, _Bool>::type"}
!1171 = metadata !{null, metadata !247, metadata !9, metadata !1172, metadata !11, metadata !249, metadata !6}
!1172 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<short>::is_signed, _Bool>::type"}
!1173 = metadata !{null, metadata !14, metadata !15, metadata !1174, metadata !17, metadata !73, metadata !6}
!1174 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<16, 16, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1175 = metadata !{null, metadata !14, metadata !15, metadata !1176, metadata !17, metadata !73, metadata !6}
!1176 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<17, 17, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1177 = metadata !{null, metadata !14, metadata !15, metadata !1178, metadata !17, metadata !73, metadata !6}
!1178 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<16, 16, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1179 = metadata !{null, metadata !14, metadata !15, metadata !1180, metadata !17, metadata !73, metadata !6}
!1180 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<16, 16, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1181 = metadata !{null, metadata !100, metadata !23, metadata !1182, metadata !25, metadata !135, metadata !6}
!1182 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, true>*", metadata !"int"}
!1183 = metadata !{null, metadata !247, metadata !9, metadata !1184, metadata !11, metadata !249, metadata !6}
!1184 = metadata !{metadata !"kernel_arg_type", metadata !"double", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<signed char>::is_signed, _Bool>::type"}
!1185 = metadata !{null, metadata !14, metadata !15, metadata !1186, metadata !17, metadata !73, metadata !6}
!1186 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<8, 8, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1187 = metadata !{null, metadata !14, metadata !15, metadata !1188, metadata !17, metadata !73, metadata !6}
!1188 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<9, 9, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1189 = metadata !{null, metadata !14, metadata !15, metadata !1190, metadata !17, metadata !73, metadata !6}
!1190 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<8, 8, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1191 = metadata !{null, metadata !14, metadata !15, metadata !1192, metadata !17, metadata !73, metadata !6}
!1192 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<8, 8, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!1193 = metadata !{null, metadata !100, metadata !23, metadata !1194, metadata !25, metadata !135, metadata !6}
!1194 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<8, true>*", metadata !"int"}
!1195 = metadata !{null, metadata !247, metadata !9, metadata !1196, metadata !11, metadata !249, metadata !6}
!1196 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<int>::is_signed, _Bool>::type"}
!1197 = metadata !{null, metadata !247, metadata !9, metadata !1198, metadata !11, metadata !249, metadata !6}
!1198 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<short>::is_signed, _Bool>::type"}
!1199 = metadata !{null, metadata !247, metadata !9, metadata !1200, metadata !11, metadata !249, metadata !6}
!1200 = metadata !{metadata !"kernel_arg_type", metadata !"float", metadata !"_Bool", metadata !"typename enable_if<std::numeric_limits<signed char>::is_signed, _Bool>::type"}
!1201 = metadata !{metadata !1202, [2 x i32]* @llvm_global_ctors_0}
!1202 = metadata !{metadata !1203}
!1203 = metadata !{i32 0, i32 31, metadata !1204}
!1204 = metadata !{metadata !1205}
!1205 = metadata !{metadata !"llvm.global_ctors.0", metadata !1206, metadata !"", i32 0, i32 31}
!1206 = metadata !{metadata !1207}
!1207 = metadata !{i32 0, i32 1, i32 1}
!1208 = metadata !{metadata !1209}
!1209 = metadata !{i32 0, i32 7, metadata !1210}
!1210 = metadata !{metadata !1211}
!1211 = metadata !{metadata !"input", metadata !1212, metadata !"unsigned char", i32 0, i32 7}
!1212 = metadata !{metadata !1213}
!1213 = metadata !{i32 0, i32 1048575, i32 1}
!1214 = metadata !{metadata !1215}
!1215 = metadata !{i32 0, i32 7, metadata !1216}
!1216 = metadata !{metadata !1217}
!1217 = metadata !{metadata !"output", metadata !1212, metadata !"unsigned char", i32 0, i32 7}
!1218 = metadata !{metadata !1219}
!1219 = metadata !{i32 0, i32 7, metadata !1220}
!1220 = metadata !{metadata !1221}
!1221 = metadata !{metadata !"golden", metadata !1212, metadata !"unsigned char", i32 0, i32 7}
!1222 = metadata !{metadata !1223}
!1223 = metadata !{i32 0, i32 63, metadata !1224}
!1224 = metadata !{metadata !1225}
!1225 = metadata !{metadata !"return", metadata !1226, metadata !"double", i32 0, i32 63}
!1226 = metadata !{metadata !1227}
!1227 = metadata !{i32 0, i32 1, i32 0}
