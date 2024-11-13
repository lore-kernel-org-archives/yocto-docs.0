Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE797D462CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 16:02:52 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.15319.1731513769076997368
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 08:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X7MxRThn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2191D1C0003;
	Wed, 13 Nov 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731513767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkpWL4v3aCA5KTMAsoEU3MCXg047r1Di+f2tHINF9tQ=;
	b=X7MxRThnSNaNe6//5MVhTlfRLtzAyilsNdjyjcJ58vgGZbrwSkMBembxtjIOuHaQXZ17xi
	dnNA3QqKhYJapnNC32pDORaIosVw7VYK8hfef+W3X+aHOEN7jMYqqYOb/q7lPBwPFQI1PV
	SWAzPY/40je6CSSYJVUuMARfLYKvpRtEy/5VoVmWnoZKMBTq7T+2HymRH0Qeft1A5oGmqJ
	PdJOjVCnlY4XvPXtUxZgl/a+zYYq2hjFHw5rZcDN6oJKxhrRYxlYwrUkpVqsNP8c74RziI
	zgNkeiITyAx0apxBX98duFGUbPRct4xDmG7lY+mJbFId0C76JfT8Hngu0ToPww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 17:02:46 +0100
Message-Id: <D5L6EJ8AANVX.Z0FW7717EP36@bootlin.com>
Subject: Re: [yocto-docs PATCH v4 2/2] dev-manual: document how to provide
 confs from layer.conf
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241113-layer-confs-v4-0-a4758fa4d1a8@bootlin.com>
 <20241113-layer-confs-v4-2-a4758fa4d1a8@bootlin.com>
 <728c57bd-2f3a-43d3-a6c6-78a99a0baf0b@cherry.de>
In-Reply-To: <728c57bd-2f3a-43d3-a6c6-78a99a0baf0b@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 16:02:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5742

On Wed Nov 13, 2024 at 4:55 PM CET, Quentin Schulz wrote:
[...]
>> +For example, if your layer provides a Linux kernel recipe named
>> +``linux-custom``, you may want to make :term:`PREFERRED_PROVIDER_virtua=
l/kernel
>> +<PREFERRED_PROVIDER>` point to ``linux-custom``::
>> +
>> +  PREFERRED_PROVIDER_virtual/kernel =3D "linux-custom"
>> +
>
> Final nitpick :) Two whitespaces instead of three here if my eyes don't=
=20
> lie to me (not worth a v5 though :) ).

I don't know how you do to notice these things, but many many thanks for th=
e
careful eye!

> LGTM,
>
> Thanks!
> Quentin

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


