Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B7D609B0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 08:30:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.67653.1732696245076112082
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 00:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eixguafF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ABE51C000F;
	Wed, 27 Nov 2024 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732696243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUQ5v1iSSkkDkqZUi5DqLRY+dOXTm3IktOk4gCYQOhc=;
	b=eixguafF8INiArQf1jdOvFTYTM1vnifvO09Qvkzd5hOWdvyVp15FcRV069fuMXIZ9Jigfv
	YucehkLij8cXW4sg56Stdhv/vrVfPaLkjqrIisX5UJcT2RYfde47+73Xg+YXWcDZBp6T6C
	4wThbIrOi6wV6fPe7cTfXQfznRa99hwLU3xrSTibID3pqz0yxEqQFiXMm8AXoaLmUxkMcv
	sUhqeLAEntq4Mt1WR7vWXSRBFZ1frHQLHlasnp0eaVpytYjrf/q7bABTxRnzCu+NLB+3AU
	EtisjwEQTqQm2jWcGCLAAycEqdUPioTNB6uDxrjlrESwTXazygdbgJnPpX0quA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 09:30:42 +0100
Message-Id: <D5WTK11XM3AO.RVJBJGR398G5@bootlin.com>
Cc: <troy_lee@aspeedtech.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v1] ref-manual: uboot-sign: Add how to enable ATF
 and TEE for U-Boot FIT image
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241118062113.269253-1-jamin_lin@aspeedtech.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 08:30:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5821

Hi Jamin,

Thank you for taking the time to document your patches. I took note of them=
 and
will make sure to review these patches once your patches make it into maste=
r in
oecore.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

