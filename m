Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DCDC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:59:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69784.1783000767601699835
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jul 2026 06:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lNHsj7GV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DFA984E40C39
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF2355FF03
	for <docs@lists.yoctoproject.org>; Thu,  2 Jul 2026 13:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9CC2104C9589;
	Thu,  2 Jul 2026 15:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gwfT6z9szEBWEVfE4dQUgelodIKd3Qzx566KjvIs2UI=;
	b=lNHsj7GVJlZxylCfgKonSeUXTHA3HTX7EttDKknvUp+oiOur1lGu6i6peJO1b0590ru1pW
	kVvOA0u/KoU09aG2GQxqItou1MT3o2PH8ZGtGYdaG1MK2yoXqHH/8ei+Vg3InoHonIMxor
	vImsW74RJrABTSE3dFGHbrIp6poOufSBrnxkdGs9OmP6froZNxmF3dZJTo2jDJzor4aPHY
	AjG1U7ooGWMsJAdOJEwPW0Ku83w/py/1B0vuWXPJ+JSWHqSj7NbNqecHKYX3sJbYmMO8TG
	iTAknGVVb8R/HnJSH8iAHTL/5lquyeablTy1CRnLaXRS+HHGyGzSuQbT6/Pxag==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Jul 2026 15:59:11 +0200
Subject: [PATCH 2/3] tools/check-glossaries: fix default doc path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pre-commit-v1-2-0ebd211b5d5e@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
In-Reply-To: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Yl++XvfjujrW8iKOhJr4s0jSMwgPFpbv8KxckYmOBAs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqRm668s3vjQO38vdcyw2sNQDx9vsYpShT8NGB6
 AFSeVdEWW6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakZuugAKCRDRgEFAKaOo
 Nq48D/97Z/DWKKkQVE8f4QYCa1NUhmac1fjGYbzG5zZ4GOjMBkBYl6xL/zhBgfT6f8UbZq4hzzM
 LMHzhhOZzg9KcRe/AevZzu37eV0lC5O4tE5ZSWh9iR4m1pQdXWYuHJwNyLb2KB2l/OTphqVP+LE
 95x79m2VMqovIuKFBEpLC8A+woOz15D/igVYr4AcMCkwMpC3BF7h3jMZXNl7+YqxZtipDzNOW2Z
 MX0cTdTxM/eOwi7q4ylaX3neu0sYqtkpNzJ6zjclEVRryviP7cyFz1DhbdcZ3FyzC7usAGZhhEO
 vO7MgD+DlNqoJ8vXKbRtpbKjAax2mZd6BIQsfmOjp2IySXS/U5CLAb+0QNR1LMg+8QSC7bttqBt
 hUzmpdQtgmtYzyg2Sr9TLUXszUC8hMb/ltN5df3BDox45ReeyFqxgQTQTxkCf2ROxp7tOiO2DhP
 8FXnWMMmMmJys1cspChYFbdRp/Lw27z59ULT7aPoDl9FTNA5PLFTtUjE0wDvXT0k4UFXxFsMuWt
 6QhXp/eVD3aNE2kChra2dIUEHuvz1XrZ1HZaNj+qgQ24hZ+BQUe1fwWR4/NfBQsPD7E3keoWPpt
 gF0B71GGMRBglWEIoVbZgjLSUgr3bJRC+EvKsmxkMld7V86LzZ1VIfDHPC7CQylqW8hHKDCFEZA
 X4jQZUa4hPZVSvA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jul 2026 13:59:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10001

This default path pointing to the documentation was wrong, fix it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/check-glossaries | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/check-glossaries b/documentation/tools/check-glossaries
index 9f1a47126..6bfddcfda 100755
--- a/documentation/tools/check-glossaries
+++ b/documentation/tools/check-glossaries
@@ -14,7 +14,7 @@ def parse_arguments() -> argparse.Namespace:
 
     parser.add_argument("-d", "--docs-dir",
                         type=Path,
-                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "documentation",
+                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "../",
                         help="Path to documentation/ directory in yocto-docs")
 
     return parser.parse_args()

-- 
2.54.0


