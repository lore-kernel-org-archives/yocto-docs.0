Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B618EBFD13
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:36:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.266318.1776065757650268905
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 00:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Tbeupump;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61394C5B1AA
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:36:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4C1E5FFB9
	for <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D9581045012A;
	Mon, 13 Apr 2026 09:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776065755; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NMgATlsj4Q/SxuCIQBc29GVGxP18BgGTzsaGMHSwlWc=;
	b=Tbeupump5eq6CXjNEqMSpwV2rUlJPxEze+itAfFpTh+irO2FqQAIcDX8bH4DHE4S7cWyTW
	YKS/k3yfDR1igStPs0M9VajLVSfB5QKG5isNr1g9PYwRCrYoNHe2GUhp5YYejgMb2cBpcm
	X0AeCNVFZXMb3MFfy9MW4VloOSPBHuMQ45LjERPXiKrreQyhUgNd/6/4di1bd0aSvfulqD
	A6bYT4zKx+09qu4SBYIi+Oq21yc/125caFpAVcEqB+J4ZLwkpjM4dtPnSqPv4IcCw6rqqW
	PxKUv+5AWj+BafQDyJVO0HdGMBCT5+n8WEibD+RaaNtVDLxHNqMdLDEzr6Xj4Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 13 Apr 2026 09:35:46 +0200
Subject: [PATCH 1/2] set_versions.py: change strategy for the default page
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-set-versions-no-current-release-v1-1-9c40207c8604@bootlin.com>
References: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
In-Reply-To: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Btl3CqyhCLE7+OieNKukqB1Xwd8hlW2Ri6YlmfR8suE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp3JzZCUzRsaHNv6r50UXyZDK3jbulU5UVUuknY
 isziXhgQzSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadyc2QAKCRDRgEFAKaOo
 Nl5hD/9RM1hUteNUYeIYYrrpeE1sFVj6/Pgqgh2qBlKmVMd3fr9jR9yN2h+ldeAbMHMZIFt3GPa
 G/Ftpx2Sw1UVDnRzbr2o9Q3kE7DWYcw7ArTDcGkuP34v66L8OsAQo1x0SojP/K/DdNSP3/WKJEy
 /Bz8ion1pf6IucDNnQZNjKGlNy0CbWK5CfgsdEGmUrbu1rsQ6TxEcFYNaoIynXWlLew4hqKyRVB
 c/XHPd+KzkjuRr5sBu4C9918KxqQdJjOtRkzBlWebcTBubnRIXvoENwDqv7iyF4/T/Bj1s/8MMY
 dqdxoV2MK1VOBlmM9mQ/WkV3+ZgTz1ZOcUZTO0WRpdUzUIUNSERwkK5oAlfQBTqtc1ezZO/zY90
 6nIATGOu8CjXJmqOiVlq3RH0UZtmkKt54gNvjLKVwAqbdhL21B39XhkyJ4D3tKs2OATTci5uRwM
 UxjG1vKBZQxmOWmAZHIgxReQojIQ72WHIha3B1S7F2COdXv2BXSfuYB0nZaTRUlUd/Tieek+0+1
 6RsynZK3Cg5reCXaHY+dE7gN9XsmbHYMMRymPvRMzIyT2YtcOXxFzAlq8yhQFgbpCbr70nwqQn8
 1VKBTgehC3/5gf+Ptqctp/w5R46x04Q0BKDIPaejkA9dClRb85wcUjPHk41BgbuQKAnIBTOLeqr
 zCEsnTpkedwQ1qg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:36:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9249

A problem can happen with the current code: if the current stable release
is made EOL before the development branch is made the current stable,
then we only have LTS releases displayed.

Change the logic to _always_ display the latest non-dev branch as the
default page, even if EOL.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index e9aeb553e..bd4b91082 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -70,14 +70,23 @@ if releases_from_json:
         release_series[codename] = release["series_version"]
         if release["status"] == "Active Development":
             devbranch = codename
-        if release["series"] == "current":
-            activereleases.append(codename)
         if "LTS until" in release["status"]:
             ltsseries.append(codename)
         if release["bitbake_version"]:
             bitbake_mapping[codename] = release["bitbake_version"]
 
-    activereleases.remove(devbranch)
+    # Find the first non-dev release, which should be displayed as the default
+    # page on the docs website.
+    current_branch = ""
+    for release in releases_from_json:
+        if release["status"] != "Active Development":
+            current_branch = release["release_codename"].lower()
+            break
+
+    if not current_branch:
+        sys.exit("Unable to find a current release! Exiting...")
+
+    activereleases = [current_branch] + ltsseries
 
 # used by run-docs-builds to get the default page
 if len(sys.argv) > 1 and sys.argv[1] == "getlatest":

-- 
2.53.0


