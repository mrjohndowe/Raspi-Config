<?php

require 'vendor/autoload.php';

use BigFish\PDF417\PDF417;
use BigFish\PDF417\Renderers\ImageRenderer;
use BigFish\PDF417\Renderers\SvgRenderer;

// Text to be encoded into the barcode
$text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
imperdiet sit amet magna faucibus aliquet. Aenean in velit in mauris imperdiet
scelerisque. Maecenas a auctor erat.';

// Encode the data, returns a BarcodeData object
$pdf417 = new PDF417();
$data = $pdf417->encode($text);

// Create a PNG image
$renderer = new ImageRenderer([
    'format' => 'png'
]);

$image = $renderer->render($data);

// Create an SVG representation
$renderer = new SvgRenderer([
    'color' => 'black',
]);

$svg = $renderer->render($data);


?>