Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480D4CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 10:03:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.5212.1761127427060856910
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 03:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y7P+Pge0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9736C0B8B3
	for <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 10:03:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C3AF606DC;
	Wed, 22 Oct 2025 10:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72CE9102F2393;
	Wed, 22 Oct 2025 12:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761127424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ce/wf7cGvPM/cLtPOUlh5L/jH6qaoboGjyalOU3CJZc=;
	b=y7P+Pge0wqfVzBIjMOpUW9ztzwAAweKCKJQM5m6y56nVio9+v0TVihotULRFWd7RfXHVTA
	Ooci/eM8UIpm0RuIGonmokrYh8HuwfPJRehi1V8uUf86fsJ6dGltFi8hchv0c8kLuNuN+o
	ym6AxRxNzqFlE2hT9CAAiIeWDyMX7lAqs/sasqs8B6T2E1mPxCVysQ1VpU+QWvLp63Rs6a
	HzCWue44aIAIQmR36PdTODeuqOOkCGgN7treNMbi0CrPhwil9XnRnouyt0hSV27J3gPtUX
	sJvDpviaLke5h2MoOLA/qrEJBsCdqdL88GQF9eiw9CsbD08zY0zUhG14boyGGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 12:03:42 +0200
Message-Id: <DDORKH0H6AA1.21MK7K537IF7B@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/classes.rst: uboot-config: improve
 documentation
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251014-improve-uboot-config-class-v1-1-9163eea15557@bootlin.com> <c9d8f46f-9d92-4258-bc17-443578f03b8f@cherry.de>
In-Reply-To: <c9d8f46f-9d92-4258-bc17-443578f03b8f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 10:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7767

Hi Quentin,

I'm going to send a v2 that should hopefully answer your questions and addr=
ess
your comments.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


