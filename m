Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DB8E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 13:10:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.80833.1734441019315257416
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 05:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bJrnDB/f;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C108240006;
	Tue, 17 Dec 2024 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734441017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Uk/97mgKSJzm9TWS15jcA+/Unq4Rnp174oXSvixkrI=;
	b=bJrnDB/fHu9KD7GH3hl+4gWZEeE+a1fkvaBfXuPwZm33Z/RWKp+6B8rVTWmdQ0+BEIXKdA
	tS05pDG5dW+TfztQhLYZ727fTYhC0S4quadUAKN4MkV81Sa/NRG4TT8EhFF6cUX/ciRS/7
	6qgHBXWYNV73WhHTvOWQF3pMG6wCNGY+5Yg7rS7djDXGul/4GfO9Q4WZFlZ8Pe31aK73Yz
	ggZ5XN7kDKyGPT5M6Ov1aHbS+P2JWRO/N/tOzuZtQGgvLczBcidcV3lmNj+deHcX02KIIa
	bJWDNW3hPkaQ2juPc0Dl/YX1TCIO6S6SxfWZhLNCSSnc08GDMcrtt2vRTHe/yA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Dec 2024 14:10:17 +0100
Message-Id: <D6E00ZEVPTN2.37CTW3RPCEHZ2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC 1/2] docs: use literalinclude for system
 requirements
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de> <20241210-instructions-shell-container-v1-1-6a7cdc404ff4@cherry.de> <D6DWNEOPVATF.2H2X15PIOPKK1@bootlin.com> <e016927a-2ff7-4368-8681-80087b151b81@cherry.de>
In-Reply-To: <e016927a-2ff7-4368-8681-80087b151b81@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 13:10:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5962

Hi Quentin,

On Tue Dec 17, 2024 at 1:58 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 11:31 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> The YAML variables for the host dependencies are updated by hand and
>>> actually only used inside code blocks.
>>>
>>> It's also slowly getting more difficult to make sense of the content of
>>> those variables as they are both the list of packages to install with
>>> the distro's package manager and sometimes additional commands, which
>>> all need to have the indentation of the block where the variable is use=
d
>>> matched. This is impossible so we just guess it's going to be at a
>>> specific indentation.
>>>
>>> Instead, let's migrate all instructions into separate shell scripts tha=
t
>>> are then literalinclude'd into the Sphinx documentation.
>>>
>>> This allows a few things:
>>> - ability to run shellcheck on the scripts if we ever want to
>>> - manually calling the appropriate script from a supported distro to
>>>    build stuff (distro or bitbake/yocto stuff)
>>> - use this script to create containers to do CI of documentation on
>>>    different distros, to make sure our instructions are all up to date,
>>>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>>   documentation/poky.yaml.in                         | 26 -------------
>>>   documentation/ref-manual/system-requirements.rst   | 45 ++++++++++++-=
---------
>>>   .../tools/almalinux_host_packages_docs.sh          |  2 +
>>=20
>> Maybe I would put the scripts in a subdirectory called "host_packages_sc=
ripts"
>> and rename the scripts "almalinux_docs.sh", "almalinux_essential.sh", et=
c. for
>> shorter names. Same for Containerfiles in the next patch, maybe storing =
them in
>> a subdirectory would make sense.
>>=20
>> If putting them at the same level is because of the build context requir=
ing
>> files to be all at the same place, let's leave it like this.
>>=20
>
> Will check for a v3 but should be doable I believe.
>
>>=20
>> Otherwise, this needs to be rebased and updated after the dependencies w=
ere
>> updated on master.
>>=20
>
> That's already done in the v2 I sent yesterday :)

Strange, I did not receive it, and I can't find it on
lore.kernel.org/yocto-docs. Is the issue on my side?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

