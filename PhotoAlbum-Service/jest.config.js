module.exports = {
    testEnvironment: 'node',
    coverageDirectory: 'coverage',
    collectCoverageFrom: [
      'src/**/*.js',
      '!src/**/*.test.js', 
      '!src/config/**', 
    ],
    clearMocks: true,
    moduleFileExtensions: ['js', 'json'],
    testMatch: [
      '**/__tests__/**/*.js?(x)',
      '**/?(*.)+(spec|test).js?(x)'
    ],
    roots: [
      '<rootDir>/src'
    ],
    verbose: true,
  };
  