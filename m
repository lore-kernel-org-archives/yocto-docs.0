Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 629E0EB5955
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:37:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41235.1770885470796669453
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WoJ4NucA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AB6DA1A0E45
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 805C3606CD
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAF60119714CA;
	Thu, 12 Feb 2026 09:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770885468; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hbvf0RrJRvC1xC7VdheEGcI7Qux1MGlEs09NKFn6w4Q=;
	b=WoJ4NucAoC0+rzjwRzsQnbE+8SCwhj9MJkQmMAE6GslWwMULl9nq2C5MU1QDWVtJWW5X7X
	oKsimrEMgxJVdkd5/hnSDVWH3owocNOhEVm7a4Bgv47PIYMUQswTpS13AMKpDc8+a+EaOl
	UvYhTRIgze0Cj2oYdSdqYAAO4RMvDQftxX4H7PytX5cWWlgq+g5JQdApqRX/Pz31Y1jwPy
	ZLfo6X1Oe1fkx+ek4l0PmqsP4Mpu3dWUMx5RCdgdTwplT+X8OMUhp0mhb2BvNKE6P52K4G
	kb+LKSjpcORTK3jg3vddNlOxg/VBvUmSbl0M/F6zL3iwnySF46sBzIlfO71deQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 12 Feb 2026 09:37:37 +0100
Subject: [PATCH 1/3] set_versions.py: remove duplicate and unneeded logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-fix-switchers-js-v1-1-16d95c74c328@bootlin.com>
References: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
In-Reply-To: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vZmbq5yDgAJ1gmJNSkscYOjbrXVCeZw+nprfmbRvRNg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpjZFas52It2GemMgluojOC5xszSQ/XO5lp5Sqn
 LLDp8/nk4WJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaY2RWgAKCRDRgEFAKaOo
 NiXyEACgJCmisR3kKDf4p5Ds+rPOkc6Hs1TEqN2I97NcSYhEeqB7LsqVGh68OSqEULWBN7LCbBZ
 cdyDjnesS8llHuu6nCoq+qy4HlnUv8sFOLwFTBZHyWBWqT8ogFyOnJZq5LQmSK41nv9HoIhlnbc
 Q+9OlyaBfePiI/11MhAm8w6RybHlchXad7WpOCZIZMeY3tUvKmLWyLwT+avV7qg/4u6DNEwC9fL
 zyYo1wyI9FFEYjzeWEkJ+GuDkxy2vlQ8zcGUrVkzP0Z83qEADZ732aRLQBL7P453ImcUUk5SnOO
 /b9jiEFEGcmWz8CSF2SuBlBisL0gdGtwplAv37MzV8JSj9q2BhamM/S/LMbAvBMg7d6defZnYwD
 2lpGGMyx0OIQVNXFrddZURbuaf2A4AQtAgnyLQcSu6UzaCZIpf76aII1SiSJxjhOu84SguyXCgo
 Nwu4IicpwNS5iamNdNKbwaUyAVRGpB/SkGn0U7t2eZEhPhNPC3rCsOWd8q9fljmr75fzS7WlUmP
 m1ZKNcJUCfdrU/sN5GD5kkO/gb4W/r5fp0BOY0l5RnZBIVUoQ0QX8S3rHEm2VshurSFS7+MF7G3
 oyM8tc+cCQwBPScM69aDKaKkqM9OpSenE/Q7SAXLW7eTUPFONu5Fz1LWdTjxZQZ86WU6vOXHhi9
 3ycp4qc0QatOkNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8896

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
index 78d0518c1..64b58f103 100755
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


