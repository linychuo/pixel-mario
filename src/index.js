import { render } from 'preact';
import Canvas from './canvas';

const C = "C";
const B = "B";
const S = "S";
const O = "O";
const Y = "Y";
const W = "W";
const _ = "_";

const pixelData = [
    [_, _, _, _, _, _, _, _, _, _, _, _, _, _],
    [_, _, _, _, C, C, C, C, C, _, _, _, _, _],
    [_, _, _, C, C, C, C, C, C, C, C, C, _, _],
    [_, _, _, B, B, B, S, S, B, S, _, _, _, _],
    [_, _, B, S, B, S, S, S, B, S, S, S, _, _],
    [_, _, B, S, B, B, S, S, S, B, S, S, B, _],
    [_, _, B, B, S, S, S, S, B, B, B, B, _, _],
    [_, _, _, _, S, S, S, S, S, S, S, _, _, _],
    [_, _, _, C, C, O, C, C, O, C, _, _, _, _],
    [_, _, C, C, C, O, C, C, O, C, C, C, _, _],
    [_, C, C, C, C, O, O, O, O, C, C, C, C, _],
    [_, W, W, C, O, Y, O, O, Y, O, C, W, W, _],
    [_, W, W, W, O, O, O, O, O, O, W, W, W, _],
    [_, W, W, O, O, O, O, O, O, O, O, W, W, _],
    [_, _, _, O, O, O, _, _, O, O, O, _, _, _],
    [_, _, B, B, B, _, _, _, _, B, B, B, _, _],
    [_, B, B, B, B, _, _, _, _, B, B, B, B, _]
];

const colors = {
    [C]: "255, 0, 0",
    [B]: "100, 50, 0",
    [S]: "255, 200, 150",
    [O]: "0, 0, 255",
    [Y]: "255, 255, 0",
    [W]: "255, 255, 255",
    [_]: "229, 230, 232"
};

render(
    <Canvas pixelData={pixelData} colors={colors} pixelSize="20px" background="white" />,
    document.body
);