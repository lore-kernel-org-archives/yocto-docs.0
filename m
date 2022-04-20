Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06898C63707
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.8955.1650467103994483937
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 08:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id B110F6000B;
	Wed, 20 Apr 2022 15:05:01 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 3/4] docs: sphinx-static: switchers.js.in: fix broken
 switcher for branches
Date: Wed, 20 Apr 2022 17:04:43 +0200
Message-Id: <20220420150444.174380-3-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420150444.174380-1-foss+yocto@0leil.net>
References: <20220420150444.174380-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2810

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The switcher expects URL subpath to match the "release" used by sphinx
to build the documentation. Branches, however, are put in a subpath
after their name (e.g. dunfell) while sphinx sets the "release" to
X.Y.999. This means the switcher cannot replace correctly the path to
switch between releases/versions.

Let set_versions.py inject the list of release names into the
switchers.js.in file so it can check whether the subpath is one of the
release names in which case it needs to be stripped.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2:
 - renamed all_versions to all_releases
 - renamed ALL_VERSIONS_PLACEHOLDER to ALL_RELEASES_PLACEHOLDER
 - renamed name local variable to release

 documentation/set_versions.py               |  3 +++
 documentation/sphinx-static/switchers.js.in | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index fc179ee19..261c1eeb3 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -203,6 +203,9 @@ versions = []
 with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
     lines = r.readlines()
     for line in lines:
+        if "ALL_RELEASES_PLACEHOLDER" in line:
+            w.write(str(list(release_series.keys())))
+            continue
         if "VERSIONS_PLACEHOLDER" in line:
             w.write("    'dev': { 'title': 'dev (%s)', 'obsolete': false,},\n" % release_series[devbranch])
             for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 7eb0c2ff3..1e523a188 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -9,6 +9,10 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
 (function() {
   'use strict';
 
+  var all_releases =
+	ALL_RELEASES_PLACEHOLDER
+  ;
+
   var switcher_versions = {
     VERSIONS_PLACEHOLDER
   };
@@ -155,6 +159,14 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
         var new_url = docroot + new_versionpath + url.replace(docroot, "");
         var fallback_url = docroot + new_versionpath;
     } else {
+	// check for named releases (e.g. dunfell) in the subpath
+        $.each(all_releases, function(idx, release) {
+		if (docroot.endsWith('/' + release + '/')) {
+			current_version = release;
+			return false;
+		}
+	});
+
         var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
         var fallback_url = new_url.replace(url.replace(docroot, ""), "");
     }
-- 
2.35.1


