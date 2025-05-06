const gulp        = require('gulp');
const sass        = require('gulp-dart-sass');
const postcss     = require('gulp-postcss');
const autoprefixer= require('autoprefixer');
const cssnano     = require('cssnano');
const sourcemaps  = require('gulp-sourcemaps');

function themes() {
  return gulp.src('css/theme/*.scss')
    .pipe(sourcemaps.init())                                  // Initialize sourcemaps :contentReference[oaicite:3]{index=3}
    .pipe(sass().on('error', sass.logError))                  // Compile SCSS → CSS :contentReference[oaicite:4]{index=4}
    .pipe(postcss([ autoprefixer(), cssnano() ]))             // Autoprefix & minify :contentReference[oaicite:5]{index=5}
    .pipe(sourcemaps.write('.'))                              // Write sourcemap files alongside CSS :contentReference[oaicite:6]{index=6}
    .pipe(gulp.dest('dist/theme'));                           // Output to dist/theme/ :contentReference[oaicite:7]{index=7}
}

exports.themes = themes;
exports.default = themes;
