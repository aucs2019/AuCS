; ModuleID = 'Descriptor1'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }

@threadIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@blockIdx = external global %struct.dim3
@_ZZ17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffiE7shrdMem = internal global [512 x float] zeroinitializer, section "__shared__", align 16

define void @_Z17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffi(float* %desc_out, i32 %desc_len, i32 %histsz, float* %x_in, float* %y_in, i32* %layer_in, float* %response_in, float* %size_in, float* %ori_in, i32 %total_feat, i32 %d, i32 %n, float %scale, float %sigma, i32 %n_layers) uwtable noinline {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float*, align 8
  %5 = alloca float*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca float*, align 8
  %8 = alloca float*, align 8
  %9 = alloca float*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca i32, align 4
  %tid_x = alloca i32, align 4
  %tid_y = alloca i32, align 4
  %bsz_x = alloca i32, align 4
  %bsz_y = alloca i32, align 4
  %f = alloca i32, align 4
  %desc = alloca float*, align 8
  %accum = alloca float*, align 8
  %histlen = alloca i32, align 4
  %hist_off = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  store float* %desc_out, float** %1, align 8
  call void @llvm.dbg.declare(metadata !{float** %1}, metadata !25), !dbg !26
  store i32 %desc_len, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !27), !dbg !28
  store i32 %histsz, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !29), !dbg !30
  store float* %x_in, float** %4, align 8
  call void @llvm.dbg.declare(metadata !{float** %4}, metadata !31), !dbg !32
  store float* %y_in, float** %5, align 8
  call void @llvm.dbg.declare(metadata !{float** %5}, metadata !33), !dbg !34
  store i32* %layer_in, i32** %6, align 8
  call void @llvm.dbg.declare(metadata !{i32** %6}, metadata !35), !dbg !36
  store float* %response_in, float** %7, align 8
  call void @llvm.dbg.declare(metadata !{float** %7}, metadata !37), !dbg !38
  store float* %size_in, float** %8, align 8
  call void @llvm.dbg.declare(metadata !{float** %8}, metadata !39), !dbg !40
  store float* %ori_in, float** %9, align 8
  call void @llvm.dbg.declare(metadata !{float** %9}, metadata !41), !dbg !42
  store i32 %total_feat, i32* %10, align 4
  call void @llvm.dbg.declare(metadata !{i32* %10}, metadata !43), !dbg !44
  store i32 %d, i32* %11, align 4
  call void @llvm.dbg.declare(metadata !{i32* %11}, metadata !45), !dbg !46
  store i32 %n, i32* %12, align 4
  call void @llvm.dbg.declare(metadata !{i32* %12}, metadata !47), !dbg !48
  store float %scale, float* %13, align 4
  call void @llvm.dbg.declare(metadata !{float* %13}, metadata !49), !dbg !50
  store float %sigma, float* %14, align 4
  call void @llvm.dbg.declare(metadata !{float* %14}, metadata !51), !dbg !52
  store i32 %n_layers, i32* %15, align 4
  call void @llvm.dbg.declare(metadata !{i32* %15}, metadata !53), !dbg !54
  call void @llvm.dbg.declare(metadata !{i32* %tid_x}, metadata !55), !dbg !57
  %16 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !57
  store i32 %16, i32* %tid_x, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata !{i32* %tid_y}, metadata !58), !dbg !59
  %17 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 1), align 4, !dbg !59
  store i32 %17, i32* %tid_y, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata !{i32* %bsz_x}, metadata !60), !dbg !61
  %18 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !61
  store i32 %18, i32* %bsz_x, align 4, !dbg !61
  call void @llvm.dbg.declare(metadata !{i32* %bsz_y}, metadata !62), !dbg !63
  %19 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 1), align 4, !dbg !63
  store i32 %19, i32* %bsz_y, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata !{i32* %f}, metadata !64), !dbg !65
  %20 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 1), align 4, !dbg !65
  %21 = load i32* %bsz_y, align 4, !dbg !65
  %22 = mul i32 %20, %21, !dbg !65
  %23 = load i32* %tid_y, align 4, !dbg !65
  %24 = add i32 %22, %23, !dbg !65
  store i32 %24, i32* %f, align 4, !dbg !65
  store i32 6, i32* %2, align 4, !dbg !66
  store i32 8, i32* %10, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata !{float** %desc}, metadata !68), !dbg !69
  store float* getelementptr inbounds ([512 x float]* @_ZZ17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffiE7shrdMem, i32 0, i32 0), float** %desc, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata !{float** %accum}, metadata !70), !dbg !71
  %25 = load i32* %2, align 4, !dbg !71
  %26 = load i32* %3, align 4, !dbg !71
  %27 = mul i32 %25, %26, !dbg !71
  %28 = zext i32 %27 to i64, !dbg !71
  %29 = getelementptr inbounds float* getelementptr inbounds ([512 x float]* @_ZZ17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffiE7shrdMem, i32 0, i32 0), i64 %28, !dbg !71
  store float* %29, float** %accum, align 8, !dbg !71
  store i32 1, i32* %3, align 4, !dbg !72
  %30 = load i32* %f, align 4, !dbg !73
  %31 = load i32* %10, align 4, !dbg !73
  %32 = icmp ult i32 %30, %31, !dbg !73
  br i1 %32, label %33, label %105, !dbg !73

; <label>:33                                      ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %histlen}, metadata !74), !dbg !76
  store i32 16, i32* %histlen, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata !{i32* %hist_off}, metadata !77), !dbg !78
  %34 = load i32* %tid_x, align 4, !dbg !78
  %35 = load i32* %3, align 4, !dbg !78
  %36 = urem i32 %34, %35, !dbg !78
  %37 = load i32* %2, align 4, !dbg !78
  %38 = mul i32 %36, %37, !dbg !78
  store i32 %38, i32* %hist_off, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !79), !dbg !80
  %39 = load i32* %tid_x, align 4, !dbg !80
  store i32 %39, i32* %i, align 4, !dbg !80
  br label %40, !dbg !81

; <label>:40                                      ; preds = %45, %33
  %41 = load i32* %i, align 4, !dbg !81
  %42 = load i32* %3, align 4, !dbg !81
  %43 = mul i32 16, %42, !dbg !81
  %44 = icmp ult i32 %41, %43, !dbg !81
  br i1 %44, label %45, label %56, !dbg !81

; <label>:45                                      ; preds = %40
  %46 = load i32* %tid_y, align 4, !dbg !82
  %47 = mul nsw i32 %46, 16, !dbg !82
  %48 = load i32* %i, align 4, !dbg !82
  %49 = add nsw i32 %47, %48, !dbg !82
  %50 = sext i32 %49 to i64, !dbg !82
  %51 = load float** %desc, align 8, !dbg !82
  %52 = getelementptr inbounds float* %51, i64 %50, !dbg !82
  store float 0.000000e+00, float* %52, align 4, !dbg !82
  %53 = load i32* %bsz_x, align 4, !dbg !84
  %54 = load i32* %i, align 4, !dbg !84
  %55 = add nsw i32 %54, %53, !dbg !84
  store i32 %55, i32* %i, align 4, !dbg !84
  br label %40, !dbg !85

; <label>:56                                      ; preds = %40
  call void @__syncthreads(), !dbg !86
  call void @llvm.dbg.declare(metadata !{i32* %l}, metadata !87), !dbg !88
  %57 = load i32* %tid_x, align 4, !dbg !88
  store i32 %57, i32* %l, align 4, !dbg !88
  br label %58, !dbg !89

; <label>:58                                      ; preds = %63, %56
  %59 = load i32* %l, align 4, !dbg !89
  %60 = load i32* %2, align 4, !dbg !89
  %61 = mul i32 %60, 2, !dbg !89
  %62 = icmp ult i32 %59, %61, !dbg !89
  br i1 %62, label %63, label %81, !dbg !89

; <label>:63                                      ; preds = %58
  %64 = load i32* %l, align 4, !dbg !90
  %65 = load i32* %2, align 4, !dbg !90
  %66 = mul i32 2, %65, !dbg !90
  %67 = add i32 %64, %66, !dbg !90
  %68 = zext i32 %67 to i64, !dbg !90
  %69 = load float** %desc, align 8, !dbg !90
  %70 = getelementptr inbounds float* %69, i64 %68, !dbg !90
  %71 = load float* %70, align 4, !dbg !90
  %72 = load i32* %l, align 4, !dbg !90
  %73 = sext i32 %72 to i64, !dbg !90
  %74 = load float** %desc, align 8, !dbg !90
  %75 = getelementptr inbounds float* %74, i64 %73, !dbg !90
  %76 = load float* %75, align 4, !dbg !90
  %77 = fadd float %76, %71, !dbg !90
  store float %77, float* %75, align 4, !dbg !90
  %78 = load i32* %bsz_x, align 4, !dbg !92
  %79 = load i32* %l, align 4, !dbg !92
  %80 = add nsw i32 %79, %78, !dbg !92
  store i32 %80, i32* %l, align 4, !dbg !92
  br label %58, !dbg !93

; <label>:81                                      ; preds = %58
  call void @__syncthreads(), !dbg !94
  %82 = load i32* %tid_x, align 4, !dbg !95
  store i32 %82, i32* %l, align 4, !dbg !95
  br label %83, !dbg !96

; <label>:83                                      ; preds = %87, %81
  %84 = load i32* %l, align 4, !dbg !96
  %85 = load i32* %2, align 4, !dbg !96
  %86 = icmp ult i32 %84, %85, !dbg !96
  br i1 %86, label %87, label %104, !dbg !96

; <label>:87                                      ; preds = %83
  %88 = load i32* %l, align 4, !dbg !97
  %89 = load i32* %2, align 4, !dbg !97
  %90 = add i32 %88, %89, !dbg !97
  %91 = zext i32 %90 to i64, !dbg !97
  %92 = load float** %desc, align 8, !dbg !97
  %93 = getelementptr inbounds float* %92, i64 %91, !dbg !97
  %94 = load float* %93, align 4, !dbg !97
  %95 = load i32* %l, align 4, !dbg !97
  %96 = sext i32 %95 to i64, !dbg !97
  %97 = load float** %desc, align 8, !dbg !97
  %98 = getelementptr inbounds float* %97, i64 %96, !dbg !97
  %99 = load float* %98, align 4, !dbg !97
  %100 = fadd float %99, %94, !dbg !97
  store float %100, float* %98, align 4, !dbg !97
  %101 = load i32* %bsz_x, align 4, !dbg !99
  %102 = load i32* %l, align 4, !dbg !99
  %103 = add nsw i32 %102, %101, !dbg !99
  store i32 %103, i32* %l, align 4, !dbg !99
  br label %83, !dbg !100

; <label>:104                                     ; preds = %83
  br label %105, !dbg !101

; <label>:105                                     ; preds = %104, %0
  ret void, !dbg !102
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @__syncthreads() section "__device__"

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"Descriptor1.cpp", metadata !"/home/mingyuanwu/arrayfire-repair", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !18} ; [ DW_TAG_compile_unit ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp] [DW_LANG_C_plus_plus]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"computeDescriptor", metadata !"computeDescriptor", metadata !"_Z17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffi", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, i32, i32, float*, float*, i32*, float*, float*, float*, i32, i32, i32, float, float, i32)* @_Z17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffi, null, null, metadata !1, i32 17} ; [ DW_TAG_subprogram ] [line 1] [def] [scope 17] [computeDescriptor]
!6 = metadata !{i32 786473, metadata !"Descriptor1.cpp", metadata !"/home/mingyuanwu/arrayfire-repair", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !11, metadata !11, metadata !12, metadata !12, metadata !14, metadata !12, metadata !12, metadata !12, metadata !11, metadata !16, metadata !16, metadata !13, metadata !13, metadata !16}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!10 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!14 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned int]
!16 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!17 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !20, metadata !24, metadata !24}
!20 = metadata !{i32 786484, i32 0, metadata !5, metadata !"shrdMem", metadata !"shrdMem", metadata !"", metadata !6, i32 27, metadata !21, i32 1, i32 1, [512 x float]* @_ZZ17computeDescriptorPfjjPKfS1_PKjS1_S1_S1_jiiffiE7shrdMem} ; [ DW_TAG_variable ] [shrdMem] [line 27] [local] [def]
!21 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !10, metadata !22, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from float]
!22 = metadata !{metadata !23}
!23 = metadata !{i32 786465, i64 0, i64 511}      ; [ DW_TAG_subrange_type ] [0, 511]
!24 = metadata !{i32 786484, i32 0, metadata !6, metadata !"histlen", metadata !"histlen", metadata !"histlen", metadata !6, i32 33, metadata !16, i32 1, i32 1, i32 16} ; [ DW_TAG_variable ] [histlen] [line 33] [local] [def]
!25 = metadata !{i32 786689, metadata !5, metadata !"desc_out", metadata !6, i32 16777218, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc_out] [line 2]
!26 = metadata !{i32 2, i32 0, metadata !5, null}
!27 = metadata !{i32 786689, metadata !5, metadata !"desc_len", metadata !6, i32 33554435, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc_len] [line 3]
!28 = metadata !{i32 3, i32 0, metadata !5, null}
!29 = metadata !{i32 786689, metadata !5, metadata !"histsz", metadata !6, i32 50331652, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [histsz] [line 4]
!30 = metadata !{i32 4, i32 0, metadata !5, null}
!31 = metadata !{i32 786689, metadata !5, metadata !"x_in", metadata !6, i32 67108869, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x_in] [line 5]
!32 = metadata !{i32 5, i32 0, metadata !5, null}
!33 = metadata !{i32 786689, metadata !5, metadata !"y_in", metadata !6, i32 83886086, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [y_in] [line 6]
!34 = metadata !{i32 6, i32 0, metadata !5, null}
!35 = metadata !{i32 786689, metadata !5, metadata !"layer_in", metadata !6, i32 100663303, metadata !14, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [layer_in] [line 7]
!36 = metadata !{i32 7, i32 0, metadata !5, null}
!37 = metadata !{i32 786689, metadata !5, metadata !"response_in", metadata !6, i32 117440520, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [response_in] [line 8]
!38 = metadata !{i32 8, i32 0, metadata !5, null}
!39 = metadata !{i32 786689, metadata !5, metadata !"size_in", metadata !6, i32 134217737, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size_in] [line 9]
!40 = metadata !{i32 9, i32 0, metadata !5, null}
!41 = metadata !{i32 786689, metadata !5, metadata !"ori_in", metadata !6, i32 150994954, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ori_in] [line 10]
!42 = metadata !{i32 10, i32 0, metadata !5, null}
!43 = metadata !{i32 786689, metadata !5, metadata !"total_feat", metadata !6, i32 167772171, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total_feat] [line 11]
!44 = metadata !{i32 11, i32 0, metadata !5, null}
!45 = metadata !{i32 786689, metadata !5, metadata !"d", metadata !6, i32 184549388, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d] [line 12]
!46 = metadata !{i32 12, i32 0, metadata !5, null}
!47 = metadata !{i32 786689, metadata !5, metadata !"n", metadata !6, i32 201326605, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 13]
!48 = metadata !{i32 13, i32 0, metadata !5, null}
!49 = metadata !{i32 786689, metadata !5, metadata !"scale", metadata !6, i32 218103822, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [scale] [line 14]
!50 = metadata !{i32 14, i32 0, metadata !5, null}
!51 = metadata !{i32 786689, metadata !5, metadata !"sigma", metadata !6, i32 234881039, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sigma] [line 15]
!52 = metadata !{i32 15, i32 0, metadata !5, null}
!53 = metadata !{i32 786689, metadata !5, metadata !"n_layers", metadata !6, i32 251658256, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n_layers] [line 16]
!54 = metadata !{i32 16, i32 0, metadata !5, null}
!55 = metadata !{i32 786688, metadata !56, metadata !"tid_x", metadata !6, i32 18, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tid_x] [line 18]
!56 = metadata !{i32 786443, metadata !5, i32 17, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp]
!57 = metadata !{i32 18, i32 0, metadata !56, null}
!58 = metadata !{i32 786688, metadata !56, metadata !"tid_y", metadata !6, i32 19, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tid_y] [line 19]
!59 = metadata !{i32 19, i32 0, metadata !56, null}
!60 = metadata !{i32 786688, metadata !56, metadata !"bsz_x", metadata !6, i32 20, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bsz_x] [line 20]
!61 = metadata !{i32 20, i32 0, metadata !56, null}
!62 = metadata !{i32 786688, metadata !56, metadata !"bsz_y", metadata !6, i32 21, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bsz_y] [line 21]
!63 = metadata !{i32 21, i32 0, metadata !56, null}
!64 = metadata !{i32 786688, metadata !56, metadata !"f", metadata !6, i32 23, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 23]
!65 = metadata !{i32 23, i32 0, metadata !56, null}
!66 = metadata !{i32 24, i32 0, metadata !56, null}
!67 = metadata !{i32 25, i32 0, metadata !56, null}
!68 = metadata !{i32 786688, metadata !56, metadata !"desc", metadata !6, i32 28, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [desc] [line 28]
!69 = metadata !{i32 28, i32 0, metadata !56, null}
!70 = metadata !{i32 786688, metadata !56, metadata !"accum", metadata !6, i32 29, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [accum] [line 29]
!71 = metadata !{i32 29, i32 0, metadata !56, null}
!72 = metadata !{i32 30, i32 0, metadata !56, null}
!73 = metadata !{i32 32, i32 0, metadata !56, null}
!74 = metadata !{i32 786688, metadata !75, metadata !"histlen", metadata !6, i32 33, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [histlen] [line 33]
!75 = metadata !{i32 786443, metadata !56, i32 32, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp]
!76 = metadata !{i32 33, i32 0, metadata !75, null}
!77 = metadata !{i32 786688, metadata !75, metadata !"hist_off", metadata !6, i32 34, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [hist_off] [line 34]
!78 = metadata !{i32 34, i32 0, metadata !75, null}
!79 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !6, i32 36, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 36]
!80 = metadata !{i32 36, i32 0, metadata !75, null}
!81 = metadata !{i32 37, i32 0, metadata !75, null}
!82 = metadata !{i32 38, i32 0, metadata !83, null}
!83 = metadata !{i32 786443, metadata !75, i32 37, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp]
!84 = metadata !{i32 39, i32 0, metadata !83, null}
!85 = metadata !{i32 40, i32 0, metadata !83, null}
!86 = metadata !{i32 42, i32 0, metadata !75, null}
!87 = metadata !{i32 786688, metadata !75, metadata !"l", metadata !6, i32 43, metadata !17, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [l] [line 43]
!88 = metadata !{i32 43, i32 0, metadata !75, null}
!89 = metadata !{i32 44, i32 0, metadata !75, null}
!90 = metadata !{i32 45, i32 0, metadata !91, null}
!91 = metadata !{i32 786443, metadata !75, i32 44, i32 0, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp]
!92 = metadata !{i32 46, i32 0, metadata !91, null}
!93 = metadata !{i32 47, i32 0, metadata !91, null}
!94 = metadata !{i32 48, i32 0, metadata !75, null}
!95 = metadata !{i32 49, i32 0, metadata !75, null}
!96 = metadata !{i32 50, i32 0, metadata !75, null}
!97 = metadata !{i32 51, i32 0, metadata !98, null}
!98 = metadata !{i32 786443, metadata !75, i32 50, i32 0, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/home/mingyuanwu/arrayfire-repair/Descriptor1.cpp]
!99 = metadata !{i32 52, i32 0, metadata !98, null}
!100 = metadata !{i32 53, i32 0, metadata !98, null}
!101 = metadata !{i32 55, i32 0, metadata !75, null}
!102 = metadata !{i32 56, i32 0, metadata !56, null}
