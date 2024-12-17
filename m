Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A5E7718B
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77900.1734427636455325530
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xlc+xvJn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E771D1C0017;
	Tue, 17 Dec 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDWu0VmZsQpgYdShLPH7y0FUq4M0QzSiY7CFLgilDBA=;
	b=Xlc+xvJnat51EgoebEYtk4f9eSuHZsQPzhS/wL9B8BLEKgMnXX1g9q+r1izqXzEliftezR
	VvjG2bks8txMAdb3rftP4PmwXXe6nGlUYDfq/cZ/wQDde0OcnAuI+whTDeChJsfh0+oLck
	RNs8KrJzfKmhIH4FYjRMWRUkTUTWSyVVTi3uDyPv+42GApFLDoV/RzfVtDvDAwEl16VGNI
	fPgJvGkEh17Su+yOrYyYcfYRYWYcmk76MHcRqK0Yb4Z70xm6tmOKkt1anDmnOSOzHMbEgk
	LLgGKiU0I63MpBRNX09IHoWKR8m353qJkEqKYkVmTSYfumzPPefWsdqYTwvX8A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:06 +0100
Subject: [yocto-docs PATCH 07/14] ref-manual/classes: document the cython
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-7-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nn7ITXrBEXJXCAtDFNE2hO3RqTm97SvMhMR9sc/VWZ8=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGdhQ/CjjpZk+NHi7mtBsTdmsm8KVrXnVEYrhwpcEGQXqt/Yj
 okCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJnYUPwAAoJENGAQUApo6g225EQAIhP
 0p8vj2SCn75/Q5To1KdvRQvgTaMStWYoYXbPXp9IRIQdsN1BV0dl4M6N/8WivDBjgK4wfhPNXBI
 mpyu50+hWkdOUTmXKqFOvS3Aml9hTWHJxvjjJR7prPTuSbRDlnLctC3BwBDJpDLDJUhWXc0gl+h
 zrE6eGydfLPQvjcp19Kdvj2u2UpBYnFfvk+x8CT4Wq/1y3GxSqGDSPcWYOGoR7uyPfWmWupxfvW
 rmAp3ukmzWsfs9AFVtXbFQl9JDyGI+UDTtHt6RCvnNUkfOLfCDeMWLUd9W+HX9GMXjf1kpX6wCQ
 SIP6FnfpXB5MIJlo7IwddsgzZwVbSOgLjwFSx+6ZNUMw6NBQfg3ctDK/1ra1NL+c48aXWHFxXqN
 TqQJ9E9z5msDy6JVFXJ6djC4cV7NKgEY3bXSd/6jLRDk89UmSKszuVlKlF8T0RVzAnq/gPYWX57
 toZzNWgkxHbGMvrTMDkDsDr7jgaqYP3l18Z8nHw9X9EPENMRJPZKE4Oof4+FtdVzcFGxqU5a/zg
 RVd/CVIS19/dqaVIQVE0whADanat2PapdRdjUxapCNgFxPd94MungLKfsK67rueU9dZtcsQtkYL
 OTtCNbwwPUk1MvoGRM5YF2PVs8wfhOWGkdPU7Xf6N2SDbzmkGehVbT/0mYqA9Ik/yuvq/mUbCf8
 6wKW7
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5940

Small class added in oecore by commit
64b6e8580842949be58f97f4dff91d1f097c4020 ("classes-recipe: add cython
class").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3d61d8d7a00b21fcff82a771f9718013fae36694..47f049c7435a989f30c033b7b12d86482686ac77 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -614,6 +614,17 @@ You will find some more details in the
 ":ref:`dev-manual/vulnerabilities:checking for vulnerabilities`"
 section in the Development Tasks Manual.
 
+.. _ref-classes-cython:
+
+``cython``
+==========
+
+The :ref:`ref-classes-cython` class can be used by Python recipes that require
+:oe_git:`Cython </openembedded-core/tree/meta/recipes-devtools/python/python3-cython_3.0.11.bb>`
+as part of their build dependencies (:term:`DEPENDS`). It also improves
+reproducibility for these recipes by stripping potential leftovers build paths
+in compilation outputs.
+
 .. _ref-classes-debian:
 
 ``debian``

-- 
2.47.1


