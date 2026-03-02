Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57A0E9B36B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 11:05:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157968.1772449501790026538
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 03:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=O54kSJ+5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9FEEA4E424DC
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 11:04:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70EA15FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 11:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B614F10369333;
	Mon,  2 Mar 2026 12:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772449499; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Eqr5GLF1F3o49a13vlIjQWWZwKvXDw4bCYsHri6GeFg=;
	b=O54kSJ+5p+u1flZDoiL3ngh61RTo3R0YOqvkdAH1AdMCTS80a+skwDgPNMi9cYgPN+hr54
	8ISJupvA0jvy/7EXRO1xhOfuaEXrU1Bb3jsd2QuWUFc0XnIwJBQvtWcLASHTEoH8pArUrQ
	3esQjHPB2ZSX6fAiPjsLFIgPOR1aqCbq2MgV7lKeNtFuC/RA24sfvDlL0FMDSxjnFOUbW9
	z3OOO0Kt8nMvI5wIeji8NYIIHl3tZqXoL9SHqgxA8R32EbXGKHDHgzQqR+W+HzFzx13QKw
	wBwOgLyM6SBHnhB17lBVJYliVf+R4OM58teHzwzw4H5o9fhwoTWDNTSKY5NyAQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH] ref-manual/system-requirements.rst: update supported distributions
Date: Mon,  2 Mar 2026 12:04:30 +0100
Message-ID: <20260302110446.132075-1-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 11:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9039

Update the supported distributions list based on the active workers on
the Autobuilder. Also refresh the end-of-life list.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
index e7c1c3916..7b4f9136f 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -72,6 +72,7 @@ supported on the following distributions:
 -  Fedora 40
 -  Fedora 41
 -  Fedora 42
+-  Fedora 43
 -  OpenSUSE Leap 15.5
 -  OpenSUSE Leap 15.6
 -  Rocky Linux 8
@@ -91,7 +92,9 @@ organizations publishing them no longer make updates pu=
blicly available:
=20
 -  Fedora 39
 -  Fedora 40
+-  Fedora 41
 -  OpenSUSE Leap 15.5
+-  Ubuntu 25.04
=20
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has

