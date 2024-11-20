Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D6CD711C8
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 16:43:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.18440.1732120987176415810
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 08:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BBQVfD72;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 521B760006;
	Wed, 20 Nov 2024 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732120984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=falXTHh5RNuSVGYwFIjoxEAPsWoDSmdCPdWRU69oRyE=;
	b=BBQVfD72uyEypVBTiEV1BvZH+iV8LCzoz67b9A8bFlJCDKDdw8/Erce3nwjl0FaHydJ+eF
	uiPmwYWzqV3GWeEs0nAJIDgEg8w9ASECSU/vDqmUTn42snCaCLdvehj7kOiku6CGStqQOh
	VehcL93t/WSHtsrWEp3RSjhfUB2OsBE2dmhF+AGJg0LRFk+JhaCc+YtLbshJTe7s41w+iF
	5elwWwc2eWCsCEcpLgi5RB0J6JezSHAzeebK+D2Z1djxZCbZ0d4XBBi26G7n9nDiuLbTFk
	/RI+9Et0rvcbzQtP4l8fYNuCNKdX9z6NLTcPBVtC6CKgO7xyAL/fz0csJwJFag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Nov 2024 17:43:03 +0100
Message-Id: <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, =?utf-8?q?Gu=C3=A9na=C3=ABl_Muller?=
 <guenael.muller@smile.fr>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
 <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
In-Reply-To: <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 16:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5780

Hi Gu=C3=A9na=C3=ABl, Quentin,

On Tue Nov 19, 2024 at 10:28 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
>>> +You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
>>> +
>
> I believe "the ``en_US.UTF-8`` locale" is more proper here.
>
> On a side note, what's the actual cost of reconfiguring the locales=20
> regardless of the presence of en_US.UTF-8?
>
> My point being we could probably have this command in poky.yaml.in like=
=20
> it used to be?
>
>>> +   $ locale --all-locales | grep en_US.utf8
>>> +
>>> +If this is not the case, you can reconfigure the ``locales`` package t=
o add it::
>>> +
>>> +   $ sudo dpkg-reconfigure locales
>>> +
>
> How does this actually generate en_US.utf8 locale if we don't explicitly=
=20
> add it somewhere? Are you sure it's not because your system has LANG or=
=20
> LC_ALL set to that locale and then calling reconfigure it regenerate it?
>
> Also on a side note we tell people to check if "en_US.UTF-8" locale is=20
> enabled by grepping for "en_US.utf8", is that expected? Why aren't they=
=20
> the same?

Yes, "locale --all-locales" does return "en_US.utf8" while we install the
"en_US.UTF-8" locale (different string, not sure why).

I seem to be able to build with both Debian/Ubuntu with this command:

  LANG=3D"en_US.UTF-8" locale-gen

Maybe this is a more straightforward approach, closer to what we had before=
.
What do you think? Gu=C3=A9na=C3=ABl would you be able to update your patch=
 with this
command if this works for you too?


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

