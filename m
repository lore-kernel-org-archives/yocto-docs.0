Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F7CD6DDE5
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:48:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.15137.1731656902174061037
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 23:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EgMYyEzg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 136911BF205;
	Fri, 15 Nov 2024 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731656900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jk0+UIL/crXvA7jyfJkfdOibCIbgRbdhtQ3PN3sbuI=;
	b=EgMYyEzgvqQ3rou9CBByZ2BdGfgZ+Y/LAkmC+kDCmWW9xWgYcIbb40hC+vXqnFOnWfSQXf
	qXDDvhbpqp5q+Dg8kYCXr2pbuHbzfN32AMraFzUS6hhUJWCagQL1f9+m1XLvk79XWBrXMt
	cv3cdSDSxI7clgn03ISp9eWJcjK78JN3EmrXRoBSvO5Yyv2wqLpmGwK06+bvu9l3ELo6wF
	oWTa9xMLPljDjcI0j6k1btYhFNeHximqt7x5vXBtZcDq87o5M3axUgAt53/CkPlDXuB3e1
	l7FP2Y28tF/byvbj1LWGlxa0lVIzmTKav5emaY0iM46XT8sLTOTt0VuF2nxoyA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 08:48:19 +0100
Message-Id: <D5ML51LALKU1.2LSUHFK9U8MH1@bootlin.com>
Subject: Re: [yocto-docs PATCH] dev-manual: bblock: use warning block
 instead of attention
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241114-remove-attention-set-warning-v1-1-8d620e7aee40@bootlin.com> <b5d34c24-48c9-43c8-8891-c350a4a06b1c@cherry.de>
In-Reply-To: <b5d34c24-48c9-43c8-8891-c350a4a06b1c@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 07:48:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5745

Hi Quentin,

On Thu Nov 14, 2024 at 4:29 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/14/24 4:02 PM, Antonin Godard wrote:
>> Sphinx recommends using warning and note here:
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#=
directives
>>=20
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> I guess we could have had a commit with more changes in it. Except if=20
> your plan is to backport some to earlier releases maybe (since bblock=20
> isn't documented/supported in earlier releases)?

It is: in styhead and scarthgap so this patch will be backported there.

> I think it'd be nice also to add this to the standard.md file we have so=
=20
> that people who take the time to read it would know to use these two=20
> only going forward?

Ack, I think it's a good idea as well. I'll try to send a patch :)

> Thanks!
> Quentin

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


