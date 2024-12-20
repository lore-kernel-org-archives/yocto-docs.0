Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2E1E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:17:10 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.148658.1734686226555561451
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 01:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DMH0ST17;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0BB31BF20C;
	Fri, 20 Dec 2024 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734686224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h92OJq4STuoATW341vX6wmWquQR/d04mAFtJRL4g9HU=;
	b=DMH0ST17EKHdwHw5IaqCfYjcUL9OFN6SoNM2sOtZsZzEe3s12zt9kfEjRWq85W3e9HG9M9
	4N71JfdKOxw/GcxnUb2/GHOgdy7f3sAfyopZmKJXka0N5Gby2cRivRrVIr/orfpdOj1A3P
	uu3zb1iMVShnsFmIU3jf0Y8hIyN2Oh/sNYdh2tKKoRJvgWj1mg5O4AqBXlpOOfOI2mhlOV
	0EvxeDg0Co9BAY9EWObj50QVrbX+7OG2c27RtSsjtXcUzPb4GMlIKmgCBl70LB9COGSfKv
	BqWKaok2sYs5yQ6yPirxpX7iqdHORq2UQFVvoHFetU9flH2Pfz8obTfYecHOPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 10:17:04 +0100
Message-Id: <D6GEY2500NU7.3L242F0REPJWX@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 09/14] Drop support for
 BB_DANGLINGAPPENDS_WARNONLY
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com> <20241217-release-note-5-2-updates-v1-9-b189493b1b09@bootlin.com> <1a101f50-7b94-4aea-bb28-b00ba0571986@cherry.de>
In-Reply-To: <1a101f50-7b94-4aea-bb28-b00ba0571986@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 09:17:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5993

Hi Quentin,

On Tue Dec 17, 2024 at 3:08 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 10:27 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Support for this variable was dropped in BitBake, see commit
>> fca9c9e3cb6f8e9f99bf51dc5e8a8d83f4c84c69 ("cooker: Drop support for
>> BB_DANGLINGAPPENDS_WARNONLY").
>>=20
>> Drop this variable here as well and rewrite the "Appending Other Layers
>> Metadata With Your Layer" section to advise to rename the recipe and
>> check if the bbappend is still relevant - otherwise to use BBWARN.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/layers.rst    | 15 ++++++++++-----
>>   documentation/ref-manual/variables.rst | 18 ------------------
>>   2 files changed, 10 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-man=
ual/layers.rst
>> index 89c84669337c9ecdc90110fdf34b7949459a1b9f..365991c225159d051f6dc412=
2625616b81f01ee3 100644
>> --- a/documentation/dev-manual/layers.rst
>> +++ b/documentation/dev-manual/layers.rst
>> @@ -470,11 +470,16 @@ corresponding recipe file. For example, the append=
 file
>>   means the original recipe and append filenames are version
>>   number-specific. If the corresponding recipe is renamed to update to a
>>   newer version, you must also rename and possibly update the
>> -corresponding ``.bbappend`` as well. During the build process, BitBake
>> -displays an error on starting if it detects a ``.bbappend`` file that
>> -does not have a corresponding recipe with a matching name. See the
>> -:term:`BB_DANGLINGAPPENDS_WARNONLY`
>> -variable for information on how to handle this error.
>> +corresponding ``.bbappend`` as well.
>> +
>> +During the build process, BitBake displays an error on startup if it de=
tects a
>> +``.bbappend`` file that does not have a corresponding recipe with a mat=
ching
>> +name. To handle these errors, the better practice is to rename the ``.b=
bappend``
>
> We usually say best practice in the docs (haven't found one occurrence=20
> of better practice with a naive grep search). Did you mean best practice=
=20
> maybe?

Oops, "best" it is yes :)

>> +to match the original recipe version. This also gives you the opportuni=
ty to see
>> +if the ``.bbappend`` is still relevant for the new version of the recip=
e.
>> +
>> +Another method to deal with these errors is to use the variable :term:`=
BBMASK`,
>> +especially in cases where modifying the ``.bbappend`` is not possible.
>>  =20
>
> And another method is to make use of the % character in the filename=20
> where possible? E.g. for minor updates (I still like my gstreamer=20
> bbappend example since it continues to happen to me during rebases :) ),=
=20
> one could use someapp_3.%.bbappend.

Yes, that's right, I will also add this method. I'll mention matching the m=
inor
version only if possible, not the entire version, to avoid masking too much=
 when
updating. It's good to take a look at a bbappend every once and a while. :)

> Otherwise looks good to me, should be part of the migration manual I
> believe?

Yes absolutely, thanks!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

