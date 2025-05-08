const autoprefixer = require('autoprefixer')
const connect = require('gulp-connect')
const cssnano = require('cssnano')
const gulp = require('gulp')
const path = require('path')
const postcss = require('gulp-postcss')
const rename = require('gulp-rename')
const sass = require('gulp-dart-sass')
const sourcemaps = require('gulp-sourcemaps')
const fs = require('fs')
const through2 = require('through2')

gulp.task('build-themes', function () {
	return gulp.src('src/css/theme/**/*.scss')
		.pipe(sourcemaps.init())
		.pipe(sass().on('error', sass.logError))
		.pipe(postcss([autoprefixer(), cssnano()]))
		.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest('dist/css/theme'))
		.pipe(connect.reload())
})

const template = fs.readFileSync('src/templates/reveal.html', 'utf-8');

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
gulp.task('copy-assets', function () {
	return gulp.src('slides/**/assets/**/*')
		.pipe(through2.obj(function (file, _, cb) {
			if (file.isDirectory()) {
				cb(null, file);
				return;
			}
			const newPath = path.join('slides', path.relative('slides', file.path));
			file.path = newPath;
			file.contents = fs.readFileSync(file.path); // Ensure file contents are preserved
			cb(null, file);
		}
		))
		.pipe(gulp.dest('dist/slides'))
		.pipe(connect.reload())
})

gulp.task('watch', function () {
	gulp.watch('src/css/**/*.scss', gulp.series('build-themes'))
	gulp.watch('slides/**/*.md', gulp.series('render-slides'))
	gulp.watch('slides/**/assets/**/*', gulp.series('copy-assets'))
	gulp.watch('src/templates/*.html', gulp.series('render-slides'))
})

gulp.task('connect', function () {
	connect.server({
		livereload: true,
		port: 8000,
		root: ['dist/slides', 'dist/css', 'node_modules']
	})
})

// Clean the dist folder
gulp.task('clean', function () {
	return gulp.src('dist', { read: false, allowEmpty: true })
		.pipe(require('gulp-clean')())
})

gulp.task('build', gulp.parallel('build-themes', 'render-slides', 'copy-assets'))
gulp.task('serve', gulp.series('build', 'connect', 'watch'))
gulp.task('default', gulp.series('build', 'connect', 'watch'))