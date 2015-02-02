#!/usr/bin/env php
<?php
# php function for php.net
$php_function = $argv[1];

# ignore these sections from php.net
$php_ignore_sections = array_key_exists(2, $argv) ? explode(',',$argv[2]) : "";

# Data to cache files
$data_directory = __DIR__."/../data";

# What URL are we requesting?
$php_url = "http://php.net/$php_function";

# Where are we putting the response
$data_file = "$data_directory/$php_function.json";
$data_output = "";

# Pattern to match important php.net content
$pattern = "/\*{4,6}\ ([a-zA-Z_ ]+)\ \*{4,6}\n(.*?)(?=\*{4,6})/s";

# Let's get rid of those common HTML entities as well
$entities = ["&mdash;", "&quot;"];
$entities_replacement = ["-", "\""];

###############################
# Check if we have data already
###############################
$cached_phpnet_response = [];

# Does our directory exist?
if (!is_dir($data_directory)) throw new Exception("Directory $data_directory not found.");

# Have we requested this PHP function before?
if (file_exists($data_file)) $cached_phpnet_response = json_decode(file_get_contents($data_file), TRUE);

###############################
# If we don't, let's get it
###############################
if (empty($cached_phpnet_response)) {
    $curl_txt_response = shell_exec("curl -s $php_url | html2text");

    if (empty($curl_txt_response)) throw new Exception("Trouble retrieving command $php_function. Either php.net isn't accessible or the command doesn't exist.");

    # TODO: Add checks for bad curl response later

    # Extract out the sections using regex
    preg_match_all($pattern, $curl_txt_response, $sections);
    $section_headers = $sections[1];
    $section_body = $sections[2];

    # Build the response to something useful
    foreach ($section_headers as $position => $title) {
        # Rid ourselves of those pesky HTML entities
        $body = str_replace($entities, $entities_replacement, $section_body[$position]);
        
        # Stored in a format for later use
        $cached_phpnet_response[$title] = "$title\n\n$body";
    }

    # Cache the response for later use
    $cached_json = json_encode($cached_phpnet_response, JSON_PRETTY_PRINT);
    file_put_contents($data_file, $cached_json, LOCK_EX);
}

###############################
# Construct Output Requested
###############################
foreach ($cached_phpnet_response as $title => $output_data) {
    # Did we want to ignore this section? If so, continue
    $check_title = str_replace(' ', '_', $title);
    if (in_array($check_title, $php_ignore_sections)) continue;

    # Build up the output file
    $data_output .= "$output_data\n\n";
}

echo $data_output;

echo "\n----------END----------\n";

?>
