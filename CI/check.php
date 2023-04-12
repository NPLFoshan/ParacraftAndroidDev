<?php

if (file_exists('lock')) {
    echo('BUILDING');
} else {
    echo('SUCCESS');
}
