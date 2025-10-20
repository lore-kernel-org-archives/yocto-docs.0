Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2104CCD1A7
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 08:53:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.13500.1760950383793078665
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0axJZQa/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D79DFC0AFEE
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A88B606D5;
	Mon, 20 Oct 2025 08:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8591102F2397;
	Mon, 20 Oct 2025 10:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vLpa07lDe4dhtNT1aNW1ZZ58Sbc0EIJX2T3EP0rGphw=;
	b=0axJZQa/Fp0fZKk17JWixJxFM0L6iuB/KCwphUdX+AzLJkygqogM2FGOlZJT8wh5Vd5mJe
	gyh0mbvQcmp2Pb5V1Jr+P9RUm41eunb0fpJGwjzHoMATfSmzn5/Jj5J4xdwAgozvSQMIHB
	OQimqTvOZBezC6NMa3i2zaMYSSvvaNelYvqr9QZxy1P2mfow0q2Xrn4vBC/8LxpP9l2Xps
	160kVt0qt6HvSg50VxJRr8UVQBSDqtxQI2KCDIbLbAcm05kxIYUrrz9S8Sjshv9ILBouor
	sPBmd/tepGe7fU/P3SDc/6TWqUpkd0exGbDeN02CX2GMnGGb6ekOTG3nK0woZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 10:52:57 +0200
Message-Id: <DDN0T7EH9MEV.2XP2FQPZ3BHK7@bootlin.com>
Subject: Re: [docs] [PATCH 09/17] ref-manual/variables.rst: document the
 REQUIRED_IMAGE_FEATURES variable
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com> <20251016-release-note-5-3-second-hunk-v1-9-20f21db1f93c@bootlin.com> <f47a2194-df43-40bd-b5e4-63f1281da138@cherry.de>
In-Reply-To: <f47a2194-df43-40bd-b5e4-63f1281da138@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7755

On Thu Oct 16, 2025 at 12:20 PM CEST, Quentin Schulz via lists.yoctoproject=
.org wrote:
> Hi Antonin,
>
> On 10/16/25 10:53 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Added by commit 96a9702a24a7 ("distro_features_check: expand with
>> IMAGE_FEATURES") in OE-Core.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/variables.rst | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-=
manual/variables.rst
>> index 6c94b0d10..bb24f2583 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -7946,6 +7946,15 @@ system and gives an overview of their function an=
d contents.
>>         the recipe will be skipped, and if the build system attempts to =
build
>>         the recipe then an error will be triggered.
>>  =20
>> +   :term:`REQUIRED_IMAGE_FEATURES`
>> +      When inheriting the :ref:`ref-classes-features_check` class, this=
 variable
>> +      identifies image features that must exist in the current
>> +      configuration in order for the :term:`OpenEmbedded Build System` =
to build
>> +      the recipe. In other words, if the :term:`REQUIRED_IMAGE_FEATURES=
` variable
>> +      lists a feature that does not appear in :term:`IMAGE_FEATURES` wi=
thin the
>> +      current configuration, then the recipe will be skipped, and if th=
e build
>> +      system attempts to build the recipe then an error will be trigger=
ed.
>> +
>
> Compared to the other REQUIRED_.*_FEATURES, I think this one=20
> specifically targets image recipes no (as IMAGE_FEATURES is to be set at=
=20
> the image recipe or distro conf level?)?
>
> What do you think about adding a few words on that maybe?
>
> E.g. I won't be able to skip a package recipe if it has=20
> REQUIRED_IMAGE_FEATURES set to X and the image recipe that will pull=20
> this package recipe as part of its dependency tree sets IMAGE_FEATURES=20
> to not contain X? It however can work if IMAGE_FEATURES is set from a=20
> conf context (e.g. via a distro to have consistency between image=20
> recipes with the same distro, useful e.g. for using security features by=
=20
> default) but you likely shouldn't be using this variable in a package=20
> recipe no?

Good point, I will mention it here. What do you think of:

"""
Compared to other ``REQUIRED_*_FEATURES`` variables, the
:term:`REQUIRED_IMAGE_FEATURES` variable only targets image recipes, as the
:term:`IMAGE_FEATURES` variable is handled by the :ref:`ref-classes-core-im=
age`
class. However, the :term:`REQUIRED_IMAGE_FEATURES` variable can also be
set from a :term:`Configuration File` -- such as a :term:`DISTRO`
configuration file, if the list of required image features should apply to
all images using this :term:`DISTRO`.
"""

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


