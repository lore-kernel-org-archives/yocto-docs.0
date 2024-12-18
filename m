Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6BAE77183
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 08:19:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.100962.1734509991344015459
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 00:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=G1xc+JEl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FC49FF807;
	Wed, 18 Dec 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734509989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXugpjRWL3tWsBIkw/JvWXDPjSQCig9vr7rms2mxTMs=;
	b=G1xc+JEl6uzIUwF23tbfEEZ7uXVa9+SGya5F5Z3C91y3jStKkFBjqYdQzNXGZ27VPKnwxM
	6lKtzAz5OpX6kYqBh98elXWoB0W6qonQdD6L+m1W8MBI/lmQsLXLWbECAcbMOWTwL5drSK
	nnJjvd+Z/zzPEdP4mH0MgbeDfjnKkq8iKNI70tPUh3GHmLSkyfb9+iKuNpj5Bq8vv09vKH
	SHfZuhcL2EUqRbkFoIQgG3uGdGKUYpLmDebhBgl/fzJaHw0pj3PddtLkuYOxhV5VSVX7Wc
	R+fl5mPm4sMFztRtgA54D3rb7uNkQYZX05lSZBcLL69guCCX6MS8ITMUj6nK/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 09:19:48 +0100
Message-Id: <D6EOH4KNGJ45.1ZSRSG06NDDWS@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] set_versions.py: use
 backward-compatible python argument in run
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
 <3c0405f4-6059-411a-8854-727581e37484@cherry.de>
In-Reply-To: <3c0405f4-6059-411a-8854-727581e37484@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 08:19:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5973

Hi Quentin,

On Tue Dec 17, 2024 at 12:05 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 11:35 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Some workers on the autobuilder reported the following error:
>>=20
>>    File "./set_versions.py", line 102, in <module>
>>      subprocess.run(["git", "show", "yocto-%s" % release_series[activere=
leases[0]]], capture_output=3DTrue, check=3DTrue)
>>    File "/usr/lib64/python3.6/subprocess.py", line 423, in run
>>      with Popen(*popenargs, **kwargs) as process:
>>    TypeError: __init__() got an unexpected keyword argument 'capture_out=
put'
>>=20
>> See https://valkyrie.yoctoproject.org/#/builders/34/builds/86.
>>=20
>> This is because capture_output was introduced in Python 3.7, and some of
>> the support distributions are still on Python 3.6. Since capture_output
>> is essentially just setting stdout and stderr to PIPE
>> (https://github.com/python/cpython/blob/3.13/Lib/subprocess.py#L547), do
>> it manually here to be compatible with older python versions.
>>=20
>> This is also the case for the "text" parameter, introduced in 3.7 to
>> alias the universal_newlines parameter. Use "universal_newlines" to be
>> backward-compatible.
>>=20
>> [ YOCTO #15687 ]
>>=20
>
> Do we really want to open that can of worms?
>
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#require=
d-git-tar-python-make-and-gcc-versions=20
> clearly states the minimal supported Python version is 3.8.0 so maybe we=
=20
> should just stop building the docs on those distros that are still on=20
> old Python? I'm actually surprised building YP on AlmaLinux 8 works=20
> then, is it because of uninative?

We still support 3.6 on Kirkstone. The docs build uses a buildtools tarball=
 to
get a recent Sphinx version, rsvg-convert, etc. I wouldn't know how this is=
 done
for other builds, though.

> Looks ok to me otherwise.

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

