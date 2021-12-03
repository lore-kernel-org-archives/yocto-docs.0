Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD99C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:33:34 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.10090.1638527613283490803
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.231,
 mailfrom: foss@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay11.mail.gandi.net (Postfix) with ESMTPA id B5F9F100012;
	Fri,  3 Dec 2021 10:33:29 +0000 (UTC)
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] documentation: conf.py: add knob for loading appropriate
 objects.inv
Date: Fri,  3 Dec 2021 11:33:15 +0100
Message-Id: <20211203103315.57685-1-foss@0leil.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 10:33:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2220

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Yocto Project releases use a specific Bitbake release. Currently the
bitbake: mapping is pointing to the current master version of Bitbake
documentation. This is an issue if some links disappear over time and
someone is still building old documentation (which is the case on the YP
autobuilder for example). Also, the documentation at the current master
version of Bitbake might not be correct for the Yocto Project version
associated with the doc the user is currently looking at, potentially
causing confusion.

In master branch, nothing needs to be done. For release branches, the
bitbake_version variable needs to be set accordingly. See
https://wiki.yoctoproject.org/wiki/Releases for the mapping.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 documentation/conf.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 8e0847938..1bea18032 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -17,6 +17,7 @@ import sys
 import datetime
 
 current_version = "dev"
+bitbake_version = "" # Leave empty for development branch
 
 # String used in sidebar
 version = 'Version: ' + current_version
@@ -90,7 +91,7 @@ extlinks = {
 
 # Intersphinx config to use cross reference with Bitbake user manual
 intersphinx_mapping = {
-    'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
+    'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
 }
 
 # Suppress "WARNING: unknown mimetype for ..."
-- 
2.33.1


