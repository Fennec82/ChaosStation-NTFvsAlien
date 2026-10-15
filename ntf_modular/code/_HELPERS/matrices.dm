/proc/standardise_color_matrix(list/matrix)
	if(!islist(matrix))
		return COLOR_MATRIX_IDENTITY
	var/length = length(matrix)
	if(length > 20)
		return matrix.Cut(21)
	if(length < 13)
		for(var/i = 1 to 12)
			if(!matrix[i])
				matrix[i] = 0
		matrix.Insert(4,0) //ra
		matrix.Insert(8,0) //ga
		matrix.Insert(12,0,0,0,0,1) //ba, ar, ag, ab, aa
		matrix.Insert(20,0) //ca
		return matrix
	if(length < 20)
		for(var/i = 1 to 20)
			if(!matrix[i])
				matrix[i] = 0
	return matrix


/proc/color_to_matrix(color)
	if(istext(color))
		return color_hex2color_matrix(color)
	return standardise_color_matrix(color)

/proc/scale_color_matrix(list/A, scale_factor)
	for(var/i = 1 to 20)
		A[i] = A[i] * scale_factor
	return A

/proc/color_matrix_gradient(list/A, list/B, gradient_amount)
	log_world("color matrix gradient : orig A = [json_encode(A)], B = [json_encode(B)], amount = [gradient_amount]")
	A = A.Copy()
	A = scale_color_matrix(A, 1 - gradient_amount)
	B = B.Copy()
	B = scale_color_matrix(B, gradient_amount)
	log_world("color matrix gradient : new A = [json_encode(A)], B = [json_encode(B)], amount = [gradient_amount]")
	return color_matrix_add(A, B)
