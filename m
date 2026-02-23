Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37ABEF99FF
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32954.1771844284880358250
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 02:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AMXSwH+k;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44DE14E41032
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15C645FD43
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A62710368F7E;
	Mon, 23 Feb 2026 11:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771844282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cwpl7QgBxgzgdNUKzuJPbdFQvLSNc+H8mJID0sh6Kug=;
	b=AMXSwH+kUyP3ACPgxXEneyO+c92uRlgWlxV4JnHRJZFp4NfBevhkxYop6zGJAlL1Jr+nQy
	ywJ+Ir8YTyMv8GR7P9GqGuOLcBpQMAX7DwtTgp8jG8uszT3TLLl3+9wrAPCSbc7P/KkKEk
	g5qkP0pyk4ermIrgRUNMzcz/gus1kpHeFIICttPxe6cCe2N0/BAXcSZuo1sTFbx4ozlQG6
	272TY8mFpIfyoIke0tXvGsBcx2xao10LzmwLSDC7HgaxHYyjMOnjX90Uyy1ZmU7tjRnClc
	iwSrX8uCd98Aip3qQUp5HD9bDr74S6F4WZWmnjp6uaUhk/QBLR85QT9tDJko+g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Feb 2026 11:57:53 +0100
Subject: [PATCH v2 3/4] set_versions.py: set a more accurate DISTRO value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fix-switchers-js-v2-3-296523996600@bootlin.com>
References: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
In-Reply-To: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=27qtVC2b470Reww60m+4xiNkUlu92ggOOlG7YiZF2TE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnDK3uI5xnU7up8dyMAIaQiLgfjHHBGe4s5oSj
 J4P8OhXcSKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZwytwAKCRDRgEFAKaOo
 NiydEAC49lDdsenMD3doq9Emj35N7izLtFWCULtHu2WlDgaAn+5i2Oe5lcAO4rg4xBlRSIHwhEU
 h4RdwGkzfRFKFXfaKavkAKE+rKxLERssOc61cIvrsyMGXcCFhzGlIUhfn2Is2tqccKQkep0JEdj
 nlnkznMWxedpgRKmtbjol1tzDprQ0N0sJwaLDB9I1h7BAowwZWNFSWDl1aDonEDG/hCt0Po5Dsj
 WpcBE/ayHC/7Yh1m5NHf55Q8VLf+lCklcUa5q+FIPgsyhwc8FDG5vLBXYo4JRZbk6PZYn+2kZ1s
 EAQ4+BjE1LY3DCw98SDrrfx8IeCQ7FXgFzQBx8hFb5KktOy9pmbvVv6I26sV9slNTmaS+cSwRM1
 ZbKGvJG/REEn348zf/VbZ+zj5kLaQH1O8yO1QHESJRt4fCruF8OUqXE/7twwu6FgFi+8e6W0q6m
 +zmpZJiQfAOUvDVX5jL98iWkLQ8HmoV0FMICYFMgjA90L9XUWPGV2mdGNuNhsKviJwFCcM03+4H
 sN6HMm0utkGkcmAWLOks84H+q84gSM24qSFhSHMiJTkDDpxDpw1d/29Km/30S53buRI+b4wctX8
 DNjNx4x3SjD5Tz9yfAGpcTByyEEAEkfFsyMmUWcPfNxtoxKn9b4zU7tGG85K6BitD4s3nb84PK1
 nDizwyT62poI4+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8954

The changes from the previous commit make the current value inaccurate
in some situations, especially since this variable is used in some
commands. Take these situations into account and compute a more accurate
value for DISTRO.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index fedbad00e..96903e14c 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -195,8 +195,28 @@ print("Latest release tag found is %s" % latestreltag)
 print("Release series calculated to be %s" % ourseries)
 print("Bitbake version calculated to be %s" % bitbakeversion)
 
+# The &DISTRO; replacement will be mostly right when just equaling ourversion.
+# When we're on a random commit, in that case the DISTRO value will
+# contain the hash. This would for example be "5.3-4d2acc043".
+# This will not happen when publishing the documentation from the
+# autobuilder as we don't build specific commits - this should only happen
+# for development.
+distro = ourversion
+# Few exceptions though:
+if is_branch_tip:
+    # we're on a branch tip, in that case the closest match is the latest tag
+    # from that branch. Some instructions rely on DISTRO to provide tag names,
+    # etc. so it makes sense provide the latest tag from that branch.
+    distro = latesttag
+elif distro in ["dev", "next"]:
+    # When building on master or master-next, make the distro the version of the
+    # devbranch.
+    distro = release_series[devbranch]
+
+print(f"DISTRO calculated to be {distro}")
+
 replacements = {
-    "DISTRO" : ourversion,
+    "DISTRO" : distro,
     "DISTRO_LATEST_TAG": latesttag,
     "DISTRO_RELEASE_SERIES": release_series[ourseries],
     "DISTRO_NAME_NO_CAP" : ourseries,

-- 
2.52.0


