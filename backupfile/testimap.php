<?php

$hostname = '{imap.gmail.com:993/imap/ssl}INBOX';
$username = 'abhishek@techowl.in';
$password = 'Ilovegirtiger@5831';

$inbox = imap_open($hostname, $username, $password);

if ($inbox) {
    echo 'Connected to IMAP server successfully.' . PHP_EOL;

    $emails = imap_search($inbox, 'ALL');

    if ($emails) {
        $output = '';

        // get the last 5 emails
        $emails = array_slice($emails, -5);

        foreach ($emails as $email_number) {
            $overview = imap_fetch_overview($inbox, $email_number, 0);
            $output.= 'Subject: ' . $overview[0]->subject . '\n';
            $output.= 'Date: ' . $overview[0]->date . '\n';
        }

        echo $output;
    } else {
        echo "Failed to retrieve emails." . PHP_EOL;
    }

    imap_close($inbox);
} else {
    echo 'Failed to connect to IMAP server: ' . imap_last_error();
}
?>

