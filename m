Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB50C982DF
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11653.1789739658458167995
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2ntcL+Ul;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C64701A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93CEF60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D87810328FE3;
	Fri, 18 Sep 2026 15:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BBK8GTFZVQODIPnQ1I2+T6wnIVQxEewzAGU52yo58bA=;
	b=2ntcL+UlQU2EskMVUIb7/YmgXJVtJrlmG6C2+6Yal65CvtecWRuVahq/CrIieXJDP3bwwj
	fX5vuLllimDFiDaWBaqus4PkLlHNNTvCvNaL9IAopM+0qS0GudhDhjOOHNV0UWuLvHKTg9
	tiiMsenGTEqdUOfEtBneGU61L53HzPnP9RWmwTfI03kUx2j3LPgvQzL+wc1QVzPIu1KZlQ
	ZkWO2S4js5I4Rjscozo6mx1e0F3nljB1E9LXFv3dAU6z6s2lMg1eCPgo3QnXoyyQVV+Oj2
	+OY78iumyd5nevsIno83214At2Cyt6d9DxgCddkJDOMljpcR280ae2lUQHBwNw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:42 +0200
Subject: [PATCH 12/20] ref-manual/classes.rst: document the python_pbr
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-12-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=fDos2nhF8mWhvCg/m6eJ3C0A/1Rd7NixTrNaXkrLct8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJl3qr50EUY+6jLvTuJJtwAK0MhcKWH9IsVZ
 Gz8dknWUwuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 NqcKD/9F8OArZI/En5eofQ9J/RnoXDLzPwZXWG/kPSBQNTs0GleaxYLgJbxC0auDtuWufkkIm6v
 +E2E0jOA226fROBw1u9eLYJnnnFwn4z5KWMchFLnrmR+sCouPUWhflufhfJuE7Ox7tBmyC7nW7S
 mKe5P7upLqXzJCJUcFNLUtPdG/kUbFAJXmqtTebOO6GdWxsgRYipKMFqTAEJuXoUzVujkft+AuO
 KOU/tYrAUpATVu3lL4FoXLLspCVKT2WfQVUNGsWUfE1DV4bjdeLVadk+73gltuo3ujeIuU6IZDM
 hE/eaXBQhIXno6XyU1CmKsSPKw7VGZeMAiJ+KHEXQvN7c5nejVOK94290yQ6pynqUyOu6sa3nIs
 EeTrjjc8Edo5L2VJxB6pK9wXhrh47zTwAOf+FeGUlG3b5/uTYxjtzBe+qyzrk1G3j4eoVL7g2sO
 afPxtAv1TWoeopPx9Kpu/cE9W0/XsFFt2uz+P1wmHvk0lvccngO9OYj+tiU1JVL6hUnJ7ISdaLI
 kSj01Vl8ROC2QyTdSInjFzGEGSZBkMbDSXJT8j+6NXv5nL1u4tqEPHi070xmvGpk09ayQvR3wNW
 PmhgK8Vy7RfIcPaJZJRXKBbEPGbQmjbg59Xii5JJRGPBTQVm6kUhWzA4Jxu/0otV+ZSzu7UdwrE
 HGLNkJuGma2v8mg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10544

Added by commit b9f3b369b853 ("classes/python_pbr: add class for
Python Build Reasonableness backend") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index c88180835..cbad93e8a 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2194,6 +2194,18 @@ meson-python build system.
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pbr:
+
+``python_pbr``
+==============
+
+The :ref:`ref-classes-python_pbr` class enables building Python projects which
+use the `Python Build Reasonableness <https://pypi.org/project/pbr/>`__ backend.
+
+This class adds ``python3-pbr-native`` to the recipe's build-time dependencies.
+
+Internally this uses the :ref:`ref-classes-python_pep517` class.
+
 .. _ref-classes-python_pdm:
 
 ``python_pdm``

-- 
2.55.0


