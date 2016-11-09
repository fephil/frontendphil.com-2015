// Load paths and gulp
import paths from '../config/paths.json'
import gulp from 'gulp'

// Specific task modules
import { argv as argv } from 'yargs'
import debug from 'gulp-debug'
import gulpif from 'gulp-if'
import htmlmin from 'gulp-htmlmin'

// HTML minify task
gulp.task('htmlmin', () => {
  return gulp.src(paths.build + '**/*.html')
  .pipe(gulpif(argv.debug === true, debug({title: 'HTML Minified:'})))
  .pipe(gulpif(argv.production === true,
    htmlmin({
      collapseWhitespace: true
    })
  ))
  .pipe(gulp.dest(paths.build))
})
