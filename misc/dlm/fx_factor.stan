// Kalman Filter (Multivariate Form)
// - no missing values
data {
  // system matrices
  int r;
  int T;
  matrix[r, T] y;
}
transformed data {
  matrix[1, 1] G;
}
parameters {
  vector[r - 1] lambda;
  vector<lower=0.0>[r] V;
  cov_matrix[1] W;
}
transformed parameters {
  matrix[1, r] F;
  F[1, 1] <- 1;
  for (i in 1:(r - 1)) {
    F[1, i + 1] <- lambda[i];
  }
}
model {
  y ~ gaussian_dlm(F, G, V, W);
}
