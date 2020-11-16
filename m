Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.31833.1605515630891896579
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 00:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DXeCLlBJ;
 spf=pass (domain: linaro.org, ip: 209.85.219.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f180.google.com with SMTP id i193so14935332yba.1
        for <docs@lists.yoctoproject.org>; Mon, 16 Nov 2020 00:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=7ThPy+9Tnkm9u+YUea+3JmMjlU024QwZc9jgbkiMQFw=;
        b=DXeCLlBJa4Fec6w2Uy28qwDe0oGa1fB6OkBQNvz1UN3R4wJBeTk+5Zu4/Eadut6axw
         mK99tZQP3WpLm9pTxrtD6mU68AR6xh3Qr83dVhvkB/YK5+W7j0e+av4IWN3oI85WHJJE
         n9/1FLb7flNNQMW2k1x6m/V7mRBeJsiDmxfcN60Ko+BrSDIlo7Il9ovSJjJAGUQVvD08
         VLf3W20YJKPQ7hO95UzL4JjivHyIrnviv0QMPFwAoADbkvn5sW/UIXUrFt28hgHfivIs
         j9tzdK23LGLE7AJSK0LFniI/jm6wy4Nup6hSvyZ8mE1medKzpzjA5WA7+cOSlGHGprdA
         peWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7ThPy+9Tnkm9u+YUea+3JmMjlU024QwZc9jgbkiMQFw=;
        b=C43d42OoO+B7/G7BARMv1BOa+t5VRT0gPHrhJO1f71zROwW0lvdWg4v55nNSsfSLVM
         gudGAmtqutC3IVSN9GkDJs9UUqrfcu7Eo9QN7med2xvCMspn+1JzV2uc/6ADxmgk2Zqx
         NK1kKKZt6Q7Puz/6VWdvSb4xAbruQDeXAw2aZ7NzfgxWJwj0uwMECkonXPT/I69IKmgB
         LgdhVcj1kI94ZOnRfh8aJO4AcMYDmT84WnYkDDE6iMxhJ7zoSbfooRj7Qr+a3NMnQBoq
         yTMclcFhf6FB/RIFsTFM5cGfqALubgHRshhqTGGVu5MMlhibD2y5pQ5vARs9edHXKF6b
         navA==
X-Gm-Message-State: AOAM530apQZaYXrPRItsUSH+v9e8sA1bebch3aRFSO63Th00B5M5rofs
	mWV6cal5DwcR1uO3MafdQN4UEj+WnLs41dK6OFfgH41JeVhY+XL7
X-Google-Smtp-Source: ABdhPJzRe9AxsnucEKg4/Q7ERJjgGG9OroX5DFwrOFVn+FGU9OCS9bZCgin4TsTlu6p/zmlvDhpcSQsLaNl4MfX5loY=
X-Received: by 2002:a25:ab2c:: with SMTP id u41mr12538953ybi.133.1605515629511;
 Mon, 16 Nov 2020 00:33:49 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 16 Nov 2020 09:33:38 +0100
Message-ID: <CAP71Wjy=BnM6bpSGE+WzW4LiUfHRQrpQCCt4=4_hd3+d0CHFOg@mail.gmail.com>
Subject: Docs website dropdown menu
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

hey,

on the new website, we have the dropdown menu that allows us to switch
back and forth between the 'individual pages' vs 'mega manual' and
between docs versions.

It's implemented in a piece of javascript , in file switchers.js.
That file has a list of docs version to 'show', and it's slightly
painful (and wrong?) to maintain the list of 'active' versions to show
on the website in docs sources.

I've been trying to decorelate the list of 'versions' from the
implementation. Here is something that more or less works (it's not
fully tested yet), but I wanted to get feedback first to see if it's
going in the right direction.

So all_versions becomes a 'table' that includes all information about
our releases. For each release, we can set attributes:
* version is the actual version
* name is an alternate name to show (we use version if name is not defined)
* show is set to 'yes' when we want that version to appear in the dropdown menu
* docbook is set to 'yes' for docs built before sphinx (it's used when
we switch to mega-manual page)
* state can be 'outdated' or 'obsolete' to display the respective warning.

Then in the .js file, we simply read data from all_versions. The next
step would be to put the definition of all_versions in another file,
outside of git. And the release manager would update this file as
needed.

thoughts?

nico

Note: I have an idea to get rid of 'docbook' attribute eventually...
but that's not important now.


diff --git a/documentation/sphinx-static/switchers.js
b/documentation/sphinx-static/switchers.js
index fe9841b10..8b1c03584 100644
--- a/documentation/sphinx-static/switchers.js
+++ b/documentation/sphinx-static/switchers.js
@@ -1,13 +1,28 @@
 (function() {
   'use strict';

-  var all_versions = {
-    'dev': 'dev (3.3)',
-    '3.2': '3.2',
-    '3.1.3': '3.1.3',
-    '3.0.4': '3.0.4',
-    '2.7.4': '2.7.4',
-  };
+  var all_versions = [
+    {'version' : 'dev', 'name' : 'dev (3.3)', 'show' : 'yes',
'docbook' : 'yes'},
+
+    {'version' : '3.2',   'show' : 'yes'},
+
+    {'version' : '3.1.3', 'show' : 'yes', 'docbook' : 'yes'},
+    {'version' : '3.1.2', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+    {'version' : '3.1.1', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+    {'version' : '3.1',   'show' : 'yes', 'docbook' : 'yes', 'state'
: 'outdated'},
+
+    {'version' : '3.0.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'obsolete'},
+    {'version' : '3.0.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '3.0',   'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+
+    {'version' : '2.7.4', 'show' : 'yes', 'docbook' : 'yes', 'state'
: 'obsolete'},
+    {'version' : '2.7.3', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7.2', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7.1', 'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+    {'version' : '2.7',   'show' : 'no', 'docbook' : 'yes', 'state' :
'obsolete'},
+  ];

   var all_doctypes = {
       'single': 'Individual Webpages',
@@ -61,18 +76,22 @@
   function build_version_select(current_series, current_version) {
     var buf = ['<select>'];

-    $.each(all_versions, function(version, title) {
-      var series = version.substr(0, 3);
-      if (series == current_series) {
-        if (version == current_version)
+    $.each(all_versions, function(index, obj) {
+      if (obj.show == 'yes') {
+        var version = obj.version;
+        var title = obj.name ? obj.name : obj.version;
+        var series = version.substr(0, 3);
+        if (series == current_series) {
+          if (version == current_version)
             buf.push('<option value="' + version + '"
selected="selected">' + title + '</option>');
-        else
+          else
             buf.push('<option value="' + version + '">' + title + '</option>');

-        if (version != current_version)
+          if (version != current_version)
             buf.push('<option value="' + current_version + '"
selected="selected">' + current_version + '</option>');
-      } else {
-        buf.push('<option value="' + version + '">' + title + '</option>');
+        } else {
+          buf.push('<option value="' + version + '">' + title + '</option>');
+        }
       }
     });

@@ -179,14 +198,19 @@
     if (selected_doctype == 'mega') {
       var docroot = get_docroot_url()
       var current_version = DOCUMENTATION_OPTIONS.VERSION;
-      // Assume manuals before 3.2 are using old docbook mega-manual
-      if (ver_compare(current_version, "3.2") < 0) {
-        var new_url = docroot + "mega-manual/mega-manual.html";
-      } else {
-        var new_url = docroot + "singleindex.html";
-      }
-    } else {
-      var new_url = url.replace("singleindex.html", "index.html")
+
+      var new_url = docroot + "singleindex.html";
+      $.each(all_versions, function(index, obj) {
+          if (obj.version == current_version) {
+            if (obj.docbook == 'yes') {
+              new_url = docroot + "mega-manual/mega-manual.html";
+            }
+            return false; // break from $.each
+          }
+        })
+        }
+    else {
+      var new_url = url.replace("singleindex.html", "index.html");
     }

     if (new_url != url) {
@@ -218,17 +242,18 @@
     $('.doctype_switcher_placeholder').html(doctype_select);
     $('.doctype_switcher_placeholder select').bind('change',
on_doctype_switch);

-    if (ver_compare(release, "3.1") < 0) {
-      $('#outdated-warning').html('Version ' + release + ' of the
project is now considered obsolete, please select and use a more
recent version');
-      $('#outdated-warning').css('padding', '.5em');
-    } else if (release != "dev") {
-      $.each(all_versions, function(version, title) {
-        var series = version.substr(0, 3);
-        if (series == current_series && version != release) {
-          $('#outdated-warning').html('This document is for outdated
version ' + release + ', you should select the latest release version
in this series, ' + version + '.');
-          $('#outdated-warning').css('padding', '.5em');
+    $.each(all_versions, function(index, obj) {
+        if (obj.version == release) {
+          if (obj.state == 'obsolete') {
+            $('#outdated-warning').html('Version ' + release + ' of
the project is now considered obsolete, please select and use a more
recent version');
+            $('#outdated-warning').css('padding', '.5em');
+          }
+          else if (obj.state == 'outdated') {
+            $('#outdated-warning').html('This document is for
outdated version ' + release + ', you should select the latest release
version in this series, ' + obj.version + '.');
+            $('#outdated-warning').css('padding', '.5em');
+          }
+          return false; // break from $.each
         }
-      });
-    }
+      })
   });
 })();
