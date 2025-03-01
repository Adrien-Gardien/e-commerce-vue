module.exports = {
  apps: [
    {
      name: "frontend",
      script: "./frontend/server.cjs",
      env: {
        NODE_ENV: "production",
      },
      instances: 1,
      exec_mode: "cluster",
      watch: false,
      log_file: "./logs/frontend.log",
      out_file: "./logs/frontend-out.log",
      error_file: "./logs/frontend-error.log",
    },
    {
      name: "auth-service",
      script: "./services/auth-service/src/app.js",
      env: {
        NODE_ENV: "production",
      },
      instances: 1,
      exec_mode: "cluster",
      watch: false,
      log_file: "./logs/auth-service.log",
      out_file: "./logs/auth-service-out.log",
      error_file: "./logs/auth-service-error.log",
    },
    {
      name: "product-service",
      script: "./services/product-service/src/app.js",
      env: {
        NODE_ENV: "production",
      },
      instances: 1,
      exec_mode: "cluster",
      watch: false,
      log_file: "./logs/product-service.log",
      out_file: "./logs/product-service-out.log",
      error_file: "./logs/product-service-error.log",
    },
    {
      name: "order-service",
      script: "./services/order-service/src/app.js",
      env: {
        NODE_ENV: "production",
      },
      instances: 1,
      exec_mode: "cluster",
      watch: false,
      log_file: "./logs/order-service.log",
      out_file: "./logs/order-service-out.log",
      error_file: "./logs/order-service-error.log",
    },
  ],
};
