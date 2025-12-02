Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D420DD11712
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1089.1764692063261367626
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 08:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tOMY6PgC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A990C15D72
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:13:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 987F7606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:14:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA1D411919D0A;
	Tue,  2 Dec 2025 17:14:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764692061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6QlYX2760ddmBFP6QO/8s6v2zwdSLy8e2jrn3bsYQow=;
	b=tOMY6PgCp2AAlFnuI3lpN9lwoVqmPLZZ9O4pGXhnyZiciyYrrXe9ZSXUwz8Qhjywe3kLUj
	q2fjmol29faMXSBP+0OjjpumA4GJEAXV9o8ISRnzo2roUiUnhCltax/e554UsR5hSwy3hs
	tjyd1nef2/XENMchETqtgpHST+t6TYnZb3REe94s97qbVRP5RVjp0x8wfnVtbsfSW+XMCG
	Z/5WDh862rTMLIcLBWrCRUrxgb9hkoGL8WKp5lwyv1QYyMIBrwwymJmnn75+wWUpR2Pni5
	JS4GedmjqQ7ptkMTPndvm56R26aZHIxznKvTOuuCxrEy7BA6cXpsYNxIYsAKbw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 02 Dec 2025 17:14:15 +0100
Subject: [PATCH 3/4] set_versions.py: add wrynose as devbranch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-release-updates-v1-3-889513ccc384@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
In-Reply-To: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZRNCIP8kvFIUU/THHOhlsKnLCmU+TDz26TvT//Bw2dA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxBa0kBjwpR2RA93kl65VWP/R6GcAPJ/vNfLv
 UoAawKiuLuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8QWgAKCRDRgEFAKaOo
 NpbZEACGOcOa6h2nxbOf33Bg3UVAjseCpMpHNqiuvpU/vNm40ttsbM7xGrmHX0D/KN9mk6pSfII
 YKnxaUH/0Nt23vELsTxJmGwHNieLvI1tsd1ZdZQXNaeHCjsQLIl6y/owJHjy+hmENCgQYe8HJk2
 LXcVe4g7UoG8CLWmx7sUtw6liFU3wP0bbkk7sjzStH5OpAPZqCJrngX8k8na8RAnGMQNNei8Vf1
 UEblLcC0/CKAy8Zm4lEYoAfr8hP7if0MhaRhAQMY6yVLY/ywBAbfnB5Cv7ciSSj3DPO7pedRFdR
 hgk3z7hMAwZEEs983Eg2LinMvpnviDjV4hBrKbY4b4LNYMYgl+kCddif18dF6xOy/x+R94yKpq5
 LR21uGmRRWEQwsdGG2qDqIdbBnOPIGq3M9KM4fxLHeWQ60u/koZ3t5YVHJE9Cl32xIgp03gwjbv
 r059Zq+vhU4Jt72OHqPJj9I8j+Et8EEgBB8Dcpl1WBJWTFLZQHOXBJu4Bl5kC1uh7VEHrZ3uW9h
 cUvaGz/Xwkb/F2bJpSLFeJJT9HaXuTD68PndcwYUkxo3ryfjQvslP8o9IgCdDeyt2IDLp7RYqgj
 pysliREBRWEoPUSydsMdz6dPrGsNcLGJVVbu6hC+Tn/S35YShQnuWE95TD23k4cc5WJUAUJ+iMj
 BmWbP+FgLk1NQYQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8188

Update set_versions.py after whinlatter release.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index d146f93bb..0d199a885 100755
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
+release_series["wrynose"] = "5.3"
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


