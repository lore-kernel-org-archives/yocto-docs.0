Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F19C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47277.1784725108979580443
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=G9uE14dx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4AA094E40ECE
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19A9A60388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CDC311BD3D01;
	Wed, 22 Jul 2026 14:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V7r/yV9m1m4mDYk7tncDnLfhU+uBgjOy5Z/cFcqQuJY=;
	b=G9uE14dxibO67Q/3FumYCRSOr0C10XpwoJkdyHaZIR4iKtk0MQcugnyWjqp9kM8YqIVAV8
	BDGTrCeGQncKPcENynqlfVj+8jmu2kR1hKz+udmn0VhT4Yhho3VC3NOZ+njqIUYIlB+17b
	LL2xZ7z1HXTuXA7va7psWyFRkjfmeLj64DQj1DKsxEogP9rQt5tBZH6VWwwFZ6/RGBQxiG
	hh7DDZ1QNauF0VA4HL+MKFF1v6jkrX1Uwv/BF4jRIqR5HxHfK74Op+EgyV93ApCQ8qQ16V
	KTqFBNwDuQS7nXBT2t++HVoHaRWucqYiWGmx8d8v6+JZJGZlq8mXxaVver420g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Jul 2026 14:58:12 +0200
Subject: [PATCH 3/5] ref-manual/variables.rst: SSTATE_MIRRORS: remove
 directory structure note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sstate-mirrors-doc-v1-3-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hQmvAzoudH63vC0ls9vR69KvZHCqYem6AKRyrnVLo4U=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5vmikSI7Eu+gS43T86g1tYW5OM/yWUl7dEu
 mDkDjhuWfyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bwAKCRDRgEFAKaOo
 NtG7D/wOr1xR7KotWwRfBFIvWizIqkQBSJVYg6J9PtNWRDXBOoLQcUTW0iwjycGraIC0FcVU4ZR
 /3yjPlPufXg7OUKdkxc36kM+F8KzKynkmtMPI+1tQWYahvOFHaoFY66qUaAwTMbzfR144EtfqDx
 uFzD3w3SgQnuNoC0IoSlcKKiqXiaLwx75uC1BOABKBwniustzCeIVCjs9l4emVC8iF2Hqz4vpfB
 ir2nGZkiMsC3fWv6GVRWWiLTuztkFWJLJx91TwbuGKDszUD1uw3NY/asokk+WFCFfu2i9ZnY/Vc
 TG+7eZjsr2Pdym+O7l5DV5gjE1Y+mk0rlnJiVmsC+OGWO93TEzPwy964x6aj/sYoqYWwT0vo7hi
 ybjWNCgT1tXwg2QPAmi8gJgYGSC3qTD54SLMJYwbek39pliZHGJ8bcZE3RPLOaOOcAzSIhKkRWU
 93GwkdlEDS3Msfzns5yYytz4TUTnCBBDZdSNbtlJh40Yki8sDhYZ7CX8P21K+GaHomMaDr250j+
 03h5wFTLyTYXgHxHwASodw43XFsFgzoZ9CBIPgJW7RmucuUuJ/hfRjmEldAUyTutna/4j5+aO5c
 AdfB/fvxnKWubTkHd+uODg97ZZ0IvlZ+W/9NYkEorYBlVy8QNS0NmzNxwBEawhL001n89g6FX8t
 e2PkB/zm/YkhQwQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10109

Setting up a shared state mirror would most likely always happen by
sharing a shared state directory constructed by BitBake, which has a
specific layout. Otherwise, the following definition:

  SSTATE_MIRRORS = "file://.* https://someserver.tld"

would require the server to have all the sstate artifacts at the root of
the server, in a flat layout, which is probably never the case.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 4344b6143..e650fecda 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10100,15 +10100,6 @@ system and gives an overview of their function and contents.
       cache (sstate-cache) results from previous builds. The sstate-cache
       you point to can also be from builds on other machines.
 
-      If a mirror uses the same structure as
-      :term:`SSTATE_DIR`, you need to add "PATH" at the
-      end as shown in the examples below. The build system substitutes the
-      correct path within the directory structure::
-
-         SSTATE_MIRRORS ?= "\
-             file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
-             file://.* file:///some-local-dir/sstate/PATH"
-
       .. note::
 
          If the mirror is protected behind a username and password, the

-- 
2.55.0


