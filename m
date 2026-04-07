Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836FDFEEF40
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80900.1775567615550112575
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=0VL2uRzf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C4EF8C5B187;
	Tue,  7 Apr 2026 13:14:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AEDA603C7;
	Tue,  7 Apr 2026 13:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5574910450143;
	Tue,  7 Apr 2026 15:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567613; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J60LwlmXrs+0O//Z71IfA/6qvGgLe0eSiXXmiLGNtg0=;
	b=0VL2uRzfpMfS+Te/9D2Aw+6ycpnkz0bhfomC249RouWOAm9IQtwze0Lbg5Y3C7FzK5QlBj
	XbpFsei433oW5nVLuAiG5nZQQfhkyateA0YJYCDFr+2v79//5np5Khn0hnsnFdsXZilR5P
	+tKDW6u1+gJ+fu33nvQ/iV1kqQEdx7+FAnJKFa0Ce1iW4P4H/QB9850ibx+Wof9jDMufnO
	yoK3RZDScq98u0aSL6C8m1EBa0KsMGPNzJssN/j81KAuCUfUJISTybWaWaQYNmq7iCrd4Z
	DGSSbug6RBUNvtN1S3/zuD4u3oUJv0M+PE/tsl6PGLHeceeErWeQZtYn/HNUOw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Francesco Valla <francesco@valla.it>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v2] ref-manual: document the usage of FIT_LOADABLES
Date: Tue,  7 Apr 2026 15:11:45 +0200
Message-ID: <177556742871.245356.6559053659020417351.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327130349.843041-2-francesco@valla.it>
References: <20260327130349.843041-2-francesco@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9191

Applied, thanks!

[1/1] ref-manual: document the usage of FIT_LOADABLES
      commit: dc1574b9f71532c469f355af2ff5ff5664083e48

