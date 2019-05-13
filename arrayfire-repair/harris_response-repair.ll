define void @_Z15harris_responsePfS_PKfS1_S1_jS_jfj(float* %score_out, float* %size_out, float* %x_in, float* %y_in, float* %scl_in, i32 %total_feat, float* %image_ptr, i32 %block_size, float %k_thr, i32 %patch_size) uwtable noinline {%1 = alloca float*, align 8
%2 = alloca float*, align 8
%3 = alloca float*, align 8
%4 = alloca float*, align 8
%5 = alloca float*, align 8
%6 = alloca i32, align 4
%7 = alloca float*, align 8
%8 = alloca i32, align 4
%9 = alloca float, align 4
%10 = alloca i32, align 4
%f = alloca i32, align 4
%x = alloca i32, align 4
%y = alloca i32, align 4
%scl = alloca float, align 4
%size = alloca float, align 4
%r = alloca i32, align 4
%ixx = alloca float, align 4
%iyy = alloca float, align 4
%ixy = alloca float, align 4
%block_size_sq = alloca i32, align 4
%k = alloca i32, align 4
%i = alloca i32, align 4
%j = alloca i32, align 4
%ix = alloca float, align 4
%iy = alloca float, align 4
store float* %score_out, float** %1, align 8
store float* %size_out, float** %2, align 8
store float* %x_in, float** %3, align 8
store float* %y_in, float** %4, align 8
store float* %scl_in, float** %5, align 8
store i32 %total_feat, i32* %6, align 4
store float* %image_ptr, float** %7, align 8
store i32 %block_size, i32* %8, align 4
store float %k_thr, float* %9, align 4
store i32 %patch_size, i32* %10, align 4
%11 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !64
%12 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !64
%13 = mul i32 %11, %12, !dbg !64
%14 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !64
%15 = add i32 %13, %14, !dbg !64
store i32 %15, i32* %f, align 4, !dbg !64
store i32 1000, i32* %6, align 4, !dbg !65
store i32 16, i32* %8, align 4, !dbg !66
%16 = load i32* %f, align 4, !dbg !67
%17 = load i32* %6, align 4, !dbg !67
%18 = icmp ult i32 %16, %17, !dbg !67
br i1 %18, label %19, label %137, !dbg !67
; <label>:19                                      ; preds = %0
store float 1.000000e+00, float* %scl, align 4, !dbg !73
%20 = load float* %scl, align 4, !dbg !74
%21 = fcmp ogt float %20, 0.000000e+00, !dbg !74
br i1 %21, label %22, label %44, !dbg !74
; <label>:22                                      ; preds = %19
%23 = load i32* %f, align 4, !dbg !75
%24 = zext i32 %23 to i64, !dbg !75
%25 = load float** %5, align 8, !dbg !75
%26 = getelementptr inbounds float* %25, i64 %24, !dbg !75
%27 = load float* %26, align 4, !dbg !75
store float %27, float* %scl, align 4, !dbg !75
%28 = load i32* %f, align 4, !dbg !77
%29 = zext i32 %28 to i64, !dbg !77
%30 = load float** %3, align 8, !dbg !77
%31 = getelementptr inbounds float* %30, i64 %29, !dbg !77
%32 = load float* %31, align 4, !dbg !77
%33 = load float* %scl, align 4, !dbg !77
%34 = fmul float %32, %33, !dbg !77
%35 = fptoui float %34 to i32, !dbg !77
store i32 %35, i32* %x, align 4, !dbg !77
%36 = load i32* %f, align 4, !dbg !78
%37 = zext i32 %36 to i64, !dbg !78
%38 = load float** %4, align 8, !dbg !78
%39 = getelementptr inbounds float* %38, i64 %37, !dbg !78
%40 = load float* %39, align 4, !dbg !78
%41 = load float* %scl, align 4, !dbg !78
%42 = fmul float %40, %41, !dbg !78
%43 = fptoui float %42 to i32, !dbg !78
store i32 %43, i32* %y, align 4, !dbg !78
br label %57, !dbg !79
; <label>:44                                      ; preds = %19
%45 = load i32* %f, align 4, !dbg !80
%46 = zext i32 %45 to i64, !dbg !80
%47 = load float** %3, align 8, !dbg !80
%48 = getelementptr inbounds float* %47, i64 %46, !dbg !80
%49 = load float* %48, align 4, !dbg !80
%50 = fptoui float %49 to i32, !dbg !80
store i32 %50, i32* %x, align 4, !dbg !80
%51 = load i32* %f, align 4, !dbg !82
%52 = zext i32 %51 to i64, !dbg !82
%53 = load float** %4, align 8, !dbg !82
%54 = getelementptr inbounds float* %53, i64 %52, !dbg !82
%55 = load float* %54, align 4, !dbg !82
%56 = fptoui float %55 to i32, !dbg !82
store i32 %56, i32* %y, align 4, !dbg !82
br label %57
; <label>:57                                      ; preds = %44, %22
store float 1.000000e+00, float* %size, align 4, !dbg !84
%58 = load i32* %8, align 4, !dbg !86
%59 = udiv i32 %58, 2, !dbg !86
store i32 %59, i32* %r, align 4, !dbg !86
store float 0.000000e+00, float* %ixx, align 4, !dbg !88
store float 0.000000e+00, float* %iyy, align 4, !dbg !88
store float 0.000000e+00, float* %ixy, align 4, !dbg !88
%60 = load i32* %8, align 4, !dbg !92
%61 = load i32* %8, align 4, !dbg !92
%62 = mul i32 %60, %61, !dbg !92
store i32 %62, i32* %block_size_sq, align 4, !dbg !92
%63 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 1), align 4, !dbg !95
store i32 %63, i32* %k, align 4, !dbg !95
br label %64, !dbg !95
; <label>:64                                      ; preds = %126, %57
%65 = load i32* %k, align 4, !dbg !95
%66 = load i32* %block_size_sq, align 4, !dbg !95
%67 = icmp ult i32 %65, %66, !dbg !95
br i1 %67, label %68, label %130, !dbg !95
; <label>:68                                      ; preds = %64
%69 = load i32* %k, align 4, !dbg !99
%70 = load i32* %8, align 4, !dbg !99
%71 = udiv i32 %69, %70, !dbg !99
%72 = load i32* %r, align 4, !dbg !99
%73 = sub i32 %71, %72, !dbg !99
store i32 %73, i32* %i, align 4, !dbg !99
%74 = load i32* %k, align 4, !dbg !101
%75 = load i32* %8, align 4, !dbg !101
%76 = urem i32 %74, %75, !dbg !101
%77 = load i32* %r, align 4, !dbg !101
%78 = sub i32 %76, %77, !dbg !101
store i32 %78, i32* %j, align 4, !dbg !101
%79 = load i32* %x, align 4, !dbg !103
%80 = load i32* %i, align 4, !dbg !103
%81 = add i32 %79, %80, !dbg !103
%82 = add i32 %81, 1, !dbg !103
%83 = zext i32 %82 to i64, !dbg !103
%84 = load float** %7, align 8, !dbg !103
%85 = getelementptr inbounds float* %84, i64 %83, !dbg !103
%86 = load float* %85, align 4, !dbg !103
%87 = load i32* %x, align 4, !dbg !103
%88 = load i32* %i, align 4, !dbg !103
%89 = add i32 %87, %88, !dbg !103
%90 = sub i32 %89, 1, !dbg !103
%91 = zext i32 %90 to i64, !dbg !103
%92 = load float** %7, align 8, !dbg !103
%93 = getelementptr inbounds float* %92, i64 %91, !dbg !103
%94 = load float* %93, align 4, !dbg !103
%95 = fsub float %86, %94, !dbg !103
store float %95, float* %ix, align 4, !dbg !103
%96 = load i32* %x, align 4, !dbg !105
%97 = load i32* %i, align 4, !dbg !105
%98 = add i32 %96, %97, !dbg !105
%99 = zext i32 %98 to i64, !dbg !105
%100 = load float** %7, align 8, !dbg !105
%101 = getelementptr inbounds float* %100, i64 %99, !dbg !105
%102 = load float* %101, align 4, !dbg !105
%103 = load i32* %x, align 4, !dbg !105
%104 = load i32* %i, align 4, !dbg !105
%105 = add i32 %103, %104, !dbg !105
%106 = zext i32 %105 to i64, !dbg !105
%107 = load float** %7, align 8, !dbg !105
%108 = getelementptr inbounds float* %107, i64 %106, !dbg !105
%109 = load float* %108, align 4, !dbg !105
%110 = fsub float %102, %109, !dbg !105
store float %110, float* %iy, align 4, !dbg !105
%111 = load float* %ix, align 4, !dbg !106
%112 = load float* %ix, align 4, !dbg !106
%113 = fmul float %111, %112, !dbg !106
%114 = load float* %ixx, align 4, !dbg !106
%115 = fadd float %114, %113, !dbg !106
store float %115, float* %ixx, align 4, !dbg !106
%116 = load float* %iy, align 4, !dbg !107
%117 = load float* %iy, align 4, !dbg !107
%118 = fmul float %116, %117, !dbg !107
%119 = load float* %iyy, align 4, !dbg !107
%120 = fadd float %119, %118, !dbg !107
store float %120, float* %iyy, align 4, !dbg !107
%121 = load float* %ix, align 4, !dbg !108
%122 = load float* %iy, align 4, !dbg !108
%123 = fmul float %121, %122, !dbg !108
%124 = load float* %ixy, align 4, !dbg !108
%125 = fadd float %124, %123, !dbg !108
store float %125, float* %ixy, align 4, !dbg !108
br label %126, !dbg !109
; <label>:126                                     ; preds = %68
%127 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 1), align 4, !dbg !95
%128 = load i32* %k, align 4, !dbg !95
%129 = add i32 %128, %127, !dbg !95
store i32 %129, i32* %k, align 4, !dbg !95
br label %64, !dbg !95
; <label>:130                                     ; preds = %64
%131 = load float* %ixx, align 4, !dbg !111
%132 = call float @_Z16block_reduce_sumf(float %131), !dbg !111
store float %132, float* %ixx, align 4, !dbg !111
%133 = load float* %iyy, align 4, !dbg !112
%134 = call float @_Z16block_reduce_sumf(float %133), !dbg !112
store float %134, float* %iyy, align 4, !dbg !112
%135 = load float* %ixy, align 4, !dbg !113
%136 = call float @_Z16block_reduce_sumf(float %135), !dbg !113
store float %136, float* %ixy, align 4, !dbg !113
br label %137, !dbg !114
; <label>:137                                     ; preds = %130, %0
ret void, !dbg !115}
