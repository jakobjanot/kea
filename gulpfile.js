const autoprefixer   = require('autoprefixer')
const connect        = require('gulp-connect')
const cssnano        = require('cssnano')
const gulp           = require('gulp')
const path           = require('path')
const postcss        = require('gulp-postcss')
const rename         = require('gulp-rename')
const sass           = require('gulp-dart-sass')
const sourcemaps     = require('gulp-sourcemaps')
const fs             = require('fs')
const through2       = require('through2')

gulp.task('build-themes', function() {
  return gulp.src('css/theme/**/*.scss')
    .pipe(sourcemaps.init())
    .pipe(sass().on('error', sass.logError))
    .pipe(postcss([ autoprefixer(), cssnano() ]))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('dist/theme'))
    .pipe(connect.reload())
})

const template = fs.readFileSync('templates/reveal.html', 'utf-8');

gulp.task('render-slides', function () {
	return gulp.src('slides/**/*.md')
	.pipe(through2.obj(function (file, _, cb) {
		const md = file.contents.toString();
		const html = template.replace('{{ markdown }}', md);

		file.contents = Buffer.from(html);
		file.path = file.path.replace(/\.md$/, '.html');

		cb(null, file);
	}))	
    .pipe(rename(function (path) {
	  path.dirname = path.basename
	  path.basename = 'index'
	  path.extname = '.html'
	  return path
	}))
    .pipe(gulp.dest('dist/slides'))
    .pipe(connect.reload())
})

// copy the assets (images etc.) to the dist folder
gulp.task('copy-assets', function() {
  return gulp.src('slides/**/assets/**/*')
	.pipe(through2.obj(function (file, _, cb) {
		if (file.isDirectory()) {
			cb(null, file);
			return;
		}
		// get the path relative to the slides folder
		// and copy it to the dist folder
		const newPath = path.relative('slides', file.path);
		// make newPath absolute
		const newPathAbsolute = path.join('dist', newPath);
		// make sure the directory exists
		console.log('copying', file.path, 'to', newPath);
		file.path = newPath;
		cb(null, file);
	}
	))
	.pipe(gulp.dest('dist/slides'))
	.pipe(connect.reload())
})

gulp.task('watch', function() {
  gulp.watch('css/**/*.scss', gulp.series('build-themes'))
  gulp.watch('slides/**/*.md', gulp.series('render-slides'))
  gulp.watch('slides/**/assets/**/*', gulp.series('copy-assets'))
  gulp.watch('templates/*.html', gulp.series('render-slides'))
})

gulp.task('connect', function() {
  connect.server({
    livereload: true,
    port: 8000,
	root: ['dist', 'node_modules']
  })
})

gulp.task('build', gulp.parallel('build-themes', 'render-slides', 'copy-assets'))
gulp.task('serve', gulp.series('build', 'connect', 'watch'))
gulp.task('default', gulp.series('build', 'connect', 'watch'))