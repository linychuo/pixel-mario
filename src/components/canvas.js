import { Component } from 'preact';
import Pixel from './pixel';
import styles from './style'

export default class Canvas extends Component {
    constructor() {
        super();
        this.onPixelClick = this.onPixelClick.bind(this);
    }

    getRandomColor() {
        return this.getRandom() + ', ' + this.getRandom() + ', ' + this.getRandom();
    }

    getRandom() {
        return Math.floor(Math.random() * 256);
    }

    onPixelClick(_color) {
        let newColor = this.getRandomColor();
        let _colors = this.props.colors;
        for (let c in _colors) {
            if (_colors[c] === _color) {
                _colors[c] = newColor;
            }
        }
        this.setState({
            colors: _colors
        })
    }

    render({ pixelData, colors, pixelSize, background }) {
        const main_style = {
            background: background,
        };
        const row_style = {
            height: pixelSize
        };
        return (
            <div style={main_style} class={styles.canvas_main}>
                {pixelData.map(row =>
                    <div style={row_style}>
                        {row.map(col =>
                            <Pixel color={colors[col]} size={pixelSize} handle={this.onPixelClick} />
                        )}
                    </div>
                )}
            </div>
        );
    }
}