Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE778FD7066
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 10:12:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72500.1773742312352866616
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 03:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q0Cd0Ae4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C90324E4263E
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A16D05FC9A
	for <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 189B410450447;
	Tue, 17 Mar 2026 11:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742310; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LyhEq/vTVxSOOYmmrS+qR8HS0BZcssewK2vr1ZNSoG8=;
	b=Q0Cd0Ae47YRex4rRWh96ee22ryxcYU8zsyblS7CAos0REK8fda2HyxLonK0hhxISSbQpFu
	fTBum+1bcEvfsSqHMMZKYxqr/yQUY7zg8A+c22haothTTsQ0lsTWiYoXVdakdQebMeucbp
	+bTX6EGX9ozyRosdA6ZegOasPfCFUC4MH/RD0ecmwvyqbIvibDuhSQ1K7h3S7vscsfimZP
	BKeYg/m7idY88Ib2p7pFpA4oyZHeAtJT/pC9bteCT8lTGzC+DWmtMYJnZ4Tpt4FQHCbfsv
	YGLzlNGYxz0QC0Tr/Cn0rRKh3S6QyXqkIFOkcfUVoYw8OouhiKbz4Ci4Npowhw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Mar 2026 11:11:41 +0100
Subject: [PATCH 2/3] set_versions.py: move the poky_mapping dict where it
 is used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-use-remote-bitbake-version-mappings-v1-2-3c294fe04944@bootlin.com>
References: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
In-Reply-To: <20260317-use-remote-bitbake-version-mappings-v1-0-3c294fe04944@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=L1LaUKv0WCkrGOvRjaD3OxRHffJHhWQdnpATKVYCDkg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpuSjkpAyYel9/0jCrY42ZgPdpd8YYOGMXjBOgC
 s4UigeKUISJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCabko5AAKCRDRgEFAKaOo
 NlLrD/9Lmvww2K9Kzg4pR1sqgC8IJBSoMfBUbUbEUl4MIADNPqTokO5tJMvcIFv2UzPMCrG6rad
 RY0fFHMl7xsnN36Z/WnFLMkbVQXqVHMMYGU+Ri69R4S1ZLyVwvLzZ0gI6vueIzpFt3Ug9ANCZin
 Y3zYv3A5gbtqelktc7Tcn+sQc7TOyp86yhR7HDb7x0sY8Zuqi9wWhGYS+y6wwaVnVVTsAp8GAr/
 QWLfCmUmGk1+/ZO3CwV/YdTTQafp5hggi/B+XagP7p8IsTcFscB/U/gQ/glT0rEZEDiVjG8Avh9
 0G+ar2j3GhiWbcqEIvrIdCCkq6BjUNWxkZf6ZyT0iRoM7x0DBVKBZmmHvFCb0pjH1Q22JEYIHWS
 b9zFo9PHyY3xTg1fmSma6BNDHKp0pk5uSWrzC6vcSIteGbAijpG7g/j0tlys3fuXtpAHKYkGFNe
 shycEc2Wbnw+JDNu0Zf57hBzjwNa9vdB/u4vbRcPjB64E4Vp8dudk2O0/aosC+fbr/+FXMf9YDi
 RdyyfX017LibTqVuy/96J7UY9urg2kHYUwvm5rJRbkja9ai8Lo45+rKQy+IaKjTtujmGJeip25L
 NooYfTPrQfv4Wd8zhzJ8DsDR/YbbjkVSiMG4MtKeVTF5JnniTQ5GWCQ8Len2OZUtdT5FsVyKpfo
 LzAftrxp1U0cANQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Mar 2026 10:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9092

The poky_mapping dict isn't used until after the replacements dict is
created. Move it's definitions to where it's used. Also fix a codestyle
issue while we're at it (whitespace before ":").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index b1d65b21f..25992e5a9 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -88,15 +88,6 @@ print(f"activereleases calculated to be {activereleases}")
 print(f"devbranch calculated to be {devbranch}")
 print(f"ltsseries calculated to be {ltsseries}")
 
-# 3.4 onwards doesn't have poky version
-# Early 3.4 release docs do reference it though
-poky_mapping = {
-    "3.4" : "26.0",
-    "3.3" : "25.0",
-    "3.2" : "24.0",
-    "3.1" : "23.0",
-}
-
 ourversion = None
 ourseries = None
 ourbranch = None
@@ -237,6 +228,15 @@ replacements = {
     "BITBAKE_SERIES" : bitbakeversion,
 }
 
+# 3.4 onwards doesn't have poky version
+# Early 3.4 release docs do reference it though
+poky_mapping = {
+    "3.4": "26.0",
+    "3.3": "25.0",
+    "3.2": "24.0",
+    "3.1": "23.0",
+}
+
 if release_series[ourseries] in poky_mapping:
     pokyversion = poky_mapping[release_series[ourseries]]
     if ourversion != release_series[ourseries]:

-- 
2.53.0


