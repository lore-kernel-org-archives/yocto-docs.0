Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FCDC63704
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.8932.1650467102593791050
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 08:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 6C91E6000C;
	Wed, 20 Apr 2022 15:05:00 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v2 2/4] docs: sphinx-static: switchers.js.in: rename
 all_versions to switcher_versions
Date: Wed, 20 Apr 2022 17:04:42 +0200
Message-Id: <20220420150444.174380-2-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420150444.174380-1-foss+yocto@0leil.net>
References: <20220420150444.174380-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2808

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This array only contains versions that can be selected through the
dropdown menu for switching between supported versions.

Therefore, let's rename it to switcher_versions to make its usecase
clearer.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/sphinx-static/switchers.js.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 4966b3033..7eb0c2ff3 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -9,7 +9,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
 (function() {
   'use strict';
 
-  var all_versions = {
+  var switcher_versions = {
     VERSIONS_PLACEHOLDER
   };
 
@@ -65,7 +65,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
   function build_version_select(current_series, current_version) {
     var buf = ['<select>'];
 
-    $.each(all_versions, function(version, vers_data) {
+    $.each(switcher_versions, function(version, vers_data) {
       var series = version.substr(0, 3);
       if (series == current_series) {
         if (version == current_version)
@@ -218,7 +218,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
 
     if (release != "dev") {
-      $.each(all_versions, function(version, vers_data) {
+      $.each(switcher_versions, function(version, vers_data) {
         var series = version.substr(0, 3);
         if (series == current_series) {
           if (version != release) {
-- 
2.35.1


