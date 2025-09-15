Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6A5CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 12:27:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.31851.1757939220539240058
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Sep 2025 05:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i/H37T4x;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C34DFC00782
	for <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:26:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1559B6063F
	for <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CB39102F2ABE;
	Mon, 15 Sep 2025 14:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757939218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RAOOyqsmnV08yy0lvRJx1K86bBPmfFJoauyB4THv3TM=;
	b=i/H37T4x5e2OROkLl10gzZBY5nqjW5PLp+in5h167dMQvE4w2PBFRxfe6VHVrxmBEgVoVw
	oYbkv2O/uKtq/2FMsE62WENORVTOwdjWEMrm+V7DcJ9ufFTEH4JqigN17mIZA17YqFDEeV
	nHZGB8iN0fCAHp09kaKJXfg7+Y9KkNVBMTI0krjhjnBMe1G8VfEPrFxN69ABHndLiCl/T0
	zz9aXZvXRg/PY+ATsK1v2TZ92Grb6Rg/lvNY38uek0XOmw+jgyPv7Tpgpj8BelXUzyFfi7
	JC9eFmyFbI5OWKEtOH3e4P8Xr+32M0bTwFRX501J1RmBIvWJ7HytkuVocmqxFw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 15 Sep 2025 14:26:50 +0200
Subject: [PATCH] ref-manual/structure.rst: extend PERSISTENT_DIR
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-improve-persistent-dir-v1-1-ba42b490453e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAkGyGgC/yXMQQrCMBBG4auUWTswLQrqVcRFkv7qCKZhJi1C6
 d2NuvwW763kMIXTuVvJsKjrlBv6XUfpEfIdrGMzDTIc5NTvWV/FpgVcYK5ekSuPaowjQpIQIVG
 oxcVw0/dvfLn+7XN8ItXvjbbtA0TsoGp6AAAA
X-Change-ID: 20250914-improve-persistent-dir-e8eac0abe0b0
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=x5iw3D/Zm9H22m0BpyISZowBSFSDxK7CRdO/e0h7UZ8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoyAYRcvZXxbm0leNh4jJnyIar444ERuoz7kvbq
 C5j5O0bCtKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaMgGEQAKCRDRgEFAKaOo
 NjObD/40PiP050y7OqOp4lAxGiBXNhuFOanwaey/mjZJ2ZBd8Fu/fduPhatEsdVk7xUqtn0w/yR
 rQewF4FJwuW7AJ9caskEKaxRDLY985QMFyaGsGLmFXF/Xjd5ogxyaiKDq3f3X+Z3m9S6Ui14/rH
 adQqCOWq4ngtuuAhxWEu/y9c/THY2gL8cKbnhbq6BTpowY8TxvRuHuX8XJNr+Iu4eYEHn6bB2DJ
 2dinFlUwQYgkgQNN+VRX+1HEd2bccaU898fCSQH14DCuU/Tl6ujeA7ctpAwN1Z63lasF7J45Bec
 3nlmufnd+GjrPdrtjZcnRcMjsDxt3SY71/GxhI56aJWPhY7gdrfNzr5XRBEyNeBp7L96uwbgS5q
 XH1goW44ycY+M2zhsPcZb2sWmXPvsPrFGZ3bs9g8G0qhjgvVuBgVeV2py0k7o/p4/TjIA+TQyLD
 cFM1jdHogjIrE0NVs96y+dE9AzNhIPUpRUnYC6TyZy9KpK8Cwf2H+zuPPTmx29nC99afYBe0BWp
 +UEZWq+ECr6koCegGWqGesJkAalCVOq2KY2dFUzh0DTlNRqNYowyxy8RAtNEwtxTk2zLj0Y+3Dw
 rMFys1pXQJ1EzujoVSL2gZdZSjXAtgbFOyPW91JdasRG6rt6DwFSD0n4kQKVKN80pi87dsqfjqB
 zZRTjvSB1/n7+xg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Sep 2025 12:27:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7515

Extend the description of PERSISTENT_DIR to mention that it should not
be shared between builds. Add a note on sharing the hash equivalence
database by setting up a server and not sharing the file in this
directory.

[YOCTO #15727]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index c9c44bc63..660cc9be1 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -253,6 +253,17 @@ It also contains ``sanity_info``, a text file keeping track of important
 build information such as the values of :term:`TMPDIR`, :term:`SSTATE_DIR`,
 as well as the name and version of the host distribution.
 
+This directory should not be shared between builds.
+
+.. note::
+
+   The default location of the :ref:`overview-manual/concepts:Hash Equivalence`
+   database is this directory (when :term:`BB_HASHSERVE` is set to ``auto``). If
+   you need to share the :ref:`overview-manual/concepts:Hash Equivalence`
+   database, don't share this file and instead refer to the
+   :doc:`/dev-manual/hashequivserver` document of the Yocto Project Development
+   Tasks Manual to setup Hash Equivalence server.
+
 .. _structure-build-conf-local.conf:
 
 ``build/conf/local.conf``

---
base-commit: dbc6137cd13f982a7fd4d1b2df79dccb177db0fc
change-id: 20250914-improve-persistent-dir-e8eac0abe0b0

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


