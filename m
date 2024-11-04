Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5909DD132D3
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:26:33 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.58654.1730730387833562934
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 06:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gyp9x/7S;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD3EE60003;
	Mon,  4 Nov 2024 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730730386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZiVZVYOPbq02lLTnRCZhgcUI1fdTTajDPRm2ufWZr4=;
	b=Gyp9x/7SKFnsY8vzfkKbX1Hme2hhNZD3mCk0EU+KCQbiudoxWyZJzYfSE05Ec9qHB7lLhy
	axZmS4ryyQsbPY2xXYco8Qe+wIZW5oO7ta8trUImC6lz5iq6fcWOj7JfU486nGdsbSjeNU
	mAJSxLQ/V3YWZ1umwDNMxPEm+rXLApRewFq4gwqejuhaxqVUFnViBkn4LU6Yd3iuqkTzLQ
	lh1Sw8ecNVobxerbYZUjlHlnTOXIE/i9CIwMWwa7rZdi9IeTafy/0q3RUF/X5FRCsKHJwv
	ZhPNFprUOcbI/hPzPLzMEO6VxjV4gcHbW/o40aek0inBrCrMm3oiO4r8KgOxWg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 15:26:25 +0100
Message-Id: <D5DGPUSK2YPT.2D299NYSV5JL5@bootlin.com>
Subject: Re: [PATCH] conf.py: rename :cve: role to :cve_nist:
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Julien Stephan"
 <jstephan@baylibre.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241104-new-cve-role-v1-1-4d2c6efa364a@bootlin.com>
 <c329c77d-b5cc-4a28-a345-ac4261a70d3c@cherry.de>
 <D5DFJNMJZVEW.HSMGI2KFHB0O@bootlin.com>
 <f63a2a9b-5ef2-42d5-b423-e1924e90ad97@cherry.de>
In-Reply-To: <f63a2a9b-5ef2-42d5-b423-e1924e90ad97@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 14:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5660

On Mon Nov 4, 2024 at 3:06 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/4/24 2:31 PM, Antonin Godard wrote:
>> On Mon Nov 4, 2024 at 1:55 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 11/4/24 1:39 PM, Antonin Godard wrote:
>>>> Newer versions of Sphinx already define a :cve: role that points to
>>>> cve.org, instead of the role we defined in conf.py that points to
>>>> nvd.nist.gov.
>>>>
>>>> Rename our role to :cve_nist: to avoid warnings (treated as errors).
>>>> This is also backwards compatible, meaning we can build the doc with a=
n
>>>> older Sphinx if needed.
>>>>
>>>> Suggested-By: Quentin Schulz <quentin.schulz@cherry.de>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>
>>> Looks good to me. I assume you didn't change those by hand, maybe add
>>> the command you used to do the migration so we can figure out if
>>> something's been left out inadvertently? (Would be useful if we figure
>>> out in the future that this missed something so we can more easily find
>>> a programmatic way of fixing the left-out instead of finding and fixing
>>> them by hand?).
>>=20
>> Hmm... I used my editor, but the equivalent one-liner is:
>>=20
>> find . -name '*.rst' -exec sed -i 's/:cve:/:cve_nist:/g' {} \+
>>=20
>> Which I'll add to the commit message.
>>=20
>>> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> (Admittedly only reviewed the conf.py part :) ).
>>>
>>> For backporting, we'll likely need a new patch on the autobuilder, c.f.
>>> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/docs=
-build-patches
>>> since we want to build tags which we cannot move.
>>=20
>> If I understand correctly, these are patches to apply to old documentati=
on
>> versions? To extend my reasoning on this, since new tags were added rece=
ntly for
>> old doc versions, should I update `missing_tags` and add corresponding p=
atches
>> there? I'm a bit clueless :)
>>=20
>
> I haven't really checked what the ramifications are for those new tags.=
=20
> It's possible it fixes a bunch of stuff that we needed to work around.=20
> Maybe we don't even need that missing_tags logic anymore at all in=20
> set_versions.py. But that would only fix the generation of the=20
> releases.rst file, which is different from fixing content of old=20
> unmaintained releases for newer Sphinx versions, which is handled in the=
=20
> yocto-autobuilder. I think they aren't related here but haven't spent=20
> some time recently on that so cannot tell right now.

Thanks for the added context! I'll see how this goes=E2=80=A6

> Cheers,
> Quentin

Cheers,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


