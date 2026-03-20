Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A145108B8FF
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 10:46:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9824.1774003591728541477
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 03:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VBYvHqKN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FA25C4042D
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 244F7600E0
	for <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 808C010450B9B;
	Fri, 20 Mar 2026 11:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aNGSuQlzwhJupM4BGQYpQG9MuOtFSihiwhnpyC6meS0=;
	b=VBYvHqKNv4JvWq2Kjy8Vyx0GzCiCEx2YxnW29FRxiiOZ2G0Y8BJ8oIeE/PnFUzARW5quhQ
	OrMe9SippOVlP+Aa8Qt3sFeHasq+y6wf/Q5kkj9TyAKxEXM0/DJ6SFAf7H9K7ghJ3Nzjts
	LCYajhK92Icj1G7LhuQkmixq37j+CpUtTAulOR30cHf/MZReg3n7/5fEiQts4sTFEOuFNk
	BBehOeAnI7iHZdN6pSnTnRme95ASCkveAj4eKvuGF9uI4Ep7SaTCsSWW9bNzvUZJBWUR69
	4o7ABFOMEtM27B8M/G2GZOtBKd7+PdXVIR0t7U0fMLndjYg6ZRls53aWe1K4hA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:22 +0100
Subject: [PATCH v2 4/8] ref-manual/variables.rst: document the LTO variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-release-notes-6-0-v2-4-1bdb1eb142ae@bootlin.com>
References: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
In-Reply-To: <20260320-release-notes-6-0-v2-0-1bdb1eb142ae@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=89Cb8rY5BYdYmebCuwDjgHr5FVPqETGjxWYdT3CrfdU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpvSWBvE1Dm/JpfpiGqndqVwd+bT/zaGAY3DpV6
 Uco6LjhGb2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCab0lgQAKCRDRgEFAKaOo
 Np4zD/sFryuU+cl+QXjL2orRurUw0JKGm1YOMEAkEs/zVCLGDkSjC29aFtaBsZaWltTCsr4KU4o
 hbm0Z7mHYsK8AyDMP/XN3r+XzN4hBIlXpOlmWqSvKqlxyTuRgRqQfdo13+AZvcBWKfhtMKMbAIm
 0ZMJNmBaurirK/6NLtRntzfQzDZ6J/Xbul98mQxwihGj/DK7xMIdZpABAG2m0iBziiqm90qbpuZ
 fht8JYg4WgzxnF0e8GyHWHhoM6ClG5gCfbYeQPNrgVxHdD7nyrF7T3bce2EM0+tlREbz+NHOByB
 cnpi2Q2/9nlD5kQj1s2o0NueDAZSjHyG8htPfpqmiJOCHwAUqvK3yBfo6NoEm76Juc39JNgiij7
 4hprG3vEeh+pbRWVifa3e8PnJxPxRRkGbWxOOM2RlJ8QNyBgJ68JqsPWFGzXJyneqeozCVVNiEF
 2AmkNy2eRKFuYMkj5TU0buPRhiYVT3SsLjjBl88ndAfQVbZ0fIRnukPlTyuloswDvg91hAEdTE1
 N7JAjrPqbXi7N8fW0oj/ilaQGDJjCHTYBPSwUV7BnY9ORQKdVwKjaxFIjAJQi6PgRt2g4i1w5Va
 P38XxdrhxogR+mrmlPYIkP6pBZvO1KJ6W/30e9px+Wz/zPOVFA3MHyNaj+AIVKwnhDlK8Vkn0zl
 wV+4oY1VL1Ucgqg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Mar 2026 10:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9105

Added by 228b5a91516c ("lto: Add global LTO distro policy file") in
OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 45542d715..6c779e42d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5890,6 +5890,13 @@ system and gives an overview of their function and contents.
       For the directory containing logs specific to each task, see the
       :term:`T` variable.
 
+   :term:`LTO`
+      The :term:`LTO` variable define the flags specific to the ``lto``
+      :term:`distro feature <DISTRO_FEATURES>`. The value of this variable is
+      appended to the :term:`TARGET_LDFLAGS` variable, adding `Link-Time
+      Optimisation <https://gcc.gnu.org/wiki/LinkTimeOptimization>`__ flags to
+      the linker in-use.
+
    :term:`MACHINE`
       Specifies the target device for which the image is built. You define
       :term:`MACHINE` in the ``local.conf`` file found in the

-- 
2.53.0


