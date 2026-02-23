Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9DAEF5862
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32951.1771844283589605377
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 02:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OrMFRR61;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DB864E41030
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D71265FD43
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DF8410368F7C;
	Mon, 23 Feb 2026 11:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771844281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DcUaSDk56zFy15NZZicJeZQxoyReWaeQbF5OWRR5+jk=;
	b=OrMFRR61TLujzy1Uvk3BMABHqvxifWET8Zt4etkExnniL1j0bmnsa2R37gr5+lJ4i0Qf5F
	EU9xQtgbV8huAQZKlWSKmT3kEmxJsrXaQVd/6fM3KTdoIvCECgyEW0WXCsEHvbGjuyyB5s
	ohfRbT7wdnjgpSgXdMEBDza5a2InllM7yeUOABeDrT1DwYdX0W1YLLisJJJGxGcvYBUTBX
	gOR+6S1Fn3NIox3GjTqVlP847WdfyUrPf994aTzNPzknCpqsLY0wseQDIhrQFaZbc5KnIU
	3H6hfVA/hhAxXFJKmrwYK61KCexN3qZLh7wupjad3zrrLBvm//CKAFFJ/XA7Jg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Feb 2026 11:57:51 +0100
Subject: [PATCH v2 1/4] set_versions.py: remove duplicate and unneeded
 logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fix-switchers-js-v2-1-296523996600@bootlin.com>
References: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
In-Reply-To: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Y49vkxtYLJ5ZGY5KIolumlCdtIbPqWhk3w47QtTb/ro=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnDK27jHgVqLj6ja8ZaE4Ypj1HStJNy8kJMG5k
 GX+FXEpuQiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZwytgAKCRDRgEFAKaOo
 NvbAEAC6dkBkuMh5CsWaXQt64bBpafQrY1UbsPp1USfKZVeL5jDETfUJO8EH8EZoA/6oWhBYrXz
 19aA2WtF/zHAH2+LMnHxNjkLiGZMZ1ciXKTwZektJ4ASHkybsRk+dGQ1NRUvp4PIxO5PvB4OAAY
 d9i8sS0DSpHeZZYfIuzQkXJGiyvdqvDmDe5TFqg+fHjqa/f/JHDD7CpdOStrHklBMI502ZGxgl3
 0uCoLw9ml2QqOIdO2eJkyN8akxnGlKSUc6eCZDwCwa90lt1DE4zZDk0gLd+bHcBUwf4/nGYwOXA
 XsxDJt00KtXTZuPluziUGYIiaf5zi81COK7/Oy5z341UKVqSSg5UWhtQHY0exZILF0YjR/+DX0K
 ATKjjYE3dXFtyl8lWrNSMyJHqxBeD8DzXVXERXhRtn6OYKH4P1zwlWQNDoXxp1qJTuxr/uyrMRu
 XYst8bRVKPx//0b91HCz9/UPTLW+4Ci/+QLQOtFvv87dxuxKWGVlK9m0zlHhePG3x2sZhDj+yr3
 jwXr2wd7HDnWT9cbAdOiiaPJ76seaXV6BTCgJ+oyU0Nb4XmHfdOXMJA96tDCOqxEkWQ+OwBRIwu
 KQSJT0xpDQM6Q8SiMznkGPzBxgXnGk6HB0JiaBbM0r+/0lEy/RvsREaTiX/EOywtbe37GttIg47
 Jzl+r+N59AhUYzw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8951

The following commit will make it unneeded to pass the version to the
script directly, as it will be automatically deduced no matter which
branch we're on. We can therefore the ourversion assignment. We still
want the "getlatest" special argument, so read it from sys.argv
directly.

Add a comment mentioning that the order here is important for getlatest
to work.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index eec0302f8..1c7f5fb70 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -18,20 +18,13 @@ import os
 import itertools
 import re
 
-ourversion = None
-if len(sys.argv) == 2:
-    ourversion = sys.argv[1]
-
-ourversion = None
-if len(sys.argv) == 2:
-    ourversion = sys.argv[1]
-
+# Order matters: most recent to least recent
 activereleases = ["whinlatter", "scarthgap", "kirkstone"]
 devbranch = "wrynose"
 ltsseries = ["wrynose", "scarthgap", "kirkstone"]
 
 # used by run-docs-builds to get the default page
-if ourversion == "getlatest":
+if len(sys.argv) > 1 and sys.argv[1] == "getlatest":
     print(activereleases[0])
     sys.exit(0)
 
@@ -96,6 +89,7 @@ poky_mapping = {
     "3.1" : "23.0",
 }
 
+ourversion = None
 ourseries = None
 ourbranch = None
 bitbakeversion = None

-- 
2.52.0


