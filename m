Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC274D1713D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 11:39:44 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16296.1729597181545281438
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 04:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KlAWRKZh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EB53E0003;
	Tue, 22 Oct 2024 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729597179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlRnE+foVLWK8Y+VgrNmJlvCUzAvLlkXVdH1BbjFfoQ=;
	b=KlAWRKZhDGsxICkM0loL3WgULsQx+v7qdIjjFK+QvirlPo8ytKHiaiyLkRRf/9UmqO5vIq
	yQNTGXdVSvH4FQkDw8yo9nxKd7ihE8+6/Rm58ra0JETNBoMNb74qhRywPTg3adyldMjdyx
	xqgmR1s14gAo+zsC1rwrhbmmNIN3ekyqwhC+smsCab7WE6pewUOpOxn0Q5VnQg+O6CLgZV
	9MmQZTEP7PJDMcs/wLjs/Kfdn8REgLQnIwlTg1k+IilMrLugFmbkecWheat7085pwMxhF9
	u6461ks4MTFwS8ObBbC1lSS9qnq3v70E3cToRjM6w2nBQ6yGYB5dZRF+7WW9dA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 13:39:39 +0200
Message-Id: <D52B130IVLTK.28FJTB79L17DQ@bootlin.com>
Subject: Re: [PATCH v2 0/2] ref-manual: release process: update LTS section
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Quentin
 Schulz" <quentin.schulz@cherry.de>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
In-Reply-To: <20241022-update-releases-svg-v2-0-6e7740f9a41c@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 11:39:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5555

On Tue Oct 22, 2024 at 1:03 PM CEST, Antonin Godard wrote:
> Update the releases.svg file. Link to preview:
> https://lufi.bootlin.com/r/VXPQ7d5NDt#kPjQDABd0EORG6GJCMG2U0IdU1+tGuUMHvW=
k8GofBsM=3D

Realizing I wrote "Current" instead of "Long Term Support" in the diagram. =
I will
fix that.

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

