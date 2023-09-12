<!DOCTYPE html>
<html>
<head>
    <title>Browser and IP Detection</title>
    <script>
        window.onload = function() {
            // Detecting browser
            var browserName = "Unknown";

            if (window.navigator.userAgent.indexOf("Chrome") != -1) {
                browserName = "Google Chrome";
            } else if (window.navigator.userAgent.indexOf("Safari") != -1) {
                browserName = "Apple Safari";
            } else if (window.navigator.userAgent.indexOf("Firefox") != -1) {
                browserName = "Mozilla Firefox";
            } else if (window.navigator.userAgent.indexOf("MSIE") != -1 || !!document.documentMode === true) {
                browserName = "Microsoft Internet Explorer"; // Or IE
            } else if (window.navigator.userAgent.indexOf("Edge") != -1) {
                browserName = "Microsoft Edge"; // Edge (Based on chromium so detect as Chrome)
            } else if (window.navigator.userAgent.indexOf("Opera") != -1 || window.navigator.userAgent.indexOf('OPR') != -1) {
                browserName = "Opera";
            }

            document.getElementById('browser').innerText = 'Browser: ' + browserName;

            // Detecting public IP
            fetch('https://ipinfo.io', {
                    method: 'GET',
                    headers: {
                        "Accept": "application/json"
                    },
                })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('ip').innerText = 'IP: ' + data.ip;
                });

            // Date and time of execution
            var currentdate = new Date();
            var datetime = "Current Date and Time: " + currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear() + " @ "  
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes() + ":" 
                + currentdate.getSeconds();

            document.getElementById('datetime').innerText = datetime;
        }
    </script>
</head>
<body>
    <h1 id="datetime"></h1>
    <h1 id="browser"></h1>
    <h1 id="ip"></h1>
</body>
</html>
