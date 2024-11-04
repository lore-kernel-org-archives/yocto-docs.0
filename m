Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3A6D132B5
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 12:28:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.56399.1730723332145517045
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 04:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JUqm/63i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6658A1C0002;
	Mon,  4 Nov 2024 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730723329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+5zrns7HHVzLhGpu3Sx8n82R4XDkd43qEET/o1PVHI=;
	b=JUqm/63iUAtYybNtdJl4GLTE7hE6UxsCBB0dk+J3hjjzN895U0POGISjDLfC+JzuNLN1yp
	x9Blng2kCEMsxxO4lDWjuxcVmY6uwwGjhYhiPJIENhYXoxbn1FD953lrX8IHA9mjCQqCX3
	whE6+eP7ry0c5mqPisEM9dNjTrAqAcIRkMk/ZCFfQdmMcZZV5193H3iD+0MIs0of8WunDl
	6niPxIJHpWna2wE2aIW66Hueb+dtdd9wVJQX8ZqBYYxf3Xmt5ta7e/Ywdix9yq+EM9ns6T
	ov/jBYLzEPqwkMFihGbE74ysQhReqoWD4lCfQtpOkpSVA/cT7aUTnD0tOMUBuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 13:28:49 +0100
Message-Id: <D5DE7T4YZ8MW.1N8ROIUJIQUSC@bootlin.com>
Subject: Re: [docs] [PATCH] conf.py: silence cve role already registered
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, <jstephan@baylibre.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com> <337392e0-c192-49d0-82fe-0eaaa9d43953@cherry.de> <D5DCKW2IBZAC.2RML7Y7RASG@bootlin.com> <d2525b56-aba5-4ab9-a355-0ee7781f87f0@cherry.de>
In-Reply-To: <d2525b56-aba5-4ab9-a355-0ee7781f87f0@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 12:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5653

Hi Quentin,

On Mon Nov 4, 2024 at 1:21 PM CET, Quentin Schulz wrote:
[...]
>
> - rename :cve: to :cve_nist:
>
> Easy to backport, easy to replace with sed (s/:cve:/:cve_nist:/) no need=
=20
> to get rid of warnings or implement non-portable hacks.
>
> I'm biased, I vote for the fourth option :)

Actually, sound like a reasonable approach to me too! :) I'm working on upd=
ating
Sphinx atm, so a patch should come sooner or later.

> Cheers,
> Quentin

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


