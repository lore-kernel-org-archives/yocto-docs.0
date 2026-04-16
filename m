Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F1FF8A16C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 12:29:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12769.1776342587495027982
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 05:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uiycOCqG;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B3B2C5C3C6
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:30:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F96A60495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:29:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4404210460076;
	Thu, 16 Apr 2026 14:29:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776342584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bDCwalznyeBgx9pQhMl5B2QZkpcXDnS5zaBtOKMopsw=;
	b=uiycOCqGmxV4mrGPqvp7ozTqcsupKpqOjPd1EtjBNGXnTcEecnEyPp9kv9CRGmS2apTx6p
	MclR8tbNoB+qjX7fC2G0zSR22/KNGO+20S0BTF1v848+1k37w2JzJWJdT58XRh8gxycRne
	UaQfdJ7Da6sm3hJlx7/x+W3BAFLY7lQpN/LuDRE9qi/uezoBjjabxDwiXPPD2ozpCTQl1y
	QHRYndAa+Z3+hzYcqkyVkeZa1XL6U5Nh2EMGBir5CP3+dFbOOBbLkaHps2EX3GHPEToyvl
	KqSnYGuuKsDeC3QmAkLj1IUA2+VeqRecnvaCa7Jj2i2yIImlZO+1WWLuq1GDZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Apr 2026 14:29:31 +0200
Subject: [PATCH] ref-manual/variables.rst: fix wording in
 COMPATIBLE_MACHINE note
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-fix-compatible-machine-v1-1-dee3c0d32431@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMBCE4VeRPbuQpNaDryIeknTULTVKoqUgv
 rupHj+Y+XdKiIJETbFTxFeSzCFDlwX50YYBLK9sMsrUqtI19/JjP0+LXcV9wJP1owSw0b12UHi
 a6kH5vETk5RVuu9tpc2/49V+j4zgBHwPoS3oAAAA=
X-Change-ID: 20260416-fix-compatible-machine-21f1be0e5243
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=SAQd4QE4gwc0PGJCDo+j9q83dQ5CkLgYRCvvy4xCsBM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp4NY34hjJ4Y8Y5HGcN09b6ojNsNt3VGPL8FSvc
 7cLXX5dE/OJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeDWNwAKCRDRgEFAKaOo
 NuabD/oDciGoWk3JW606OwkOh3q95xnOeUVNAsCnXY+sWOZphRwZ+Xwc7KS/K26gQB4TUA1e58t
 GW3usEKtwgKcZ1GyLGmfoGaIAa1uOLIAGcQM9gVGkcL8coAd0tgWH3EROXAskZJBd1rwMmoCGmO
 zsGVwRTxXAVtQx73IxORZyQslnyl9IljxGQLMORoguDYlFq/ZFf4sDmFWU+tKOqsXyTxv+n/a3z
 FuLxIIXdfmKDw8zsgEhIrj0c4Yp5ePl6cyRLOZuySFjn7FORTrHGgQqKcG7UgJW0K4XFdsT+O/c
 3UZ/JVca4/BF0ZnnvZZJ/XsOlOBBzbFmXfh3FGNT9PP0xTYmCy5JvltQPvLXN8RRwE+1vHwGK8v
 0BM0CFUHyVIfFAOKPZmDB6De0An2uHWnXpx/wtE06XQqdpx2Ch/F1C8nx8+2oe8tU7JF+RcLA2d
 61qHGw4rXzI7RpYXE7aHEFlloiYtlKz8SUtpa4NSo+QmRnkzySrejEndlPVdNZ/EE7n+GjkBMju
 x6iv4DydTGJgz/r0nb153QP7w8jVfn/UkaowbPujmdx01FekNUwX0fFjIMUJxWf2t6BDUmYTS/T
 CRjUy80SyOy2TdcTLrj6K50jpTph/XR60OivTaLMgCcfSweKmKU2fUNeCyJnLkJvaReFlYLn5+q
 37LGi8HZFsRfQPg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 12:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9257

Fix a typo and a misuse of the word "inherit":
"in a recipe inherits from native" -> "in a native recipe"

And the next sentence also uses "native recipe" so this make more sense.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60e608c0c..c828a8d06 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1679,8 +1679,8 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         When :term:`COMPATIBLE_MACHINE` is set in a recipe inherits from
-         native, the recipe is always skipped. All native recipes must be
+         When :term:`COMPATIBLE_MACHINE` is set in a native recipe,
+         the recipe is always skipped. All native recipes must be
          entirely target independent and should not rely on :term:`MACHINE`.
 
    :term:`COMPLEMENTARY_GLOB`

---
base-commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90
change-id: 20260416-fix-compatible-machine-21f1be0e5243


