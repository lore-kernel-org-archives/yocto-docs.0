Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94878CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:16:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12907.1791810973201509733
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 06:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VJBUXVdY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9FD41A11E7
	for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:16:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEE6E601A6;
	Mon, 12 Oct 2026 13:16:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AF7D11D7036D;
	Mon, 12 Oct 2026 15:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791810970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0/uCjyyDfT1/HR/bxDOWnTd9LhJ5iDy4ViQCLUyekUc=;
	b=VJBUXVdYo9fj6VaOinREWXmAF6arGD+eE0NBfXuhAUiMEWzJMnqAucoEViVLX3gANIq0Df
	r+hwHGzUWUgDI1PWVSb/hZcIn/W0EGLTUs/PU4Z95n8yFxSBqegSuwScOem9u4sTmITtuD
	aYiChw46SJEc0xqAWN/ovx2XqLcic9Ponbyfv2l3ZbVspucT7Xs0BgDjIY1E5MJcXIUFlP
	aFpTAW+raNBBAcKVw4nubf8aZlafExBsimxnZwbXBvLho2/K9OLl89zIPp12Bbpp8b1uOQ
	u/IhtRnEFX2muDPW8epHEhAp4gRXdA5JcthlVFrdzZBmFZA2eLWm7gbJrXNzjg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 15:16:08 +0200
Message-Id: <DM2VZ7BND3RC.3MEAORR6VUHYW@bootlin.com>
Cc: <thomas.petazzoni@bootlin.com>, <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH 3/4] migration-guides/release-notes-6.1.rst: update
 contributors
References: <20261001130904.2061644-1-joaomarcos.costa@bootlin.com>
 <20261001130904.2061644-4-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261001130904.2061644-4-joaomarcos.costa@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Oct 2026 13:16:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10658

Hi,

On Thu Oct 1, 2026 at 3:09 PM CEST, Jo=C3=A3o Marcos Costa wrote:
[...]
> @@ -2264,6 +2273,7 @@ Thanks to the following people who contributed to t=
his release:
>  -  Zheng Ruoqin
>  -  Zhixiong Chi
>  -  Zk47T
> +-  Zoltan Boszormenyi

This seems like a duplicate of the one below=E2=80=A6 From OE-Core the same=
 email is
used for both. I'll remove this duplicate when applying your patch.

Antonin

