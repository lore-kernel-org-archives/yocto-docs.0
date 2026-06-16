Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A5CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:09:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156707.1781622579118350135
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iJBCw/vg;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A5DBBC2BB33;
	Tue, 16 Jun 2026 15:09:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15069601A9;
	Tue, 16 Jun 2026 15:09:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 379A7106C9E16;
	Tue, 16 Jun 2026 17:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622576; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1oDQ5W0wkjw2j/Guap3KeIDaOOWqT6pcP5yASHyFbuc=;
	b=iJBCw/vgYkW6gChFGeUJ5NmZuSec0+scsDxDW0cKs7Qz6LCuT1y83mrACoMK4OTAFFz755
	RjjDMASNSMEA0wgEbZUf+Frhpt7X3DNk6vNWjXZIngWe3Tjl3CSU1tiInIxy7p76xQe2mz
	bqx7wgZQWzHP/i7OtDrONjmKgSzY4xbjEKdzGKrmvidQze0RO4TSntjc94o6txRQDO2Zj9
	o5gAmRz4aY2MpmppkSL2ektDZqqOQ8bI5vWNDiz604tJ6eHvZLgtfmXOv+87p3vOHbWcOH
	s+8mYPCYiK6L+PaRwZTPIbht89u4ydJkfsaK+3GXrgRpM3Y8KPYoihy3xUTTMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:09:35 +0200
Message-Id: <DJAKHS9ZKH4H.EVUQ62UHJ1DQ@bootlin.com>
Subject: Re: [docs] [PATCH v2] dev-manual: update bmap-tools package to
 refer to bmaptool
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <f1851b98-7b99-e132-8ff1-a63a5e457089@crashcourse.ca>
In-Reply-To: <f1851b98-7b99-e132-8ff1-a63a5e457089@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:09:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9754

Hi,

On Tue Jun 16, 2026 at 4:16 PM CEST, Robert P. J. Day wrote:
[...]
> +   If you have this package installed, you can safely remove it
> +   and install the newer ``bmaptool`` package.

I'm not sure saying this is relevant. I don't think those older distros wil=
l
ever deprecate the "bmap-tools" package name.

Antonin

