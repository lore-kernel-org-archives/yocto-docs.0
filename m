Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682D4C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16460.1782807204368984372
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qOKMlJ0+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE55D4E40B9E
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8423460233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1A29106F1C21;
	Tue, 30 Jun 2026 10:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZSZCf0g3laCV+TVBkK6H7ceUswplTc5BuKeDsfbk14A=;
	b=qOKMlJ0+1ZfVcNqk3pn2t9dkQPyX2dooVFJABwjW4mqbWIQLwWCE05fBwY3RJnSAi2/86I
	64T8I38dTLcDp1frDbjAa9TskZMuSJnJw2nJOv3LzFGaQRUvrghTq72KT5z/wjecXqcq92
	pphzFqBCqGi7Ha7N6b0VQJMi5icPBchkFa0eJ4lb2b8TWELiXJMeD4rdDxmP8li0fzAUbT
	1VkIVvGrM4O5V3j61h0LmbWUgytD7Q4sPS8yurg5AembKv+4Js4r1ZA4R46l+CKwK4xhrj
	HwS75yJNIdqTU69jWfaHnWv/XberR15nZ6iS9ureO3Gz1yEctFu8MDDWL79gwg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:15 +0200
Subject: [PATCH 5/7] ref-manual/variables.rst: document the
 LOCALE_UTF8_IS_DEFAULT variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-5-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=k5aUh2uKeTJ1tYugCjcDB2l9S7kzTF/VlEUGvnmtR1o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qcWd8vpndwfUZ76RvZNK08I2DMDXJEm6JLB
 HpU1fbGmYuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 Nk/wD/wO8Ur5pwKqeULqRq1+OKsF2nSbzN60uFINmG84HuZzHVb4jGyeAaj7BuT2xZGj/nRtgE8
 fuubMsnXpMQmjEwukeWzpfJ7E/mFGQaGoMmLf/xhDwWabcNxxc6cMWDWFymlJ/Va/FbR8bWQd57
 UKGC8kuW798IvvCSnD2Jv/aDLbNIAEhYCtltqfA893v2up+bgT7SYTVCnQzUlruVdNf0KEGHVVb
 8CHBuJHOujmiVdgKE3sOhQKmxwXRw++T6hFbUW8+PTKfrvLp5RlhqBql+PJeaL7IQ5dxk4eRj40
 XiFoFwWEZDzyfnNzUOszaobSOd692QoyOwacyt4azpMNvulDA03Ybp5lhhBc4H8+P765Sp41CJw
 p5EKCwdY0IOVchnYebmkzPHpJJP+Qwk9qsXfoOWGGja5bu8YwcHR+ctfYZpqdwycRRGG5/Rg5bV
 JLZ7PjvLdfHyZZtBXdDK9hTGiuI8WV5SdPmvr+IaJnZhQe/1sgv6zFx6mKvY2A6JYuUn3eF++OP
 FNEExmU+LjzANnqCfmVCWnp+4bVT884kxfjtopXiercO8j/03UNvKZ52JPQ3sxYTX60oaSvMfZd
 j1jrnnuPqInvH84vkzKvI0FJ48BaAFxeRYsI5J6r+ZN1BVx4lvm3YFPNbFtqcVgxVDcfJB5Ajqm
 z8acUt/Tgb3ehsQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9986

Added by commit fcde0c43f7b5 ("libc-package.bbclass: add
LOCALE_UTF8_IS_DEFAULT") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 231f61d37..20bcf8d60 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6083,6 +6083,13 @@ system and gives an overview of their function and contents.
       :ref:`overview-manual/concepts:Package Splitting`. The list
       contains ``${datadir}/locale`` by default.
 
+   :term:`LOCALE_UTF8_IS_DEFAULT`
+      If set, locale names are renamed such that those lacking an explicit
+      encoding (e.g. ``en_US``) will always be UTF-8, and non-UTF-8 encodings
+      are renamed to, e.g., ``en_US.ISO-8859-1``. Otherwise, the encoding is
+      specified by `Glibc`'s ``SUPPORTED`` file. This not supported for
+      precompiled locales.
+
    :term:`LOG_DIR`
       Specifies the directory to which the OpenEmbedded build system writes
       overall log files. The default directory is ``${TMPDIR}/log``.

-- 
2.54.0


