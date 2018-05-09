// @noflow

const path = require('path');

module.exports = {
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {loader: 'babel-loader'},
      },
      {
        test: /\.css$/,
        // exclude: /node_modules/,
        use: [
          {
            loader: 'style-loader',
          },
          {
            loader: 'css-loader',
            options: {importLoaders: 1},
          },
        ],
      },
    ],
  },
  entry: {
    index: './src/index.js',
  },
  output: {
    // Dump to parent directory so that these files are accessible by Spock
    path: path.resolve(__dirname, '../public/js'),
    filename: '[name].js',
  },
};
