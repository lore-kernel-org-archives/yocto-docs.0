Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD2BCCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3543.1760604885315785293
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZgGsscVU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0458F1A1415
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D020B6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36A60102F22DB;
	Thu, 16 Oct 2025 10:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VbDBP2dsaFcog2aeFCF1g6BQjaRc9uYuz6UQfyp5eVQ=;
	b=ZgGsscVUJce5P0eQvdgRdotnqeNjc6ksG8IOMuI/7AozLX8n1EE6T1SlSC3p4pKZnorRh3
	mXVI7PviyCG8QXE3HXSYMkPf4xsBtzw9T/KIlccjJo09dKZolhuka2AymnYS2suj1Kws0+
	5Fwjm0eg/vnblM+xOQOS1cxN5pHJ6EYKKBFwmWwAv6txLtfR0ViCtM74PJYe1oxtnnf9IZ
	obZtg8sjY6D/cM0NPtl6cWmojl80a/VU3XlzF65hjzpOlt452ZN5NJ9Kg317mHCR4ZLT8M
	+yOg3zmFqQbTHNeNlDN21zhcRh+0nJOsmIMC0VeFX9ZfzIY5+xIPV7RqutsS5g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:51 +0200
Subject: [PATCH 01/17] ref-manual/qa-checks.rst: drop var-undefined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-1-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pSFgy7/4xsH08qPueToT4Q57PVd35qMwHQ5nYTvMOu0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLOi+jJ1I1Foc2wZKQX4ReG2OVLuCp1VJxtU
 TpDHN4C0GmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzgAKCRDRgEFAKaOo
 NkGtEACRGRTl9s+UBGFa2dCb5mUBqBeiVFoiPhkY35dL311dvgthT4TJlkric6SuO5vI/2R23Rv
 +Cpy62F7qedaMhLOdG01QxOY4HmB//5OdOFl3fSQhqxPN6Vl5O4TTNnnrmYwyPf587tlNMbIsDF
 Zm2c0KnOAcEF60cSRxFfbM7SAlPUi5b3Ooax4m8GJxWpwUrNlgSXPpgsPFjOX9V+GD5crLjZ75D
 edQFePVA2BfOS0drSUnmRZp/G4AVoF7UA6I6hwZdTFc7JlxoC+aMA6CmZ1XFgGj2Vuvc6WxjiQL
 hgFUMK52l3gy3F7pCcH0TM+zYBvmOLRdrN1Ep+eFWZph8K9wCWc8pP/aQfh4Hb6RHaMhoGCYOSM
 DEuySzJs37UD2lT3Ih/fmfclofOmZjdv5JoUacEKPzxfzWLdONK5CyQeFQEs6tOwuf7VdYLsTe0
 ta6p3jbKIPqMp1xcFM9rXQ4UkZoILMolQuezCLUBEGhjcWQ456F4iQN/ybmu3rJ4dnvgm1/p/5Y
 FOieH38EgI9G6HzbN9wfMIqYrSUcFhCBypoV1JSEwiriESG4Z4GUSaUz71M+/lNPIiRGbHNrgTd
 JZiCyakyhE1JRgbXuaWcMPPqMUbKNKjmi3VCEAAikNpRC7GBIIIksGVpJ6q7OmCpoaUsVxKxOOd
 XrujrnbfzE5qwmQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7712

Drop the var-undefined after it was dropped in OE-Core cb69d7eba802
("package: Drop var-undefined QA check").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 9dfbbff02..9654cf08e 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -983,17 +983,6 @@ message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the bui
 of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
 changed so that it does.
 
-.. _qa-check-var-undefined:
-
-``var-undefined``
------------------
-
--  ``WORKDIR, DEPLOY_DIR, D, PN and PKGD all must be defined, unable to package [var-undefined]`` 
-
-   Reports when variables fundamental to packaging (i.e. :term:`WORKDIR`,
-   :term:`DEPLOY_DIR`, :term:`D`, :term:`PN`, and :term:`PKGD`) are undefined
-   during :ref:`ref-tasks-package`.
-
 .. _qa-check-version-going-backwards:
 
 ``version-going-backwards``

-- 
2.51.0


