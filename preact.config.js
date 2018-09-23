export default function (config, env, helpers) {
    if (process.env.NODE_ENV === 'production') {
        config.output.publicPath = '/preact-pixel/';
    }
}
