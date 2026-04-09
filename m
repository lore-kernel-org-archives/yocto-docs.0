Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCA5F31E4A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:48:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131588.1775739703978221636
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2FyDKj6+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C8E21A3247
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 532CE5FDEB
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84FED104500C4;
	Thu,  9 Apr 2026 15:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775739701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GrXfKhU2Zl+Bl4/MoMwr3OSSR7lWUP9EFn8ln+k8feg=;
	b=2FyDKj6+leoFpy1yGv3QoFngtgND5v6ALh4xIPRdKlUHXZDlUkL9AQjJ+vyN6D7/NnJ1St
	Ie7uleld+JjRYGcPtffTDiAiEbWmIMdWTK5mRVpEj4LaQsp8lUw/n+aSzPZWr3UaeLx5ya
	Kxtu5lDGOMksbyQef1Vmz7gfBmAFvshrRuzGo5v2OrawT6t/r5VWI4j/TEM06v40nraglj
	kReJCsWTGRkJnsfLFZSuyOa4dw3xg5fSBkx5k+SQ7xBUZI+szOzPFLMDawHW78It7G/q76
	8wd6NMUn9qbYsRWIsZ9PK34d6jEu7w9WtjW0ZtkWOvcxN0VXTKyeEIxf5769Zg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 09 Apr 2026 15:01:35 +0200
Subject: [PATCH 1/2] set_versions.py: fix seriesversion for milestone tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-fix-milestone-tag-builds-v1-1-33b14f05fad0@bootlin.com>
References: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
In-Reply-To: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NtkP0SafEQ3QVzMlwq56YRHOgm+rHeCdsuI2uyS9jZQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp16MzgRi/8O4Vz7sBiid3gEl5L1xsdexZACFXx
 yQFrVFV442JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadejMwAKCRDRgEFAKaOo
 NtYqEACE0TBNxeUv/aPsZ0g8Lm6CE+NJzBGWHBWCbWLuYAMeda61ld6fPpGzonAmCRTFVwocs5H
 aDkEy3C4PwC+Cos503VIPqXADklMK7ck+yyq8oi6W8o47vYPA1XslG+MAB+vst029nkxiJwxfT8
 oB7cqITF85MnieQpTNGlSRxVAnnU9WUQ4CtLbZdz2/KLELMo7ZxB2RhYaDirxBF9kni0qhmgVBW
 Zdjj3DPTuSEVmLvAm0CCxVmLLi/vkSnYBnPgP3fdEoLINS7ku8I6YZZJJlW7aKvzcxRe6am97Iv
 6Rbz7hb8jSbLk7PF6gu63zIBCgpD8Nhm8M47aw6bCRA9TxFZ0PDmKQ2CRyP8uYx7J1FbhLuvsp4
 FT5XKGmb1Zdtp+wTVBaE0lJ1mE9OJFZe81u8DmvgA5FM9P6n2QgJ2JR6AXeHjb7H4WPyBy2kNQP
 D3b9/ZMILJJvSv3m+mEramY3+xBuusPQ12tvHjHFnS0KdzBN2JihVlRxTzCnyvkq6TdceXCoYCQ
 T2iNJ6DRxhSructq5wVVpSY+eEtLKAy0lSsJ6KSCA7wmxM7t4g4+GvGxxR0LNck7eIcaQ4HPZl0
 tlno+UU7PMJKmlSNlpHJuLdlCzV0A8xBVJ1SyYJCaOPLiBVuu+ASW30uhbrbS1mwfmg3hd/696g
 0g2jdBp/zUa86SA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9211

The seriesversion is wrong when we're building on a milestone tag and
would result in:

Traceback (most recent call last):
  File "../yocto-docs/documentation/./set_versions.py", line 174, in <module>
    previousseries = series[series.index(ourseries)+1:] or [""]
                            ~~~~~~~~~~~~^^^^^^^^^^^
ValueError: list.index(x): x not in list

Remove what's after "_" (including "_").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index e9aeb553e..0e4832f5e 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -118,7 +118,9 @@ tags = subprocess.run(["git", "tag", "--points-at", "HEAD"],
 for t in tags.split():
     if t.startswith("yocto-"):
         ourversion = t[6:]
-        seriesversion = ".".join(ourversion.split(".")[0:2])
+        # remove "_MX" milestone information to get the series
+        seriesversion = ourversion.split("_")[0]
+        seriesversion = ".".join(seriesversion.split(".")[0:2])
         for series in release_series:
             if release_series[series] == seriesversion:
                 ourseries = series

-- 
2.53.0


