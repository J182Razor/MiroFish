import js from '@eslint/js'
import vuePlugin from 'eslint-plugin-vue'

export default [
  js.configs.recommended,
  ...vuePlugin.configs['flat/essential'],
  {
    files: ["**/*.{js,mjs,cjs,vue}"],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "module",
      globals: {
        console: "readonly",
        process: "readonly",
        Buffer: "readonly",
        __dirname: "readonly",
        __filename: "readonly",
        global: "readonly",
        window: "readonly",
        document: "readonly"
      }
    },
    rules: {
      "no-console": "warn",
      "no-debugger": "error",
      "no-unused-vars": "warn",
      "prefer-const": "error",
      "no-var": "error"
    }
  }
];