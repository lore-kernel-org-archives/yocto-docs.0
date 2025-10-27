Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C323CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31556.1761569064940825046
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q+oiEQvt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A312E1A16B1
	for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 785D36062C;
	Mon, 27 Oct 2025 12:44:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAE71102F2500;
	Mon, 27 Oct 2025 13:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TC5cC3+7nwLwRN/YzfFZkcwerHbu+pU/BEXqG/rRcw8=;
	b=Q+oiEQvtP5iPz9QCvwo/E4c6MY5cTLKncfGDIuPEig9KS2PeGiYDyHpmi1mpGcMtYAdotP
	Hdch8alKH5b5jThwb9fsWiYalz8Bej0YkXN3uNThfq7ZppkvffErhZr+oP94pvEWZx2r3l
	eUmNUNhG/d1dDvooxUEOd4Wfq9E70Lxe1EBVFN0QrUCHOaiY68aEtwHRYPw50BTC6g6jQO
	aKq/zP/inZQ8MPLDkR9oVDv4PkCTTRvlp/uhn3FYdylfWyKogs/JGw9TPDM9UPhvrrjtzE
	j9Qur15s4Y5gp2OuN2jOBAMw8Jp21zaEYz18idTJDnRe17p0kP0D/fgpRBtl1Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:33 +0100
Subject: [PATCH v3 01/16] ref-manual/qa-checks.rst: drop var-undefined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-1-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Omzp9bhO7JfhGPac+6+d3zqRYr2jZ1IghJTI+rWAPFk=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGj/aQSj/A35gsR13ZVuaEkqWwRhw5GUAdeoEUXG/gHHouVPt
 IkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJo/2kEAAoJENGAQUApo6g29aYP/A/k
 JRBL2t6OPqaS/TStI7WNzCKV2I3/5YfvvRgY7eLXJCtrMXnKRsc1neDiXy++CW9dBWLRlMSgEzM
 PNvFS1tGb+cXjfb/yICkxAkoI8iQeuirVmJqIhmRvy3QSAjQduBC3OmCczIxRaWukvetw3YtX6m
 D8lTQdJlZJB+7rYtA2qCn9GYtzB7jEvKP0wzYBMikWHzeRo8zDgsoODe9Ttb5pR0OAPBZnRI3qm
 X/nnLO/RmlWPxZ7WHkWcbIEWK1kf2T/jZFnmXFXCVPeEdTmo8BQ62kmC63MBLUsHksPfVwf72Sd
 DtOFqOkxUYh9iRfiMH3/SJA5/3zSICiMepcnF0E76yfh5aZdNAZRmaV/ZYbJDbWQZxvLlZueOHU
 XhTXUTCJVqK6xsGv/s6YRWffhgZUsgPtqs/QRQApU2drllVhYht8u7m6oEVkEII7EDrekO8gwzs
 VtXOekklTDeLDJgjjMD6JIhRq5M5tl81vYVcmhL5MM0ukGqvBnZqQQf/jLYFDjgi7SP2GdkIUyP
 y0CqCIqJ9z3oCocS9RaOUvM3MBjyNwfT8PCo0DJqo8TfAc5QGECmNa/LmAyhtKYcQ/l5q6rWoqu
 vdVieUkddbPcRt0q55DyOkZSr3xMCA6+j3mGIWElflzeZmT0bjjpPCsx8gh3o+tZxPTTlHuhA77
 14H7E
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7850

Drop the var-undefined after it was dropped in OE-Core cb69d7eba802
("package: Drop var-undefined QA check").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


