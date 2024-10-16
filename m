Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1934D1AD52
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 12:19:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.21227.1729081185333477249
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 05:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ViptMlhT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 596181C0003;
	Wed, 16 Oct 2024 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729081183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnKFgmcJz6pOIN5QShYllGG2ZrLy77h6NAcDzying9I=;
	b=ViptMlhTyw4DzJJj77IDnHhDj5+jGSVuKwV6zHz+Ve7H1VxM/KdEVR7KCcrFfuA/KhGucH
	2ujkjzxD4ytLYBPrNGniDPulszkxN6klo5zgTTy4/J/M8dCMR4pDoXEPDArvCsQ97Xcs15
	4rE0ytq7YHdjZvNjt+cOiMoDBDj9HhX08EPVzKWIAtEx9c0Z8Txt6FlTCGij5he8Rm0Vkv
	7NAPPnNTWsbjKepuWbHsyaDU7wQE0P/rMKTJI4mndG+TTqPNVGUng1PBV+iq2G0AoiA6OO
	I7rHb0/QEk51X0SHZ1snfb2SWp1JKP7/ZcH2XzsMvL5tK0OPJQHipoM8pesusQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 14:19:43 +0200
Message-Id: <D4X84HMWF4YM.2P3RXGI7VJPZH@bootlin.com>
Cc: <quentin.schulz@cherry.de>
Subject: Re: [docs] [PATCHv4 2/2] docs: Replace VOLATILE_TMP_DIR with
 FILESYSTEM_PERMS_TABLES
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <niko.mauno@vaisala.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241016115443.2751525-1-niko.mauno@vaisala.com>
 <20241016115443.2751525-2-niko.mauno@vaisala.com>
In-Reply-To: <20241016115443.2751525-2-niko.mauno@vaisala.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Oct 2024 12:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5505

Hi Niko,

Thank you, these patches look good to me!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

