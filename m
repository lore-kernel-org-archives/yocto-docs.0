Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E4AD3B7EC
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:07:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14390.1732522065493828672
 for <docs@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 00:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SFEzIhei;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3521BF20A;
	Mon, 25 Nov 2024 08:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732522063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1wt/0fCFRxJm7dfWQvgDMNYDMWXl2Cq2JxdPYq5lIw=;
	b=SFEzIheiht5+gzmXz8ZB6qaibk8Y6S7sfEuCjoqVlca2dR2XZY9MrflmvxZ4elE2iTMf3C
	879siSUtkjBryPOE9dbhuOSuGTlMTTHsGA9c5RbZDM152wZohHMNLvmA9OQR8kTERj22WK
	hFMac0zPMdBLNXB7A1u6hdy4Y9q+2az1vek/mX7xfpiNgwfu1NWM2asSmEyevBsIeA9Mcc
	brVovvCYfKcXJInz9Y1kgsk1Mm1g5Z3G6a8q7x7RXAKXViSXKc03vuapkEf1Sduz8STqTP
	oU13houUS54T0WiNzVWNUfMacKBV1na6Q01tSNjeLIYnoylUMSXJnqa/PreSUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Nov 2024 09:07:43 +0100
Message-Id: <D5V3TC4RJVOS.3RIVS5NR5FQAW@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Gu=C3=A9na=C3=ABl_MULLER?= <guenael.muller@smile.fr>
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
Cc: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>, "Yoann
 Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
 <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
 <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
 <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
In-Reply-To: <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Nov 2024 08:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5796

Hi Gu=C3=A9na=C3=ABl,

On Fri Nov 22, 2024 at 10:25 AM CET, Gu=C3=A9na=C3=ABl MULLER wrote:
[...]
>> Yes, "locale --all-locales" does return "en_US.utf8" while we install th=
e
>> "en_US.UTF-8" locale (different string, not sure why).
>>
>> I seem to be able to build with both Debian/Ubuntu with this command:
>>
>>   LANG=3D"en_US.UTF-8" locale-gen
>>
>> Maybe this is a more straightforward approach, closer to what we had
>> before.
>> What do you think? Gu=C3=A9na=C3=ABl would you be able to update your pa=
tch with this
>> command if this works for you too?
>>
>>
> How do you achieve this ? I tried this with podman container (should be t=
he
> same with docker) and it clearly doesn't work at all:
>
> podman run -it --rm debian:12 /bin/bash
> apt update && apt install locales -y
> LANG=3D"en_US.UTF-8" locale-gen
>
> This generates zero locale whereas "dpkg-reconfigure locales" work as
> expected.

I may have gotten the impression that this worked, but perhaps not then. Th=
e
locales were probably already generated or something... Let's keep it your =
way
then, and if we come up with another solution we'll update this command.

Thanks for taking the time to look into it!


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

