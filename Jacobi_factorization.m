function [G_J, c_J] = Jacobi_factorization(A, b)

  #matrice cu diagonala lui A
  D = diag (diag (A));
  
  #matrice strict superior/inferior triunghiulate
  L = tril (A) - D;
  U = triu (A) - D;
  
  N = D;
  P = - L - U;
  
  #matricea si vectorul de iteratie
  G_J = inv (N) * P;
  c_J = inv (N) * b;

endfunction