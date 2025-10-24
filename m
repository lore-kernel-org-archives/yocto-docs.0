Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52B2CCF9EB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.4940.1761294031959723386
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pINKuFuV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BFD34C0C41C
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9981560703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63C17102F2482;
	Fri, 24 Oct 2025 10:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294029; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VbDBP2dsaFcog2aeFCF1g6BQjaRc9uYuz6UQfyp5eVQ=;
	b=pINKuFuV/uVYymz890uDUK6ckEzhIpiRk2PTBu44lRIVvX0VTsj1jY7TzUxaa+ILoZf/1g
	dJFx6LHs4qRHOIH8xL++DECX/khVOcTzf7w+IfWsx08GanKhtfHwXty/QztaW9cWmBgR3c
	RtqZKQXQDGYLfCxnvlLNB1MSlQ/3mPae19kAnFtD8izPtKW2AkO9ZlUwnHYcfjI07i48Kf
	7RVVUbMaVoYUCGWy5vGi9+EFKIGxo5a7Hbg9EMyOCPcdQ+NmO0dXFrXerMz+3U3DPj7ySI
	bBjJBPJK/lkM3w7zJpOjYkbDQ0D9ZsmUXpsHtRnIbQ7RS36IL2VBN34sLEMsCw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:50 +0200
Subject: [PATCH v2 01/16] ref-manual/qa-checks.rst: drop var-undefined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-1-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=pSFgy7/4xsH08qPueToT4Q57PVd35qMwHQ5nYTvMOu0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbIOWUznxwmH8zGMq5hGROdFWZUIifGOaODM
 k7hxBj8YUaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 NtAaD/0atWLfJA0r03zW1+YhvvUY2JIdQpQB3foewL4/88RtnAxI+sVHnRi4EUYyGdGi/nR970t
 AycVke/IAWbTayIGkds8zA0RQQeho9C7M96aWxhZVzNSDqY1nFS7PryilpqYhhYjsRaJi9XRTMX
 12ukywHcaOUocpYYort3Z/LqUcyA94Ev0qNw/kdvS4sj8cqzT4nEm2hknSTKE3R+KzEWjD6+eQu
 0WrsOMlrueD5I2/J/qjUQFTr64OBg363IQSYjFRf/TBK5bZPqosLhhPWGwnGXQ4LCBwz0McUlj4
 YT/dJxf6T55ImK2zBJ763c7/OQ8BOryXq5nOVifsDrsAX8fIdOCS+EyallaSJNZybeP237ldJep
 dWMKWt+KXwlBixDErVdHcCF3d1XIQM+DYkolsz74e/SFLix417f7ImbxTPtSYvzxB3d2rGQUmki
 8n/wDAE7uzkWVlXUGjRB4q2Sr5Sv+Cz+8vebR2lmVlBqWgKJqYn09JEC8e7vksXaKolgAJpSymI
 WDB4aEcXytNQPWPQFOon8se6O4TmjILa6pPR24TVW3paKxljZDksNTF8rXhHhu83flf+apFai+4
 vUxSy022P3LpsnGK06Bkb4TzWTFniCQOc/Vvyj6tlKl/jUs3+DAPjbcFUH2maR/v/+u0Bqd2O4R
 1KjkE35qRqZHeFA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7790

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


