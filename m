Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC85F34C49
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:00:30 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269932.1776081621565349109
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 05:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pViO3ASr;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F9A4C5B19E
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 12:00:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0CD55FFB9
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 12:00:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0391104500A2;
	Mon, 13 Apr 2026 14:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776081618; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=cmhmtjB3zErU2OjiRkvlaLM0wvN/OxubRi11bepSa50=;
	b=pViO3ASr6yOL+kB/cTaohh5R65Y3fu+812uA/lv6SG7EqPVffJiKQXX7loPqdg3MOmWayr
	NBS9dUz1+PcrqEH+1J99pP1YFEF8Q5LqhGF4JWd3ZYQs50apf97mBwtOPcqz4IU9ufvuc9
	wXe2ouXP3xop6WDfTUdlH9z83kcvxSpLz9MmKPkNkTQ1njKfFir1h4xWgpNdLgACJUhkFM
	Skl6tyRLP03oWMDLT/Jvnd4ntq+bEX6HAmM5Erlxih7diDukJ2x6/UkxAEFTAA5SHsuOEx
	zNYk0nnl4GD3HiY8W6qZqqpsuKBz9Yev6tN8vrjpaZSWN2jq62skK2Txcnv6FA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 13 Apr 2026 14:00:13 +0200
Subject: [PATCH] sphinx-static/switchers.js.in: add an "Outdated releases"
 entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-menu-outdated-releases-v1-1-f8d0d5f297c8@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTuQplCrVxEXsfmjI5pKJilC6
 d2b6vJbvLeQIgmUzs1CCbOoTLGiPTQ0Ply8g8VXkzW2N1078Bux8FSydxmeE15wCmVrwhBwNH1
 38lTjT0KQ7298uf6t5fbEmPcbresGHHk5xnoAAAA=
X-Change-ID: 20260318-menu-outdated-releases-20f8fe70639d
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=l3CIbUIH0BsfDEc9VkkdnU2H/dDOlGFETaFKE8fxD48=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp3NrRYpx0Mtx2umaXf/vBWn2CPJB2AYAZ6ximk
 nm4uBoEjriJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadza0QAKCRDRgEFAKaOo
 NhVID/9rTpPisI9axR6svPbUuTXWBOQv/UcKQS8dBpFZotb6BmGEnaEZNYzcND84bMQL/ztOo+U
 84TQ/MV1MYRbY5HipvBFDaoVvm8tXjPiieapwhNj/r/3VDLinZBgFKaDuQpIsQ+3mT3Hs0N3YPj
 bAWqJStFmmDIRJ3KE9tamQAlqy7ly8IxxuboUUfo6+pPeZAxZYVjc/iqeRFC6cPomVtUjfUfF9/
 rsTCsX9ST1qJuWxA402KwMtCwO0SPk4wsWnCDUfsCA8Q24KbNlRWf3gt7TbJ7QPgJHdnFxVTlxQ
 uNcLQOiC68lzkH16gnDyGkHGVl2iLOijzmCmFanuQkPiVBNjXFpr3MT/trOXfdfRYOnwxQmsBcu
 DD3yieQnQ8C4Z0fwOllDfxHwySe5/Us0cvYgR4u7rdxKUB+2G/XUYoTJAyffZW3RoyxIQBBP8vv
 u0KfnRBeMXOj2LyyYcziD69wpNKP4vN7DTb/XcXcymHY+FnKCaIOTiJRWEEteheGidRyP12k2YL
 mmbJll0GfA7a6lyOfo/tQQn+foq6gf6z+1fPKoIned5EHWwhScyvKc2B2lC/LzwR7YW6WazXgsq
 Y2UbnMYLF4fMmCABM/7+mTKQ7EnZ8Md2j6F55gy35veBLTzmq4CdWP3lBhE8ZQXT6hkCCQXzTHQ
 kknUwN1oLFP31Mw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 12:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9253

To improve discoverability, add an entry to the switcher menu pointing
to the outdated releases pages. With this, this menu can be a starting
point to go any version of the documentation (both supported and
outdated releases).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sphinx-static/switchers.js.in | 32 ++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index b08cc12bc..85b00f63c 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -71,9 +71,16 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
   }
 
   function build_version_select(current_version) {
+    // Note: the logic for switching to another version of the documentation is
+    // done in on_version_switch(). Here we only populate the switcher menu.
+
     var buf = ['<select>'];
 
-    // Start by pushing the versions from the the switcher_versions array,
+    // Add a special "Outdated release manuals" entry here that points to the "Outdated
+    // release manuals" section
+     buf.push('<option value="outdated" selected="selected">Outdated release manuals</option>');
+
+    // Start by pushing the versions from the switcher_versions array,
     // unless our current version matches one of them, in which case this is
     // done last.
     $.each(switcher_versions, function (version, vers_data) {
@@ -204,17 +211,22 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
       current_version = all_releases[current_version_split[0]]['codename'].toLowerCase();
     }
 
-    if (selected_version == latest_version) {
-      // default landing page selected, empty the version
-      var new_versionpath = '';
-    } else if (selected_version.includes("-tip")) {
-      var branch_name = all_releases[selected_version.split("-")[0]]['codename'].toLowerCase();
-      var new_versionpath = branch_name + '/';
-    } else {
-      var new_versionpath = selected_version + '/';
+    if (selected_version != "outdated") {
+       if (selected_version == latest_version) {
+         // default landing page selected, empty the version
+         var new_versionpath = '';
+       } else if (selected_version.includes("-tip")) {
+         var branch_name = all_releases[selected_version.split("-")[0]]['codename'].toLowerCase();
+         var new_versionpath = branch_name + '/';
+       } else {
+         var new_versionpath = selected_version + '/';
+       }
     }
 
-    if (docroot.endsWith("dev/")) {
+    if (selected_version == "outdated") {
+       var new_url = docroot + "releases.html#outdated-release-manuals";
+       var fallback_url = docroot;
+    } else if (docroot.endsWith("dev/")) {
       var new_url = url.replace("/dev/", "/" + new_versionpath);
       var fallback_url = new_url.replace(url.replace(docroot, ""), "");
     } else if (docroot.endsWith(current_version + "/") == false) {

---
base-commit: 2da8e6334e3d3362c9177f78a1216156417903fc
change-id: 20260318-menu-outdated-releases-20f8fe70639d


