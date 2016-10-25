#!/usr/bin/env php
<?php

$HOME = getenv("HOME");

// Dynamic hosts through Pantheon mean constantly checking interactively
// that we mean to connect to an unknown host. We ignore those here.
$ssh_config = "$HOME/.ssh/config";
$ssh_config_contents = "";
if (file_exists($ssh_config)) {
  $ssh_config_contents = file_get_contents($ssh_config);
}
if (!preg_match('/StrictHostKeyChecking/', $ssh_config_contents)) {
  $ssh_config_contents .= "\nStrictHostKeyChecking no\n");
}
file_put_contents($ssh_config, $ssh_config_contents);

