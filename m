Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA474C63703
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10517.1649936035280870967
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 04:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.194,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 82AF240010;
	Thu, 14 Apr 2022 11:33:53 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 3/3] docs: sphinx-static: switchers.js.in: improve obsolete
 version detection
Date: Thu, 14 Apr 2022 13:33:27 +0200
Message-Id: <20220414113327.176534-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414113327.176534-1-foss+yocto@0leil.net>
References: <20220414113327.176534-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2769

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Based on additional information per release, specifically with the
obsolescence status of a release, the obsolescence detection can now be
much smarter than just checking if the release is older than dunfell.

This is required because with LTS (dunfell for example) releases, it is
now possible to have LTS releases that are older than obsolete releases.

This means obsolete releases need to be tracked and only the release
version cannot be used as an indicator of obsolescence.

Let's use the obsolete field of the per-release data in the all_versions
dictionary to display correct warning messages.

The warning message is first about outdated version if there's a newer
one available (*even* if it is for an obsolete release, e.g. 3.0.1 will
say it's outdated and should select 3.0.4 version instead), then if the
version is the last of the release, show a warning message if the
release is obsolete.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 5ae0325e6..408e23a71 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -219,15 +219,20 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     $('.doctype_switcher_placeholder').html(doctype_select);
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
 
-    if (ver_compare(release, "3.1") < 0) {
-      $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
-      $('#outdated-warning').css('padding', '.5em');
-    } else if (release != "dev") {
+    if (release != "dev") {
       $.each(all_versions, function(version, vers_data) {
         var series = version.substr(0, 3);
-        if (series == current_series && version != release) {
-          $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
-          $('#outdated-warning').css('padding', '.5em');
+        if (series == current_series) {
+          if (version != release) {
+            $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
+            $('#outdated-warning').css('padding', '.5em');
+            return false;
+          }
+          if (vers_data["obsolete"]) {
+            $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
+            $('#outdated-warning').css('padding', '.5em');
+            return false;
+          }
         }
       });
     }
-- 
2.35.1


