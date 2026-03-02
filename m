Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7651E9B348
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157215.1772445258569840812
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=2EL7TRir;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06A8C4E424DA
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D21AD5FE89
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4790A10369549;
	Mon,  2 Mar 2026 10:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pE4C91hZC/TFfSvPYlcVNg7fnIBczf7rOT41gH8AFhE=;
	b=2EL7TRirUZp9Ikpq/zlBXTj01YzbfZyNRaiAHf7lNrEdLREwi6hxeoW71yZOmHNHgH+hce
	J2DLtQQCMAdNlyCXPOG0cabJc6P6v2QJAPU1x6LqkwCcGnhcpb9yut+FWPfF2HMtMX14Gz
	4vjq0/s7m94MK2B6QKuz+RzGkDnM3NAaWKtM8zzjuKZDYTdPbgNipWcYhkYvU+YzKwYmKd
	Yj4nTpWC+uQfrLiAeJ3+Za2ZqUssMsb60+DdIvXUqyIVF7buLQOEh5i9iFG40P6pyBWzNO
	3yOYBPQ3lDGDaBuox20Vv7sIkmtrSdl+DgjxjFolKBfube5tE06gGtAQY54dCQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] Makefile: pass -silent to latexmk
Date: Mon,  2 Mar 2026 10:53:33 +0100
Message-ID: <177244519645.106718.15931668192036538085.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219-latexmk-quiet-v1-1-acc137bc88b9@bootlin.com>
References: <20260219-latexmk-quiet-v1-1-acc137bc88b9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9026

Applied, thanks!

[1/1] Makefile: pass -silent to latexmk
      commit: 3f4ed1d410bb962fe3641a12c9c030a258648249

