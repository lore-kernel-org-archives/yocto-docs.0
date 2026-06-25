Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34808CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7580.1782380032700009126
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0N3G4r/S;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10B904E408D1
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA21A5FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D681106F00C6;
	Thu, 25 Jun 2026 11:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XRqZFSUh9qWP02327uKTyl2+Eihwlpahx/ekpOMCdz0=;
	b=0N3G4r/SkFRJDDDr49OQ3tc94S+Qp4QQPFwfO5ZQnFS7QtqMiOeW9Bx5X0jGlzRvpzzCOp
	3fvDUoAiO7wHMwSQdYkWW+7qCytTHMzDKJ20fsgR1CD4lNUeGZNM5RCNa4zjEzzcGmKMSU
	cHLfiYoAoQe3D5az+WEd+g4Cq8f7sVNZTWLrT8revfr2k9bxJlIoycdQjM5slTTSJgOXIw
	Cd6B8LnjVj50bQ4/EF1vqW15el0YbYQmwr5rHuJKgyoOdwSyi3hY1ilqvMj7ErT56y2JNZ
	FXRJ8JObObBU39oiF6bp7+tIP9dytbJsaIeZ4px/19KLejwcCIys2kjDe7O4uQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:37 +0200
Subject: [PATCH 10/11] ref-manual/kickstart.rst: remove note on available
 commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-10-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=oWd9M2XN6BsrDqZeQzKmQCAjfWuc8+i6So4Iwr++2lI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX2ACjWuqZmJoXZPcgmOFrZcc8RHUvV/fR/r
 UImcY4dCgmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19gAKCRDRgEFAKaOo
 NoQXEADL2Pud5TMnxluKiykeqjyi56UqKVeHPZP7uEKpkOYwJmat5UtwTZWE5fjaXm0QqYro/m+
 XUgNMKvvmUDJiJyj/7QzjDB4Bn1TeY4PZnH04q1dS4C1Mg3a78fkkowWa+PfpyXiHfLMGyyiihf
 1OD2vXTSn1dbhMYmZG3Ll+ZgHjJWg7Z+y7NZh1Qmie/FlV1O7p/uuFU+numivGbr445gAsQjKm+
 MLuZL+YZNB61uO9jTmVIgwgDZF40mTXa/dUeB++RLKMSht5y6rS84Wn+b7pkBR/prMC4JH7bKzv
 hFA+kVwskDilKo2JJuRTmdszxMyHOmXuWgtrKSNTdecHR+J2MhiZGl8VVmq5DOioo8d2EDtwuVT
 E2N4gQy5Ho3LTRprOf40apShPZQZrqoJq9AKfHhG0BXzY/ch8W7vIle4rnww60CsiW0LG7bzYqw
 F11Bi6QbZ8T5DgLWi4xfm8deg2lvkXMWpYYvlKGxyxV3FfkdTqKLh6Awpg4B4LABJLFfP/EaGA4
 dK8H/9BWi+i+6fKGjqZH7kI0Tvdp3d0AT/n7Ob4ieKdTMg7jPEqrzciCnNwhkHKARJyTOgpN7/A
 ObFbxszhM/oLoWODWdqnxr+SNDVYx6IfFd7I8ZuwoCRjdqes6Iy44vH1YUqXeqHBRgld3hsh177
 bBsbRoO8suUUMxw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9893

This note makes for a strange introduction to this section. This is a
reference manual, so what is documented is also what is supported. Leave
the paragraph below as an introduction to this document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 9ab806899..692ee2de0 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -9,16 +9,6 @@ OpenEmbedded Kickstart (``.wks``) Reference
 Introduction
 ============
 
-The current Wic implementation supports only the basic kickstart
-partitioning commands: ``partition`` (or ``part`` for short) and
-``bootloader``.
-
-.. note::
-
-   Future updates will implement more commands and options. If you use
-   anything that is not specifically supported, results can be
-   unpredictable.
-
 This chapter provides a reference on the available kickstart commands.
 The information lists the commands, their syntax, and meanings.
 Kickstart commands are based on the Fedora kickstart versions but with

-- 
2.54.0


