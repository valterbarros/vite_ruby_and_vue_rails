import viteConfig  from "../../../vite.config";

process.env.VITE_RUBY_ASSET_HOST = 'http://127.0.0.1:4001';

console.log(viteConfig);

export default viteConfig;
