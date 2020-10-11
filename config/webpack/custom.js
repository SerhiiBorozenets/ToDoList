module.exports = {
    resolve: {
        alias: {
            jquery: 'jquery/src/jquery',
            vue: 'vue/dist/vue.js',
            React: 'react',
            ReactDOM: 'react-dom',
            vue_resource: 'vue-resource/dist/vue-resource',
        }
    }
}

// config/webpack/environment.js
const { environment } = require('@rails/webpacker')
const customConfig = require('./custom')

// Set nested object prop using path notation
environment.config.set('resolve.extensions', ['.foo', '.bar'])
environment.config.set('output.filename', '[name].js')

// Merge custom config
environment.config.merge(customConfig)
environment.config.merge({ devtool: 'none' })

// Delete a property
environment.config.delete('output.chunkFilename')

module.exports = environment