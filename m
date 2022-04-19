Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEC5C4707F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web09.2115.1650388071332614464
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 10:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A9C3E0002;
	Tue, 19 Apr 2022 17:07:46 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [RFC PATCH] docs: update Bitbake objects.inv location for master
 branch
Date: Tue, 19 Apr 2022 19:07:24 +0200
Message-Id: <20220419170730.124287-1-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2789

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

master branch of Bitbake is now located at docs.yoctoproject.org/dev
instead of docs.yoctoproject.org so let's update the switchers and
set_versions.py to reflect that change.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/set_versions.py               | 2 +-
 documentation/sphinx-static/switchers.js.in | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 8ae02b11f..0086e9bea 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -128,7 +128,7 @@ else:
     if branch == "master":
         ourseries = devbranch
         docconfver = "dev"
-        bitbakeversion = ""
+        bitbakeversion = "dev"
     elif branch in release_series:
         ourseries = branch
         if branch in bitbake_mapping:
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 408e23a71..4966b3033 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -149,11 +149,9 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     var docroot = get_docroot_url()
 
     var new_versionpath = selected_version + '/';
-    if (selected_version == "dev")
-        new_versionpath = '';
 
-    // dev versions have no version prefix
-    if (current_version == "dev") {
+    // latest tag is also the default page (without version information)
+    if (docroot.endsWith(current_version + '/') == false) {
         var new_url = docroot + new_versionpath + url.replace(docroot, "");
         var fallback_url = docroot + new_versionpath;
     } else {
-- 
2.35.1


