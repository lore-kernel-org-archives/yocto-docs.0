Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3861EFCEE94
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:06:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43808.1772021170012780866
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 04:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2kTB28MJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A99B1A1347
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505C75FDE6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AE1A10369267;
	Wed, 25 Feb 2026 13:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772021167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pSv3OMeXhTCLv+PmAgq1rOhw/rrldvo6OvnZv5c3Tak=;
	b=2kTB28MJwqKVJHXNNRe8emnvDy4qsf8rcpBWMujak3lR7IlBGY12YKoWeRTxysX2R+dxs8
	Fr0z6XHV9OyeK7Jdxje8ZvP4czuLFwGVAGjomYvCP7SFt+UoG6CJ3UV1lyx8LqLCXmRilC
	rgFhs6dylmz3gI4X52BJRNU0JyH5Gnq36LtPMh7U0g5I2pDZqIyYHPRdKMANb/xFmNcEtx
	abRl4RfSBuZKQ3YjoTIHHGctVkL/El9m+xuZqr8CzgWwcADd+Lkz4MmZqpmGUEWQG0Fif1
	PKraSR3Kcj9IS5343AfGjq/9AuDKGEtOc8OzlzgVSXlfYETqcXep2opqHDe3Lw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 25 Feb 2026 13:05:59 +0100
Subject: [PATCH 1/2] set_versions.py: build with versions from
 releases.json
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-releases-json-v1-1-fee3f01b9197@bootlin.com>
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
In-Reply-To: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22302;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6ynCYHPaCVMKFkNHCvpBDzRU1HfYai28ARAYX2amG2g=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnuWt15Fs14o/VJYJ5GwPZCcx0PLmfws/yXhIN
 ZzWYDpBliSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZ7lrQAKCRDRgEFAKaOo
 NgZEEACQVIMOIuvLtLHQrPnPJXCaTZZpE5Jj5AGZt+8hbUztIa4zWnS8ZazEcZqumRsuDmQl5F7
 AYSzN7cmFDkX9FpG5xUpuy9dRgQmVgbOWj/uZAiN0/h56ogKxVPVSqzoIy+m4aZkm3p8/p1m32D
 0zsdHFHMcwHzLwPpfkfwXHx0Rb19coINGrKPqWneA7ejLQsJElW4eSQ3EQ051Pl0Pzi69AEGbmn
 sBRkvkNNxiyeIIkDXdL3Zhs2+uP7v3ir2X8KFn7HpgJtJlpWOSTNhPQCJwp3nGlSxB41roUVKpo
 /ZGbExJvzv8ljQgLOxKYnVlLKIWiC8PDbIOSMILruM9OnVhi4vxG6oagDpbGownRETXclR8Po1H
 JaFirUqRnUm4eBiuODN9JMwcTRJay0FkQOGZbn2iUZlFNwLGK6z6sgCK6E38MlaWG6T51HeQGW1
 FUbTMGHMkvD5U+Dpflj1Ye3Ay+Rov+4lS7oCF7cVp8xQNR0NpgxSY+hxa7X54d3IJOZCH4iClxJ
 o9RzOCptPudFxU/PgnCXNdyI8dWTTSDQT+5sniu4XWiQIwXDIkGT1OtdJnwVl59O0dTbt7luE2b
 zp5y3KwDpkwW8/yxefI9eZlHJhumKsKhPUZcdLYJo6Who2cdOLWaIDd70s/bJpTcKn79/7vMzsv
 Z03zwDSssM0tE1Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8987

Build using the releases.json file which can be obtained at
https://dashboard.yoctoproject.org/releases.json. This file needs to be
updated regularly for the documentation to be up to date.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/releases.json   | 622 ++++++++++++++++++++++++++++++++++++++++++
 documentation/set_versions.py |  63 ++---
 2 files changed, 646 insertions(+), 39 deletions(-)

diff --git a/documentation/releases.json b/documentation/releases.json
new file mode 100644
index 000000000..0d2d51fa0
--- /dev/null
+++ b/documentation/releases.json
@@ -0,0 +1,622 @@
+[
+  {
+    "series_version": "6.0",
+    "original_release_date": "",
+    "latest_release_date": "",
+    "release_codename": "Wrynose",
+    "latest_tag": "",
+    "releases": [
+      "6.0_M1"
+    ],
+    "status": "Active Development",
+    "download": "",
+    "series": "current"
+  },
+  {
+    "series_version": "5.3",
+    "original_release_date": "2025-11-26T17:14:07+00:00",
+    "latest_release_date": "2026-01-09T15:00:43+00:00",
+    "release_codename": "Whinlatter",
+    "latest_tag": "5.3.1",
+    "releases": [
+      "5.3",
+      "5.3.1"
+    ],
+    "status": "Stable Release until May 2026",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.3.1",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.3.1/RELEASENOTES",
+    "series": "current"
+  },
+  {
+    "series_version": "5.2",
+    "original_release_date": "2025-04-23T15:37:39+02:00",
+    "latest_release_date": "2025-09-12T16:48:58+02:00",
+    "release_codename": "Walnascar",
+    "latest_tag": "5.2.4",
+    "releases": [
+      "5.2",
+      "5.2.1",
+      "5.2.2",
+      "5.2.3",
+      "5.2.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.2.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.2.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "5.1",
+    "original_release_date": "2024-09-03T10:35:52+02:00",
+    "latest_release_date": "2025-03-07T11:58:05+01:00",
+    "release_codename": "Styhead",
+    "latest_tag": "5.1.4",
+    "releases": [
+      "5.1",
+      "5.1.1",
+      "5.1.2",
+      "5.1.3",
+      "5.1.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "5.0",
+    "original_release_date": "2024-04-15T17:39:29+02:00",
+    "latest_release_date": "2025-11-14T18:10:02+01:00",
+    "release_codename": "Scarthgap",
+    "latest_tag": "5.0.15",
+    "releases": [
+      "5.0",
+      "5.0.1",
+      "5.0.10",
+      "5.0.11",
+      "5.0.12",
+      "5.0.13",
+      "5.0.14",
+      "5.0.15",
+      "5.0.2",
+      "5.0.3",
+      "5.0.4",
+      "5.0.5",
+      "5.0.6",
+      "5.0.7",
+      "5.0.8",
+      "5.0.9"
+    ],
+    "status": "LTS until Apr. 2028",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.0.15/RELEASENOTES",
+    "series": "current"
+  },
+  {
+    "series_version": "4.3",
+    "original_release_date": "2023-10-06T09:59:00+02:00",
+    "latest_release_date": "2024-03-25T14:23:36+01:00",
+    "release_codename": "Nanbield",
+    "latest_tag": "4.3.4",
+    "releases": [
+      "4.3",
+      "4.3.1",
+      "4.3.2",
+      "4.3.3",
+      "4.3.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.3.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.3.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "4.2",
+    "original_release_date": "2023-04-22T10:42:18+01:00",
+    "latest_release_date": "2023-10-31T10:26:24+01:00",
+    "release_codename": "Mickledore",
+    "latest_tag": "4.2.4",
+    "releases": [
+      "4.2",
+      "4.2.1",
+      "4.2.2",
+      "4.2.3",
+      "4.2.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.2.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.2.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "4.1",
+    "original_release_date": "2022-10-06T10:22:27+02:00",
+    "latest_release_date": "2023-03-15T17:27:49+01:00",
+    "release_codename": "Langdale",
+    "latest_tag": "4.1.4",
+    "releases": [
+      "4.1",
+      "4.1.1",
+      "4.1.2",
+      "4.1.3",
+      "4.1.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.1.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "4.0",
+    "original_release_date": "2022-04-13T16:54:23+01:00",
+    "latest_release_date": "2025-11-14T18:10:02+01:00",
+    "release_codename": "Kirkstone",
+    "latest_tag": "4.0.32",
+    "releases": [
+      "4.0",
+      "4.0.1",
+      "4.0.10",
+      "4.0.11",
+      "4.0.12",
+      "4.0.13",
+      "4.0.14",
+      "4.0.15",
+      "4.0.16",
+      "4.0.17",
+      "4.0.18",
+      "4.0.19",
+      "4.0.2",
+      "4.0.20",
+      "4.0.21",
+      "4.0.22",
+      "4.0.23",
+      "4.0.24",
+      "4.0.25",
+      "4.0.26",
+      "4.0.27",
+      "4.0.28",
+      "4.0.29",
+      "4.0.3",
+      "4.0.30",
+      "4.0.31",
+      "4.0.32",
+      "4.0.4",
+      "4.0.5",
+      "4.0.6",
+      "4.0.7",
+      "4.0.8",
+      "4.0.9"
+    ],
+    "status": "LTS until Apr. 2026",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-4.0.32/RELEASENOTES",
+    "series": "current"
+  },
+  {
+    "series_version": "3.4",
+    "original_release_date": "2021-10-22T19:02:35+02:00",
+    "latest_release_date": "2022-04-29T17:41:27+02:00",
+    "release_codename": "Honister",
+    "latest_tag": "3.4.4",
+    "releases": [
+      "3.4",
+      "3.4.1",
+      "3.4.2",
+      "3.4.3",
+      "3.4.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.4.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.4.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "3.3",
+    "original_release_date": "2021-04-15T22:10:07+12:00",
+    "latest_release_date": "2022-04-20T12:27:12+01:00",
+    "release_codename": "Hardknott",
+    "latest_tag": "3.3.6",
+    "releases": [
+      "3.3",
+      "3.3.1",
+      "3.3.2",
+      "3.3.3",
+      "3.3.4",
+      "3.3.5",
+      "3.3.6"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.3.6",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.3.6/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "3.2",
+    "original_release_date": "2020-11-12T13:04:03+00:00",
+    "latest_release_date": "2021-05-06T11:19:57+01:00",
+    "release_codename": "Gatesgarth",
+    "latest_tag": "3.2.4",
+    "releases": [
+      "3.2",
+      "3.2.1",
+      "3.2.2",
+      "3.2.3",
+      "3.2.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.2.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.2.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "3.1",
+    "original_release_date": "2020-04-07T15:17:11+01:00",
+    "latest_release_date": "2024-04-08T16:28:06+02:00",
+    "release_codename": "Dunfell",
+    "latest_tag": "3.1.33",
+    "releases": [
+      "3.1",
+      "3.1.1",
+      "3.1.10",
+      "3.1.11",
+      "3.1.12",
+      "3.1.13",
+      "3.1.14",
+      "3.1.15",
+      "3.1.16",
+      "3.1.17",
+      "3.1.18",
+      "3.1.19",
+      "3.1.2",
+      "3.1.20",
+      "3.1.21",
+      "3.1.22",
+      "3.1.23",
+      "3.1.24",
+      "3.1.25",
+      "3.1.26",
+      "3.1.27",
+      "3.1.28",
+      "3.1.29",
+      "3.1.3",
+      "3.1.30",
+      "3.1.31",
+      "3.1.32",
+      "3.1.33",
+      "3.1.4",
+      "3.1.5",
+      "3.1.6",
+      "3.1.7",
+      "3.1.8",
+      "3.1.9"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.1.33",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.1.33/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "3.0",
+    "original_release_date": "2019-12-02T16:37:15-08:00",
+    "latest_release_date": "2020-08-16T00:00:04+01:00",
+    "release_codename": "Zeus",
+    "latest_tag": "3.0.4",
+    "releases": [
+      "3.0",
+      "3.0.1",
+      "3.0.2",
+      "3.0.3",
+      "3.0.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.0.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-3.0.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.7",
+    "original_release_date": "2019-05-01T15:43:58-07:00",
+    "latest_release_date": "2020-05-17T22:35:29+01:00",
+    "release_codename": "Warrior",
+    "latest_tag": "2.7.4",
+    "releases": [
+      "2.7",
+      "2.7.1",
+      "2.7.2",
+      "2.7.3",
+      "2.7.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.7.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.7.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.6",
+    "original_release_date": "2018-11-15T14:57:31-08:00",
+    "latest_release_date": "2019-10-29T11:13:32-07:00",
+    "release_codename": "Thud",
+    "latest_tag": "2.6.4",
+    "releases": [
+      "2.6",
+      "2.6.1",
+      "2.6.2",
+      "2.6.3",
+      "2.6.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.6.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.6.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.5",
+    "original_release_date": "2018-05-18T11:33:49-07:00",
+    "latest_release_date": "2019-03-12T09:51:09-06:00",
+    "release_codename": "Sumo",
+    "latest_tag": "2.5.3",
+    "releases": [
+      "2.5",
+      "2.5.1",
+      "2.5.2",
+      "2.5.3"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.5.3",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.5.3/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.4",
+    "original_release_date": "2017-10-16T09:33:13-07:00",
+    "latest_release_date": "2018-07-23T10:47:39-07:00",
+    "release_codename": "Rocko",
+    "latest_tag": "2.4.4",
+    "releases": [
+      "2.4",
+      "2.4.1",
+      "2.4.2",
+      "2.4.3",
+      "2.4.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.4.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.4.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.3",
+    "original_release_date": "2017-05-09T15:13:40-07:00",
+    "latest_release_date": "2018-01-22T11:14:15-08:00",
+    "release_codename": "Pyro",
+    "latest_tag": "2.3.4",
+    "releases": [
+      "2.3",
+      "2.3.1",
+      "2.3.2",
+      "2.3.3",
+      "2.3.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.3.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.3.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.2",
+    "original_release_date": "2016-10-21T13:55:32-07:00",
+    "latest_release_date": "2018-02-13T16:48:23-08:00",
+    "release_codename": "Morty",
+    "latest_tag": "2.2.4",
+    "releases": [
+      "2.2",
+      "2.2.1",
+      "2.2.2",
+      "2.2.3",
+      "2.2.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.2.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.2.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.1",
+    "original_release_date": "2016-04-20T07:27:43-07:00",
+    "latest_release_date": "2017-06-05T08:04:07-07:00",
+    "release_codename": "Krogoth",
+    "latest_tag": "2.1.3",
+    "releases": [
+      "2.1",
+      "2.1.1",
+      "2.1.2",
+      "2.1.3"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.1.3",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.1.3/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "2.0",
+    "original_release_date": "2015-10-29T10:22:30-07:00",
+    "latest_release_date": "2016-11-18T09:42:09-08:00",
+    "release_codename": "Jethro",
+    "latest_tag": "2.0.3",
+    "releases": [
+      "2.0",
+      "2.0.1",
+      "2.0.2",
+      "2.0.3"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.3",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.3/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.8",
+    "original_release_date": "2015-04-09T16:04:58-07:00",
+    "latest_release_date": "2016-03-11T13:11:41-08:00",
+    "release_codename": "Fido",
+    "latest_tag": "1.8.2",
+    "releases": [
+      "1.8",
+      "1.8.1",
+      "1.8.2"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.8.2",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.8.2/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.7",
+    "original_release_date": "2014-10-28T15:02:47-07:00",
+    "latest_release_date": "2015-11-07T08:29:16-08:00",
+    "release_codename": "Dizzy",
+    "latest_tag": "1.7.3",
+    "releases": [
+      "1.7",
+      "1.7.1",
+      "1.7.2",
+      "1.7.3"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.7.3",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.7.3/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.6",
+    "original_release_date": "2014-04-23T11:35:25-07:00",
+    "latest_release_date": "2015-04-28T08:16:57-07:00",
+    "release_codename": "Daisy",
+    "latest_tag": "1.6.3",
+    "releases": [
+      "1.6",
+      "1.6.1",
+      "1.6.2",
+      "1.6.3"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.6.3",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.6.3/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.5",
+    "original_release_date": "2013-10-07T13:34:44-07:00",
+    "latest_release_date": "2014-11-24T18:26:50-06:00",
+    "release_codename": "Dora",
+    "latest_tag": "1.5.4",
+    "releases": [
+      "1.5",
+      "1.5.1",
+      "1.5.2",
+      "1.5.3",
+      "1.5.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.5.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.5.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.4",
+    "original_release_date": "2013-04-17T13:11:04-07:00",
+    "latest_release_date": "2014-05-12T21:14:18+03:00",
+    "release_codename": "Dylan",
+    "latest_tag": "1.4.4",
+    "releases": [
+      "1.4",
+      "1.4.1",
+      "1.4.2",
+      "1.4.3",
+      "1.4.4"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.4.4",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.4.4/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.3",
+    "original_release_date": "2012-10-22T14:22:09-07:00",
+    "latest_release_date": "2018-03-29T14:40:51-07:00",
+    "release_codename": "Danny",
+    "latest_tag": "1.3.2",
+    "releases": [
+      "1.3",
+      "1.3.1",
+      "1.3.2"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.3.2",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.3.2/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.2",
+    "original_release_date": "2012-07-19T06:58:24-07:00",
+    "latest_release_date": "2018-03-30T10:37:45-07:00",
+    "release_codename": "Denzil",
+    "latest_tag": "1.2.2",
+    "releases": [
+      "1.2",
+      "1.2.1",
+      "1.2.2"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.2.2",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.2.2/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.1",
+    "original_release_date": "2011-10-05T12:07:29-07:00",
+    "latest_release_date": "2018-03-30T11:21:43-07:00",
+    "release_codename": "Edison",
+    "latest_tag": "1.1.2",
+    "releases": [
+      "1.1",
+      "1.1.1",
+      "1.1.2"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.1.2",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.1.2/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "1.0",
+    "original_release_date": "2011-03-25T17:40:04+00:00",
+    "latest_release_date": "2018-03-30T17:12:49-07:00",
+    "release_codename": "Bernard",
+    "latest_tag": "1.0.2",
+    "releases": [
+      "1.0",
+      "1.0.1",
+      "1.0.2"
+    ],
+    "status": "EOL",
+    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.0.2",
+    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-1.0.2/RELEASENOTES",
+    "series": "previous"
+  },
+  {
+    "series_version": "0.9",
+    "original_release_date": "2010-10-22T13:56:31+01:00",
+    "latest_release_date": "2010-10-22T13:56:31+01:00",
+    "release_codename": "Laverne",
+    "latest_tag": "0.9.1",
+    "releases": [
+      "0.9",
+      "0.9.1"
+    ],
+    "status": "EOL",
+    "download": "",
+    "release_notes": "",
+    "series": "previous"
+  }
+]
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 96903e14c..24d8b1791 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -11,57 +11,42 @@
 #
 
 
+import json
 import subprocess
 import collections
 import sys
 import os
 import itertools
 
-# Order matters: most recent to least recent
-activereleases = ["whinlatter", "scarthgap", "kirkstone"]
-devbranch = "wrynose"
-ltsseries = ["wrynose", "scarthgap", "kirkstone"]
+releases = {}
+with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "releases.json"), "r") as f:
+    releases = json.load(f)
+
+release_series = collections.OrderedDict()
+activereleases = []
+devbranch = ""
+ltsseries = []
+
+for release in releases:
+    codename = release["release_codename"].lower()
+    release_series[codename] = release["series_version"]
+    if release["status"] == "Active Development":
+        devbranch = codename
+    if release["series"] == "current":
+        activereleases.append(codename)
+    if "LTS until" in release["status"]:
+        ltsseries.append(codename)
+
+activereleases.remove(devbranch)
 
 # used by run-docs-builds to get the default page
 if len(sys.argv) > 1 and sys.argv[1] == "getlatest":
     print(activereleases[0])
     sys.exit(0)
 
-release_series = collections.OrderedDict()
-release_series["wrynose"] = "6.0"
-release_series["whinlatter"] = "5.3"
-release_series["walnascar"] = "5.2"
-release_series["styhead"] = "5.1"
-release_series["scarthgap"] = "5.0"
-release_series["nanbield"] = "4.3"
-release_series["mickledore"] = "4.2"
-release_series["langdale"] = "4.1"
-release_series["kirkstone"] = "4.0"
-release_series["honister"] = "3.4"
-release_series["hardknott"] = "3.3"
-release_series["gatesgarth"] = "3.2"
-release_series["dunfell"] = "3.1"
-release_series["zeus"] = "3.0"
-release_series["warrior"] = "2.7"
-release_series["thud"] = "2.6"
-release_series["sumo"] = "2.5"
-release_series["rocko"] = "2.4"
-release_series["pyro"] = "2.3"
-release_series["morty"] = "2.2"
-release_series["krogoth"] = "2.1"
-release_series["jethro"] = "2.0"
-release_series["jethro-pre"] = "1.9"
-release_series["fido"] = "1.8"
-release_series["dizzy"] = "1.7"
-release_series["daisy"] = "1.6"
-release_series["dora"] = "1.5"
-release_series["dylan"] = "1.4"
-release_series["danny"] = "1.3"
-release_series["denzil"] = "1.2"
-release_series["edison"] = "1.1"
-release_series["bernard"] = "1.0"
-release_series["laverne"] = "0.9"
-
+print(f"activereleases calculated to be {activereleases}")
+print(f"devbranch calculated to be {devbranch}")
+print(f"ltsseries calculated to be {ltsseries}")
 
 bitbake_mapping = {
     "wrynose" : "2.18",

-- 
2.52.0


