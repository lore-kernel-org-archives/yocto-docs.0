Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA416C63701
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10568.1649936034649699775
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 04:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id D9F414000D;
	Thu, 14 Apr 2022 11:33:52 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 2/3] docs: set_versions.py: add information about obsolescence
 of a release
Date: Thu, 14 Apr 2022 13:33:26 +0200
Message-Id: <20220414113327.176534-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414113327.176534-1-foss+yocto@0leil.net>
References: <20220414113327.176534-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2768

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This adds support for marking releases as obsolete to make the
detection algorithm smarter (in a later commit) than just checking if
it's older than dunfell.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py               |  6 +++---
 documentation/sphinx-static/switchers.js.in | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index fceff4dbc..0fcbb993b 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -207,7 +207,7 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
     lines = r.readlines()
     for line in lines:
         if "VERSIONS_PLACEHOLDER" in line:
-            w.write("    'dev': 'dev (%s)',\n" % release_series[devbranch])
+            w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
             for branch in activereleases:
                 if branch == devbranch:
                     continue
@@ -219,9 +219,9 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                 if versions[-1] != "0":
                     version = version + "." + versions[-1]
                 versions.append(version)
-                w.write("    '%s': '%s',\n" % (version, version))
+                w.write("    '%s': {'title': '%s', 'obsolete': %s,},\n" % (version, version, str(branch == ourseries).lower()))
             if ourversion not in versions and ourseries != devbranch:
-                w.write("    '%s': '%s',\n" % (ourversion, ourversion))
+                w.write("    '%s': {'title': '%s', 'obsolete': true,},\n" % (ourversion, ourversion))
         else:
             w.write(line)
 
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index e7ef2ce5f..5ae0325e6 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -65,15 +65,15 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
   function build_version_select(current_series, current_version) {
     var buf = ['<select>'];
 
-    $.each(all_versions, function(version, title) {
+    $.each(all_versions, function(version, vers_data) {
       var series = version.substr(0, 3);
       if (series == current_series) {
         if (version == current_version)
-            buf.push('<option value="' + version + '" selected="selected">' + title + '</option>');
-        else
-            buf.push('<option value="' + version + '">' + title + '</option>');
+            buf.push('<option value="' + version + '" selected="selected">' + vers_data["title"] + '</option>');
+	      else
+            buf.push('<option value="' + version + '">' + vers_data["title"] + '</option>');
       } else {
-        buf.push('<option value="' + version + '">' + title + '</option>');
+        buf.push('<option value="' + version + '">' + vers_data["title"] + '</option>');
       }
     });
 
@@ -223,7 +223,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
       $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
       $('#outdated-warning').css('padding', '.5em');
     } else if (release != "dev") {
-      $.each(all_versions, function(version, title) {
+      $.each(all_versions, function(version, vers_data) {
         var series = version.substr(0, 3);
         if (series == current_series && version != release) {
           $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
-- 
2.35.1


