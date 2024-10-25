Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8403D0C603
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 12:00:37 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.10358.1729857628286021351
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 05:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ib51ibmO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CA3DE0002;
	Fri, 25 Oct 2024 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729857626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D6AqAKyFUKChZnLIYgDrZkOxHgSts+dWE6rkYFfTqME=;
	b=Ib51ibmOBekusMrR1T+7AwIL0VGKhPs377+HqRTf925ZiaGnRnurM2bR2NXglDoDlLta1l
	EfCFUvR+CkkX7OQGusHUU25Dc+Zi2wkm2VhL65E89m5jMWKwdQaSD6jotlek+QrNNvDKXl
	YWGrWpw5Bzr6QoRrwDcGQEBSH9r1aBUgI+1Z/9uDCxekQhG5z1P47qxIhRtRkcR0kdWVw3
	b30SK3auNraaIF1l53H+q88wgEZ/KkoGH9JEBmwzI/C9hOR85uz6NoTc43TQ4iRAz4Qj53
	Qb1yEHTdA9TswJBMd/hYXmw70Fsu8zGkl7XqfX7+57wCE+Cr4q8zPZQDCVBuTg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 25 Oct 2024 14:00:09 +0200
Subject: [PATCH] docs: set_versions.py: update current releases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-update-switchers-v1-1-5e540ead879b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEiIG2cC/x3MSQqAMAxA0atI1hZqcACvIi5qE202Ko0TSO9uc
 fkW/7+gHIUV+uKFyJeobGtGVRbgg1sXNkLZgBbrymJjzp3cwUZvOXzgqKalDj2hczS1kLM98iz
 PvxzGlD5BWkm+YgAAAA==
X-Change-ID: 20241025-update-switchers-6d72cd2aadb6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ulpADluJ1FftYmrtdlolmOW+XCU09NVESu+rd5XPvnw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnG4hXSEzsvZ3+V2DjBcysFUWWk55dGYtiDPPX2
 MZxVRuI9CqJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxuIVwAKCRDRgEFAKaOo
 Ns/fD/wJS0Xoz0nN7hCR0SAGznXpzCX3uDZQ8vBXxG2y2EJ9cN0s5wkH/zUG+uD33RAWqFOo94p
 9cJnR32ivFcUjvtlZ0hOdcQGmGgVleuiwdRbXq2MEVb2ZYmrIZL2Qx7DjHBkwzcpz7N13R99FMS
 z0pK2QAAAxZ/7VuKYZJO9l6cbSmtAiNItgqUceIlLaWGs1fXmOUqCnGO8qrlFUohY2Sm7/1E/O5
 kkZWljmV6yfWfFj1y/FKU9lSE7CQTzGH8Qvv2OZ7cUULIGnFZL2DSdv7DW4jeW8CsPgH69S8SIk
 g6UXooI7JWPza+h4espKDATah2LRR6TnjA4hDBJGhQPfQkKK4pDfbjnmDpTctJx0n8cFnGBWqxC
 +UkB49P9psAhzVTkIZFSeubHH9Opoo6f2CNnqB6s6o7NyD6J31CE8sJXGGl3e354dUCe4W4WnFx
 6YX5tfo2I5tn9ggqD6FSGjQJpYrCxJnjwhqSJhia8cO3zNRyCPB2CZ5sdhcDW5Z9MKu/mTh5n4b
 M9WcCnRNgHlnfJu7fzdqoxAxYIGIR7FerKZPYiOTsV/eqoLU66Sc9ZFkT9kmpnzaxTB2ZH5zqdW
 5Xtai0MKaBfccdjDkUWkz/XvOnwbsykmDBljqVd9S3l4gbq8M0SV+1XFTL1GWohhSi/M0uYDZSa
 Y73k1+mGJTOsUpA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 12:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5589

Remove dunfell, nanbield, add styhead as active release.
Remove dunfell from ltsseries.

The switcher menu now contains:

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
@Quentin, I'd appreciate your review as I see you modified this file in
the past. From what I've seen locally, the Styhead release does not show
up in the switchers. Is that something that is done automagically by
the autobuilder?
---
 documentation/set_versions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index dec078083441263cb1350532b2749f5ee222d555..77fcedef7c28165704b79ab8d506a466110b8249 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,9 +26,9 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["scarthgap", "nanbield", "kirkstone", "dunfell"]
+activereleases = ["styhead", "scarthgap", "kirkstone"]
 devbranch = "styhead"
-ltsseries = ["scarthgap", "kirkstone", "dunfell"]
+ltsseries = ["scarthgap", "kirkstone"]
 
 # used by run-docs-builds to get the default page
 if ourversion == "getlatest":

---
base-commit: afeded9939777d88bf4cb9ebf7a61aadd476642d
change-id: 20241025-update-switchers-6d72cd2aadb6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


