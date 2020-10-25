function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  
  x0 = zeros (length (c), 1);
  
  while 1
    x = csr_multiplication (G_values, G_colind, G_rowptr, x0) + c;
    err = norm (x - x0, 2);
    
    if err < tol
      return;
    endif
    
    x0 = x;
  endwhile

endfunction
