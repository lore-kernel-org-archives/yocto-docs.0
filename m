Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E3FCAC59A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 12:21:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.31666.1757938904326549466
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Sep 2025 05:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hllxomVY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76BBBC8F1D2
	for <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:21:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4D496063F
	for <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:21:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03FB2102F2AC9;
	Mon, 15 Sep 2025 14:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757938902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/jUJk0NyVBvcCvw0JaIixXjPzQ3bwIT6zoNq+0phrxE=;
	b=hllxomVYiWIKwGyV3NTOFE+y9OZlyW+OL8MemmfF09Mw2ODyByfEa8CFLOzVRLyLM3Z8AJ
	TIwfg9HvViV6iHmbUVQnyyR4Mf6u1tZ1ssbOywpontR8o+wAwENymhNZ2vI8yKiBftSJ2r
	UM0blltZffhqWcxjQde4xbBJx59w81/nxNXye1l2u0DY4pWMAEyw4Lmrdmo8puLRJuZJxu
	6bGFKqy69lmM/UrPAFnaBGZA19fqshWGfd//UbEdFHONpI/kUwWURyb91DjlW0hCPZYgq4
	ZFTxEfFjq4DgfXib1yO6EJyAyR8hwhr7+fpzR//1Mha4C41hq9hTza2fRZrYMA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 15 Sep 2025 14:19:52 +0200
Subject: [PATCH] set_versions.py: add bitbake-active-releases special
 argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-bitbake-active-releases-v1-1-a2fdd3979965@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGcEyGgC/x3MQQqDMBBG4avIrDtgUk3Bq0gXSfyjg0UlI1IQ7
 25w+S3eO0mRBUpddVLGISrrUmBeFcXJLyNYhmKytW2MtR8Osgc/g33c5QBn/OAVysm0oQ0uvp1
 LVOotI8n/Offf67oBlf6qPmkAAAA=
X-Change-ID: 20241227-bitbake-active-releases-f15b5b6c366f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=GyvGHp8xTASp47otgcKVR442D39pMBtfD0cdxE9N4RY=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGjIBNWgNnqp6/8H76/HeRos5WhRbIxViR4rMf7sw3X4BLNMv
 okCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJoyATVAAoJENGAQUApo6g2ozUQAKmL
 c2pWnjcB+PaimZn0orqBiKQzOxJmNBvCogY5qBsq7tD3Sse3uNaOQzWPM9U6QrIgoBQymgO4/QW
 L+XYT0to9O7PpbdQuoQyz/15tLYyfR6neQWAuWpNdBsvOgXyERleGswyppLsZOVP3/NvdCLt/Ld
 /RSYRYhZTfeUnRd5KqfgTbsybyjkKBLT9zcWBGNxNeO//RZdlFq76K7MmC5XJdZluWqZvqh9NfI
 4YlP2LePkVWygu+c30CqghsLu1zn13jbmyFEljWrGooG1X2UAT1OcgW6SN8tfZVVrzHNtGVbiFn
 hlU8yEVO2KSAgv95eDDfxQQa/0nI2vLX8rKwgeuBFgOc7D+C2i5DL8Ah1cnsJL6YxGIr3yPL+OC
 1YsxjbtO6PcwdH4B3MwMAgMwBi0cFa6PZ6W+3/JKydOPjwbEIM+9CkvstaC+nuWpysYnni1O1qb
 wm65/yo+xdcXojHvnxrc2uTuTconWHaMbAkg7VUTsOmSAOZ+VY1PRtrzpYNOORM8zRtk4eZAAE6
 DqIqMr8edKBfbFvCwgL4kAT/EGuvgPnU86T5fMGpP9L+YDmocrxtZSN9t1cw5MP8z53hcD3wrKE
 LqykyrXsyPKkcyuymPgTIQQcR+nF9n3Jh/yoMu46GbneClljZV58O/ai5m+4U3VEJ66G4dlg66C
 n4yb4
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:21:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7514

We will use this in the autobuilder when generating the docs so we can
propagate the current active releases to bitbake, and have the correct
entries in bitbake's switchers.js.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
IMPORTANT: must be merged with following series/patches:
- "doc: fix the switchers menu" on the bitbake-devel list
- "scripts/run-docs-build: improvements for the bitbake menu" on the
  yocto-autobuilder-helper/yocto-patches list
---
 documentation/set_versions.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index b8dd4b1b9..36105fbc5 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -85,6 +85,17 @@ bitbake_mapping = {
     "dunfell" : "1.46",
 }
 
+# Special argument "bitbake-active-releases" prints the active bitbake releases
+# we define here, and exits. This is used in the autobuilder to pass this information to
+# bitbake's set_versions.py, which in turn sets bitbake's switchers.js
+# appropriately.
+if len(sys.argv) > 1:
+    if sys.argv[1] == "bitbake-active-releases":
+        for release in activereleases:
+            if release in bitbake_mapping:
+                print("%s,%s" % (bitbake_mapping[release], release))
+        exit(0)
+
 # 3.4 onwards doesn't have poky version
 # Early 3.4 release docs do reference it though
 poky_mapping = {

---
base-commit: dbc6137cd13f982a7fd4d1b2df79dccb177db0fc
change-id: 20241227-bitbake-active-releases-f15b5b6c366f

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


