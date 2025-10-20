Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41051CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 06:49:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.12073.1760942988802792512
 for <docs@lists.yoctoproject.org>;
 Sun, 19 Oct 2025 23:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tQeAcmSc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4DD31A152A
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 06:49:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC11B606D5
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 06:49:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A71CD102F238E;
	Mon, 20 Oct 2025 08:49:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760942982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=M/hHU4vyctZd59RWjLinKVpdXIhd44g/pvseE60urpE=;
	b=tQeAcmScSOaI8nxJunatOcZrt2i4GIVFzk4HZ0r8oT1Emlz6gBpOYR4ZzuE/vJWBYfS1Ip
	VvReaKi5ZhvFdJxzmN/WnQw5BplK1zWUZ6GSNB2oSVjuKIP3Yyxy4mFCyjc0hkX63GtgYI
	/oQZTHd70UHWZBsu7Hk2y6BjqAByUE5/jf8p/dIMkJAuyQ30rdyR1ab6KpR1pzijuaKlS8
	8YJ2m51HsTSSH0Sfqja43hjLkkfHRMj8SBLiAMGEv68+dj7MDRdutba1p8I5DWRfQZAwBh
	oht808lK7lMGldEF9BlzT1JYVoayIVVOwXZvFnja11Dgw0axYB8hY9NzXo3NYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Oct 2025 08:49:40 +0200
Subject: [PATCH] ref-manual/variables.rst: fix a typo in UNPACKDIR
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-fix-unpackdir-typo-v1-1-597d02a2c6b1@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIPb9WgC/yXMQQqEMAyF4atI1hNoo268irioNTNGoZZWRSne3
 eosP3jvTxA5CEdoigSBd4myuAz9KcCOxv0YZcgGUlRrRQq/cuDmvLHzIAHX0y+o2VJf6ZJMVUI
 ++sB59Ubb7u+49RPb9SnBdd1V2No4dgAAAA==
X-Change-ID: 20251020-fix-unpackdir-typo-1ec2b4132a43
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1VdAo5HqNswfxgImDB4tgLtCMicer6ApXBavCA1kZfk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo9duGLxcEAu3totG99XKE5EOX7AuXrAG2/tpdX
 +/WjjS8EHeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPXbhgAKCRDRgEFAKaOo
 NqDzD/9Y31/DHhOJ1pVf42BY6w05WemNcTp4DWQGs2Lk/tdJ3JCuw0WosKstqhnsU+gxo803klO
 TVUokLwAYjpqvUZf7o0bGdzpy2IjqHev0n1lrCB2G6+9e389B/kPpQ6FxDygC3WHeoFYRz7l49l
 8pI22x4BZnbD9bktAcBRWK45BJrKciKLBIX/OtMfxY1Ac2BT45257BWHc4pKjMynvs2JAK6vKut
 ZvwdSpQYGyK7E2StJsSRpSUFrMWW0v8/FRZhmy+tzbPgz1WVvDt98CTi8ikO71rqfxpgDnhxyCu
 uQ+pn/FEf7va+dH7lCHUtW74ndwtTZxtJ0w/MpekbgpPo5wf3jQ3SewMxoukjzBAKcnIY+Hg1bX
 QShCI+o4JnFn2sHkjTILoJYSNul1rPu37htFBD87krApOc5uXGXKPPxc8mlQJhBA8ZLriR2+Ebm
 VpMCwxOARyFiiIt4Zik/7KJVexmwDXWM73PgwYCijfQ8u3t5TzkFYvFI/Eq4Zrsull2PH1V9hUE
 +7yisqSFnhrdRzwAC6Rrv0ihAtHpL1cnDTW1D5F3WSMgBN4B4p1viHyqj9OtIj4XhPh8YctKTWk
 oqeH75k8MqUdwGnfSe0vQgxdd8cVkS6XohOBvZfM5+V2VVkSKtMdhLtGzGmVFQT2WFz+7ckrgxJ
 jNUb1wmvijOK1lw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 06:49:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7747

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f9faa513e..635fb662a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10999,7 +10999,7 @@ system and gives an overview of their function and contents.
 
    :term:`UNPACKDIR`
       This variable, used by the :ref:`ref-classes-base` class,
-      specifies where fetches sources should be unpacked by the
+      specifies where fetched sources should be unpacked by the
       :ref:`ref-tasks-unpack` task.
 
    :term:`UPDATERCPN`

---
base-commit: ba6ca13a2ecf844b6d072d0c2c102c9e5d38524f
change-id: 20251020-fix-unpackdir-typo-1ec2b4132a43

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


