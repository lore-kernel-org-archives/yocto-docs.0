Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A54FD706A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:12:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72702.1773742311899628653
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=h8UXG4S5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CD9D4E42639
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35E815FC9A
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8491B10450405;
	Tue, 17 Mar 2026 11:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4hwKeFi1QzyrAewM8B3MpmUMDaWmK+7gWiQtmdTHIEY=;
	b=h8UXG4S5LA7VcTbl6JyTymOWZfavusglo83g5eyP2Bi8hesAe609mLmXHoBuqB+9pSsp05
	Z+0S/I2xy2H2waqeTb0EAyqjgfX4BhfOuOv2m+TseL+Vb5CXQx61zlQEZfOqJmknKz6Xm5
	xiYRavczhQeXIXmKo9SZxCi60b5xPt8ozQ9KSeOKEIbCB7XyZil4lSkVcugEweNRXTOFHo
	Cbj9Tiyy1AFUhqp7lM2rRNXMFj44FhA1tAixDeYd3sg0TWC6mqPZywidxCFBp3w+AyA47F
	NZklEOfZBNzNEikXIitLrxMzx10hUNJHzSTWcwLcexxWmj5EKmKBSgaWTn76ig==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Mar 2026 11:11:40 +0100
Subject: [PATCH 1/3] set_versions.py: use bitbake mappings from remote
 releases.json
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-use-remote-bitbake-version-mappings-v1-1-3c294fe04944@bootlin.com>
References: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
In-Reply-To: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bCCFZrT5fm3/hQFMkhLRmtrhfQkTLi0ifrMI6Yu3rXM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpuSjkxx56tAci/DHQO+7Yk0jmeXrRQzVvohfpi
 ImLnOFCuaiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCabko5AAKCRDRgEFAKaOo
 NtItEACXtnW8wl6H+Gth5FcO1sA8zTAVMEVHP58baFZcnPawJnqzEcmjn+s8Nq8H8bWH0aGJhHa
 OkYD42AIiDO3Fe17S2EJhQ/hi5pXEiyr0UDWxZ0LXFPpc+6EoJczTbETtEnb+/L+WJpbnfgmPp+
 eWlFF6kzknoEXmP1svUVrkJ0tx6f8n70yfCA+jkV7h3RTLNfCempWWVA7X+oo5wq2TyhZKYgJ6Z
 AMxhUVqS3f2RI1EyPkWygf3gXfCzaO+1Hvk3LizBDJyws57ujeVDYsWPyM5IF+1bmsDJqIhCM0/
 bdcg2K2R6qPdTmaE0+Hmz3xuSmjMG77A9/svrlGi6iLDpvjbtRy4dlTZkPcqaSWk9eJqRO/Q1ti
 2FsRv0E7JDLV6ziN5FcuH54FpXXOSTditGXUIquy2Z5+wDiDwkJ+q97LtSgsro71s4+q6rx7yoU
 rnkAtifPu42hiS2B0uPoUrYxNO9zZFQZrxruvO66XYVyief9T72lM/ZwOJx0pd3//GMlYLZxtg3
 r2L4hpVBVMCDwj1zbpkl2L7bkXC7nbPd1l95hV7VSvXQtHk/R3X4OkKSiPV3f1Qu+t3bUUhlpYC
 UHG0J5qQOLsXiHFBrf7XK6ZaQPFraV0dGcBQnLB9/ST6PdYJ0lrA1qDbPTDiSiAmuLGddg7Icl5
 4FKklI9YGneLQyA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:12:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9091

After [1] we can now use the bitbake version mappings maintained in the
remote releases.json file, allowing to reduce maintenance effort here.

[1]:

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 08be8c665..b1d65b21f 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -31,6 +31,12 @@ release_series = collections.OrderedDict({
     "scarthgap": "5.0",
     "kirkstone": "4.0",
 })
+bitbake_mapping = collections.OrderedDict({
+    "wrynose": "2.18",
+    "whinlatter": "2.16",
+    "scarthgap": "2.8",
+    "kirkstone": "2.0",
+})
 
 releases_from_json = {}
 
@@ -57,6 +63,7 @@ if releases_from_json:
     activereleases = []
     devbranch = ""
     ltsseries = []
+    bitbake_mapping = collections.OrderedDict()
 
     for release in releases_from_json:
         codename = release["release_codename"].lower()
@@ -67,6 +74,8 @@ if releases_from_json:
             activereleases.append(codename)
         if "LTS until" in release["status"]:
             ltsseries.append(codename)
+        if release["bitbake_version"]:
+            bitbake_mapping[codename] = release["bitbake_version"]
 
     activereleases.remove(devbranch)
 
@@ -79,22 +88,6 @@ print(f"activereleases calculated to be {activereleases}")
 print(f"devbranch calculated to be {devbranch}")
 print(f"ltsseries calculated to be {ltsseries}")
 
-bitbake_mapping = {
-    "wrynose" : "2.18",
-    "whinlatter" : "2.16",
-    "walnascar" : "2.12",
-    "styhead" : "2.10",
-    "scarthgap" : "2.8",
-    "nanbield" : "2.6",
-    "mickledore" : "2.4",
-    "langdale" : "2.2",
-    "kirkstone" : "2.0",
-    "honister" : "1.52",
-    "hardknott" : "1.50",
-    "gatesgarth" : "1.48",
-    "dunfell" : "1.46",
-}
-
 # 3.4 onwards doesn't have poky version
 # Early 3.4 release docs do reference it though
 poky_mapping = {

-- 
2.53.0


