Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBC1CA6CAE
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6062.1769501992920081424
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2E4vDHjm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 695344E422CC
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AD7E606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94609119A8688;
	Tue, 27 Jan 2026 09:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M0fLa08feKQhMrd0tmQkq6VIDfOPrb7vas9CtJ3N59g=;
	b=2E4vDHjmd9Pau7zE7k7WT/e8bcz7KPK7o6mUZMwmVPDtz3rXaMRurNJ23SEJq/MOBeljbM
	bcWDW+BsmSk546yUhLeRH6jgNyhH4861jPi7BgTi01tdNqAXpSJOy+w/niSImjoYv8wJES
	6HaAp9xgvoh6y4dl4hhQUaXNNjmnRwUDAqwBqdKmcWWx5zDbx4WBUE4yni0CZ8D8N1k4zJ
	ROQNLIULFe1OjJ9z/xlCB2kY2zHEdZtSdDXhpEtDBKPs7dqpOUacZETgHUyHnTcj9ccyH1
	KgIjxWs8s4fEFmNjNciZ/bK7dchkyJcz8Ay1rAJIdlWUyOFJNHKtrDarc8AbZg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:37 +0100
Subject: [PATCH v2 42/56] dev-manual/python-development-shell.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-42-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=80Dphat1hwGYm+CQl51ke0fwJG4JFBd/awjFMvyNydQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUEJpFJOSKrnyL4nP70Ag+p42MMPhsVhRrGO
 EfN5Ri09eWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 Nn5PEACcggLGhs6A5zPdAkFIVrRK6iAW67vuN9SVonSIQYMwhuhjqLk1xhljNnxZS8ch5K4OSCT
 oA5nFMkty7OL+v3YRNNZTL7+PpVGazuuAo5MQVUT2EOyrclovM5pMaKsMu2iTBUJfFP1+iOYjop
 EXJhOdktoCkIDhNOmqpd3AqYi4jz9dhgD8seRyx3tcxSnPpubakjAQD1km4+95JxHsa4g/kMbpv
 gY5RPvnCOlkT3PXlVhgBSSH/mELYLTaiRG6OU+qBOu+cEN1DZnler8pGmOEESBKeTUxrsexc1Gm
 7WzfZHttxjBwywJ7YxTpeupJLR7NbNmBSKxlrIj3YBcqBWhsehHhj7nhi6LCqsPSaScYyKn+5WV
 fBYntpYfv3lJCWLe8/zW5/BMWWe7DDLq0UOi2F1mmvkwGWyrdPZHjD0SeyU+w8xOmV7XWupfifH
 80L4401orJveZAYLbM4jg7PtKpue6j1A093YAJrZzyqdPlaEKTc7RSohY+Kh9b8/GaCwUOo8Wny
 CKHKpHl4PVyvNFVtt1xt5dsFgnGGigzQlqGQqMUxx75stciRmAd4dZylz6UkXwQi1HRrGMHR/hy
 F5+zsaR3EfYykPKHXwV3hAthP3LAABHQQPpcXTlxuufCRsTTqoXppF351eyMli0/qXiBJy9wWOh
 j2sH7gfXID1O0Hg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8703

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/python-development-shell.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/python-development-shell.rst b/documentation/dev-manual/python-development-shell.rst
index 81a5c43472..0756304323 100644
--- a/documentation/dev-manual/python-development-shell.rst
+++ b/documentation/dev-manual/python-development-shell.rst
@@ -16,7 +16,7 @@ the following are useful when exploring the data store and running
 functions::
 
    pydevshell> d.getVar("STAGING_DIR")
-   '/media/build1/poky/build/tmp/sysroots'
+   '/media/build1/bitbake-builds/build/tmp/sysroots'
    pydevshell> d.getVar("STAGING_DIR", False)
    '${TMPDIR}/sysroots'
    pydevshell> d.setVar("FOO", "bar")

-- 
2.52.0


