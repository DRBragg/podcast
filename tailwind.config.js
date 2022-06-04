module.exports = {
  content: [
    './src/**/*.{html,md,liquid,erb,serb,rb}',
    './frontend/javascript/**/*.js',
  ],
  theme: {
    extend: {
      theme: {
        container: {
          center: true,
          padding: "1rem"
        },
      },
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
