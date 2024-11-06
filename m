Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081A4D44D62
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:39:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.45911.1730900362409293797
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 05:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i4eU6bZO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A5FCFF80B;
	Wed,  6 Nov 2024 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730900360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fF5w/F/GdXiWFx/JSSxQsYj2RkZgbMOFCIks5RdkPcg=;
	b=i4eU6bZOmItV2KxLohstP3dmEnKV2bx0nhPFBdl4flQIoRhKRU7m1o7CyETW/kus/xf+fa
	jkVI60wnj4Znr58KUM0fakD9eAPL2GYQnB5iBuWTaXzSGZVPNj52R3Tp6z+K3RBrWxNRhi
	ruHinTU8bfxwSBeTK85dpQYwHBMx95D+YxRdE5UZUurYGn9i/+bWEkaxSD81kpZp7VaeYG
	iU5zfAo2+SuNWkr/wq1ySSW1vAdVJudrmSyovWUvF/Jt4Qk870jUYFgm1lI6UcbhfWW64D
	+mIEPO16QNXe8+vdGw73r34Imc+Tu5H9AqQv/OjUlq1F+aFw6eFid0IXQLTGTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 14:39:19 +0100
Message-Id: <D5F4YVXTS4OS.U94L52CX9NOF@bootlin.com>
Subject: Re: [docs] [PATCH v4 2/3] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Julien Stephan" <jstephan@baylibre.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com> <20241106-add-bblock-documentation-v4-2-9f24dfe69243@baylibre.com> <D5F0XZ9II0MN.2U9C8IQFOD6MU@bootlin.com> <CAEHHSvadv3uyRciqnG2LwxVhRCU=CogZ1EYQof1WbWLJTXZR0g@mail.gmail.com>
In-Reply-To: <CAEHHSvadv3uyRciqnG2LwxVhRCU=CogZ1EYQof1WbWLJTXZR0g@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 13:39:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5697

On Wed Nov 6, 2024 at 2:34 PM CET, Julien Stephan wrote:
> Le mer. 6 nov. 2024 =C3=A0 11:30, Antonin Godard
> <antonin.godard@bootlin.com> a =C3=A9crit :
>>
>> Hi Julien,
>>
>> On Wed Nov 6, 2024 at 10:02 AM CET, Julien Stephan wrote:
>> [...]
>> > +     Then you can look at files in ``build/stamps/<arch>/bc`` and sea=
rch for the
>>
>> Didn't notice before, but it should be ``tmp/stamps/<arch>/bc``, right?
>
> right, I forgot the ``tmp``. Should I use
> ``build/tmp/stamps/<arch>/bc``  or ``tmp/stamps/<arch>/bc`` ?
> I want confirmation to avoid another round ;)

Seems like a lot of places in the docs refer to build/tmp/work/..., so yes,
please include `build/` at the beginning.

Thank you,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

