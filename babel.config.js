/**
 * This file is used only for jest at the moment
 * Vite does NOT use this file
 */

module.exports = (api) => {
  const validEnv = ['development', 'test', 'production'];
  const currentEnv = api.env();
  const isTestEnv = api.env('test');

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      `${'Please specify a valid `NODE_ENV` or '
      + '`BABEL_ENV` environment variables. Valid values are "development", '
      + '"test", and "production". Instead, received: '}${JSON.stringify(currentEnv)}.`,
    );
  }

  // Does not change anything if is not test env
  return isTestEnv ? {
    presets: [
      [
        '@babel/preset-env',
        {
          targets: {
            node: 'current',
          },
        },
      ],
    ],
    plugins: [
      // Fix jest use with vite
      // https://github.com/vitejs/vite/issues/1149#issuecomment-775033930
      function () {
        return {
          visitor: {
            MetaProperty(path) {
              path.replaceWithSourceString('process');
            },
          },
        };
      },
    ],
  } : {};
};
