Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BF2D20698
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:36:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43529.1764855409234287156
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OKho6/Cd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5ACAEC1785A
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBB296068C
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C681111922629;
	Thu,  4 Dec 2025 14:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764855407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J52O6J4EDRYsO3QFMGk9ckd1HjGthkQu/t8hchnM3xg=;
	b=OKho6/CdRKu+XZe/8WMvDCbYt4rU5bqYlncwDP5xek6yydJM9OSzHUL0wfezVDYKiBbG4e
	OxrR7w6EnyiuOqFKOmzjYYxejBlaIKYxAIq6vfR5Nwwirbh2dXCm55bO+nWj0T70CPp5pZ
	8/r31w/zGWqBDFnpRA5/b8QQZY2XyEMC19RI8/cV1kK32bkk3UdCAnT0YPS68NUgFtPGhu
	FZjWA2mGT9bhHdln64ctVU9K9kiEiyTBpUgjZ/L+xcZ7FjhQGbRrgaZVwTw5gLP+mSKxT/
	Yia7AVCG4toNWGRrNRFR5hJ4lKNtXZ6ixTzs/ieVX7ccVsdgU/Jfn5g6xmJ5xA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 14:36:40 +0100
Subject: [PATCH v2 3/4] set_versions.py: add wrynose as devbranch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-release-updates-v2-3-04ca6c26ddd5@bootlin.com>
References: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
In-Reply-To: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=c2juE1V45jhHRh3J3d/zuNmg+jw7/40OCY0kP21op60=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMY5rWLrzdkKwuJrKh7PZU0cKyoIv1hGUq9MuW
 Gu6MP9bNuSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGOawAKCRDRgEFAKaOo
 Nl5PD/47bH+mP/ak7bQlq7AxAx0JjpvN7JnsNeYBtLoAOI55jRU9zcLe7vFOp8qr6NhCj7ni7iZ
 P3HXX+L9liiPAb2HHdc6Ahv7S/ll+1YYgk34g/NuhvsOUtFhTfBcpc+km7QHaMxSrbyib0ZWxoa
 ABI21CJfXrDkWOMraS2Sv6rW5IMmEM2IAsQ3Jh/zeff8aJn3aY26gQUMqPR0gYRnR8dd5YYIQyI
 WTPXeHYaQDeQAkcvOjsaRahJgT5aTuVbKoOasSe01PHhh3ytckhTIWTX/jnaWjjkc2mfL/OzMyv
 Dvc6vj58zI5VJzeCO+PmUo3S4M+cVjgMF3oh0nm3Y6dgqn+aGr0o2OVyJjwMdDTa9uqSgNyZJ0C
 XjD0HYBWsw49S93xg5kNHyJ3Yv/0Mzals3y3T0kwf9JLSKzI4VS7ppn2UjKQLHLiMCZ4+E3ZRqW
 i5WPwwvSjcU5obtOtVQe7OJObg/gDS9Irhyl18xiX6U3z5r7D2hsX9DwGbrHVKC1MAKNTuGexQ0
 2jYsDuTQvguYZrimtMLwf5AczqHA7FolGVLC6L6wTIYBpdH3o79ikZL6qdWXowUhjYBahkg0QHx
 JXvYvFfRaHbd+r80USrj5v3JGhkze4Lk7MPNGpWF+SRe+tvM0tOglu71Eyh/R2DL+ZUuVPbSLsS
 moVxqyh5KKyHwLw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8219

Update set_versions.py after whinlatter release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index d146f93bb..91aa2bdf2 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,9 +26,9 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["walnascar", "scarthgap", "kirkstone"]
-devbranch = "whinlatter"
-ltsseries = ["scarthgap", "kirkstone"]
+activereleases = ["whinlatter", "scarthgap", "kirkstone"]
+devbranch = "wrynose"
+ltsseries = ["wrynose", "scarthgap", "kirkstone"]
 
 # used by run-docs-builds to get the default page
 if ourversion == "getlatest":
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["wrynose"] = "6.0"
 release_series["whinlatter"] = "5.3"
 release_series["walnascar"] = "5.2"
 release_series["styhead"] = "5.1"
@@ -71,6 +72,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "wrynose" : "2.16",
     "whinlatter" : "2.14",
     "walnascar" : "2.12",
     "styhead" : "2.10",

-- 
2.51.0


