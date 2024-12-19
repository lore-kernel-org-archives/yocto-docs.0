Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11831E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 08:20:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.125578.1734596396640320437
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 00:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RBXLK7Tv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77565C000A;
	Thu, 19 Dec 2024 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734596394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvm/aXZj3jkc5xifqFWzMdTxgslV6v7hS57pTXjOMrE=;
	b=RBXLK7TvDydR50kwBb53c9mOqpydSy0LPzwYjCTbIVHWhywKb6eFqOgz4DSGmAYoyq620s
	4t2QrvPuTahtzvRD5FvWaOFGe5P0sDIk9DUzAX1zbYI1iy4RAi7yLTcYt3iP5xCzDfVnlj
	aV91Km91khVeswAA8yWLCNwhgmr8i3/xSw8zrtVe69BV6xv0RSPBGwVj7NLEXAo8+0W77L
	IeDSa+1LQGFNgWZhUu1SvZ96itoLf8m7RXhuWj5n5MQAK2Y9MR+61FM0E5uARGQHCog+lY
	10hxjrWKjwS0nXLJJQQaFs0tS6wu7JjtqwP7j/Yy7JPKl27NCjV100rAue5E5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Dec 2024 09:19:53 +0100
Message-Id: <D6FJ3QKY56CY.2M1SWSRBEEP8A@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs PATCH] set_versions.py: use
 backward-compatible python argument in run
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
 <3c0405f4-6059-411a-8854-727581e37484@cherry.de>
 <D6EOH4KNGJ45.1ZSRSG06NDDWS@bootlin.com>
 <c1320e21-8f72-4140-ba73-46c907b95cee@cherry.de>
In-Reply-To: <c1320e21-8f72-4140-ba73-46c907b95cee@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Dec 2024 08:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5984

Hi Quentin,

On Wed Dec 18, 2024 at 2:39 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/18/24 9:19 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Tue Dec 17, 2024 at 12:05 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 12/17/24 11:35 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Some workers on the autobuilder reported the following error:
>>>>
>>>>     File "./set_versions.py", line 102, in <module>
>>>>       subprocess.run(["git", "show", "yocto-%s" % release_series[activ=
ereleases[0]]], capture_output=3DTrue, check=3DTrue)
>>>>     File "/usr/lib64/python3.6/subprocess.py", line 423, in run
>>>>       with Popen(*popenargs, **kwargs) as process:
>>>>     TypeError: __init__() got an unexpected keyword argument 'capture_=
output'
>>>>
>>>> See https://valkyrie.yoctoproject.org/#/builders/34/builds/86.
>>>>
>>>> This is because capture_output was introduced in Python 3.7, and some =
of
>>>> the support distributions are still on Python 3.6. Since capture_outpu=
t
>>>> is essentially just setting stdout and stderr to PIPE
>>>> (https://github.com/python/cpython/blob/3.13/Lib/subprocess.py#L547), =
do
>>>> it manually here to be compatible with older python versions.
>>>>
>>>> This is also the case for the "text" parameter, introduced in 3.7 to
>>>> alias the universal_newlines parameter. Use "universal_newlines" to be
>>>> backward-compatible.
>>>>
>>>> [ YOCTO #15687 ]
>>>>
>>>
>>> Do we really want to open that can of worms?
>>>
>>> https://docs.yoctoproject.org/ref-manual/system-requirements.html#requi=
red-git-tar-python-make-and-gcc-versions
>>> clearly states the minimal supported Python version is 3.8.0 so maybe w=
e
>>> should just stop building the docs on those distros that are still on
>>> old Python? I'm actually surprised building YP on AlmaLinux 8 works
>>> then, is it because of uninative?
>>=20
>> We still support 3.6 on Kirkstone. The docs build uses a buildtools tarb=
all to
>
> I see, so the patch should be merged at least for the branches which do=
=20
> still support 3.6. For the others, not necessarily. The script isn't=20
> that big and is not that complex (in terms of Python code, the logic....=
=20
> is another story :) ) so maybe it's fine. Your decision as maintainer.=20
> The diff looks sound to me (and I used it for building on openSUSE=20
> within containers), so I guess:

Unfortunately I think it's not that simple - the autobuilder
checks out the set_versions.py script from master for every branch it build=
s
(see the run-docs-build script on the yocto-autobuilder-helper repo).

I think merging this for every branch is fine though.

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # openSUSE Leap=20
> 15.4-15.6

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

