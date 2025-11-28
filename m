Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C970ED116E2
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18704.1764344115298341888
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ih0mObkz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68EAE1A1DEC
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FAB260706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B589810B02062;
	Fri, 28 Nov 2025 16:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zkkqHOw901HTRLTaGKSmNh7RqvzN2iY3bpZdkOm2Gtk=;
	b=Ih0mObkzne0EA75O7XCh2Mn92XN9Br8zcCy/5OzLm+dFU3ciaEvMGlvCR2LUQHgixgWLin
	SAluK2gYNZEY+K8iFQM1sPWp8kQt8KwVAz0uysEO0WkItG+GdHFiCdLB9WtVX3S+x/0Fxc
	/cbOw/344bacYWuFkClUcj7tfunpKSk7nu+LmLY5bgYL+mBrbPDuAObiAehb4iHxRaVxqJ
	U9rMjAyWsFVq3WrxDDS/XfZEgqu0m6m6oJqK3bvur8ksrYlXbR0EioJ23TKOUoU1TXv/Zh
	cvkAhdBOUxN1dPlsuuXrGUkInHqIGFY4pX+Lp05u0b+Hh0UK+VrUcJmCNZyLKQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:34:58 +0100
Subject: [PATCH 1/9] dev-manual/limiting-resources.rst: update how to track
 pressure info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-1-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2129;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=h0uTy5UDZ2gqASTsaIUvScf1MM5PDZTJlWXfPaX5Nx0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEtAfp+eNwYAHXS9MFO0Byfg/IkKCndvNDeJ
 +J8pNht4ieJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLQAKCRDRgEFAKaOo
 NoJjD/43zCvS20H6kDj2mYUpXbsnIoKoXLKOvsiUTb6hpy0IfzJZ0YwEONY/BKQE5Ze01noRP8/
 ELc0ZTdJiyqaUGjHFJyawII+fxg+yewCvlDVbydWzWk0vQ19sKrazabwHCprhJp1hiMDGVEiByJ
 1DqNAeqgDjlOflsChVRvLyUVQ8YH+wNV1A0tzm0Wra3xCK7XusySp+V2xdsTFlOsbinS1Bokqod
 gvelmIU7WFhEquzuRKUUJc9IeU7AlJDpJh/MPN8s+8qXmQTihPFH+5e4siZ19IOe5I+3beu6hs2
 pLV5OacT+Gx0Y+niIyyUZyUTvC+3hBFp3yrg+VierDciV9LfOvDiSNfGN0ZMZHHtf7dd0YIxo1a
 IwvzxWG0hat0WACOHb+NTz0N2Gthlq/E2ppk4983nNVWaLsqCgJWFt8OqITX79qVYz+EAv5Tm01
 w5Kkxh+F4utH7IoeCZc+eJgy2IDXL/DbA+SN6k0ixuFKW9oCiL4XRXsAmNGejrQcbjwdJMk+bxf
 uzkvOwY9VsiU0fgAZTvaziEoQEA+9TGY0Sq6lZ0hThlXQ+mGjDcj8GnRUCHhIiEjMywWfLQSni3
 Vdl5JKpbthPAFT0XlwY2AWCXsk4f18p5nS8Vp+kt4JH/aiDDXtrDaWXewKYu/1U+1WHxeatOXAY
 oKHHwkIWY4h4Igg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8163

After commit d492bbf0503d ("knotty: Integrate PSI reporting into the
UI") on BitBake, the pressure information is no longer printed on the
console by default and has moved to its own log domain.

Update the limiting-resources document to take that into account.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/limiting-resources.rst | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
index 0a792689c..9b3db0a59 100644
--- a/documentation/dev-manual/limiting-resources.rst
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -112,11 +112,22 @@ details.
        pressure evolves during the build. You can take a value below the maximum
        printed value as a starting point.
 
-   After setting initial values, :term:`BitBake` will print messages on the
-   console in the following format each time the current pressure exceeds of the
-   limit set by the above variables::
+   After setting initial values, you can monitor when the pressure exceeds of the
+   limit set by the above variables by running :term:`BitBake` with the
+   ``--verbose`` and ``--log-domains`` flag:
 
-      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
+   .. code-block:: console
+
+      $ bitbake virtual/kernel -c compile -f --verbose --log-domains BitBake.RunQueue.PSI
+
+   In parallel, you can monitor the pressure information by tracking the output
+   log file:
+
+   .. code-block:: console
+
+      $ tail -F tmp/log/cooker/<machine>/console-latest.log | grep "Pressure status changed"
+      NOTE: Pressure status changed to CPU: False, IO: None, Mem: None (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
+      ...
 
    Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,
    Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO

-- 
2.51.0


