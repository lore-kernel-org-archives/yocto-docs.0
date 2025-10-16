Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639EACCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3550.1760604891263482882
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AwNvi2AT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 007791A1415
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB4086062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AFB6102F22FD;
	Thu, 16 Oct 2025 10:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j0kp1v47Dur4sJeL9dJt7ywyLoTzP5CGccVLNdfD58Y=;
	b=AwNvi2ATSIpgivmX2qKcKm8OGFIOj5tT7kOuhzZhZ3hEHKjyLXA1/q9t8x9uAMhfSwMKIN
	KoOc3rZxz/MbcowjvxdEP7Y43KE1I2XxQ9aMoY9VAUTxQHQTOovq27r9YEioWwK4mZ9C1L
	vCXnpJzxuiofvOph++rMMffJ+iLMjlD+d8o36F3pkCKlFyqfDG3cy3pA2nTvWNI8dlcb10
	zip/lWE5t+wLdVJz/cTP3030ob/EjmyRr902gNm2FYybTDLHQaa5nHh9mnU30lKdFVUOHR
	waOu9rRkLvHxQSksPM+TnNGXkqXnP+FIEoITgGO+DYCaKYfJsxPghArGUqWCiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:01 +0200
Subject: [PATCH 11/17] ref-manual/classes.rst: gettext: extend the
 documentation of the class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-11-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rV5CpVtRufGCdMs/EtHeQr++E1P8yThB8NvNI1YAhEw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQMCBx7pEnYrGVDeY1KqSiQ3V9/Daf+JIQL
 Ap5QdRQ9DWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 NgcPD/0dPx4mtC4QLsy65RlFkBfk3px5SP0Xlh+XZvbg0n2zbWbP+bbgbuD1sb3Jw04yiE5IICN
 CowSvdQBgOVvE4uw8VqHkmrgNJjcpI5t/nCfkMjEQ4+2Jlrm6h1qYv8A7An5ICwJ+irx2O0RxP0
 eCv7f9cFhJ0dUBILPg6PjK2NZ7ORoCQO6DGA8iSyf3HDG6TJehQQP0YrJExb4GPtnaojuFH7mIZ
 fNh7qamkR3i2+3zsMVmiVe6Q3PEACTqL6TVpAxaRIyweLIN23QD/qnn0VUqggW+hvCPlUEwIkwW
 QgGxWlmPlD4rBXn8RFtxmnn9VwUAIMzEFDe6nT8m3liIpzm6VUZjCxgNWUGbIxvu03/oJ/vHLXW
 AWUtzh23I9yIEI0kobEphjLRbGsYmkbZAEijKg+7m+HVaaYmSwsskJH3OpzT6eGco+k5+IBrnvc
 d4IqDnXc3HGLbz9YpflTd3HMdsYxt2GBfayESQ1BSl2h7BtczOvXniMMiwYtPczuA2Qrx1jaYn4
 iLW3nZv4v5BxaizzU0b2tUuwdO8sCjVtVG3uxWZDd8MQSO20Hen1eelHDH5OmNZcReFe8bSGf6r
 uD5oSkgWz0BFDBheTppokhraDhpkUZs/2KXGbgIRUouzfmA+lYM5Chc2a2fzt1d0I0XHVU3nehl
 UHt9ZgZZGBVW2MA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7721

Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 68edbc9dd..d898034f4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -968,6 +968,11 @@ software that uses the GNU ``gettext`` internationalization and localization
 system. All recipes building software that use ``gettext`` should inherit this
 class.
 
+This class will configure recipes to *not* build translations if the
+:term:`USE_NLS` variable is set to ``no``. It will also do the same if the
+:term:`INHIBIT_DEFAULT_DEPS` variable is set (unless the recipe inheriting the
+class also inherits the :ref:`ref-classes-cross-canadian` class).
+
 .. _ref-classes-github-releases:
 
 ``github-releases``

-- 
2.51.0


