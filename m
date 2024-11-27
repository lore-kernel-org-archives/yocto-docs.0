Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E81D609B2
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 08:34:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.67445.1732696482102014383
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 00:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZNlhiNT0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4665E000A;
	Wed, 27 Nov 2024 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732696480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=deAVCjiMAJskRKKe2QlcShdrOXrwm3paLKnD2vXgEIE=;
	b=ZNlhiNT0LPdv0RWdoyEJu6OooJ0Hjg1+uwaZXRYzhX+lDoYY+j0Kd0t1d25JBZwSOg+gAx
	N1Dk7tXYh5Obb9lDYEvb5yqxQqbfvHqFtgRnhb2D6j8ok/bQorXL2V15mwvTlIO+rH/7z1
	3r7QXVxzmzBSbZId593lX79NRW+vf014A/dhKbGbKtTHJq3bh5Ta+STJqvlwHt9pVNqUKy
	x0wuiQTf7TIR+baytREzesSxtNGEZe+s3DDKh60cYb3tYnQZwkY8Un13fjUAg2Pmh9xMok
	PUSG8SZOvB3qCe6Q/I9si8DF7GzE4OF07nsrkaJFWnQjeCq0z8aG1xIQJVWM9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 09:34:39 +0100
Message-Id: <D5WTN1Y5MZCZ.RY7J5FM4O3FO@bootlin.com>
Subject: Re: [docs] [PATCH v2] ref-manual: use standardized method accross
 both ubuntu and debian for locale install
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?Gu=C3=A9na=C3=ABl_MULLER?= <guenael.muller@smile.fr>, "Quentin
 Schulz" <quentin.schulz@cherry.de>
In-Reply-To: <CAEbF956MhH+YVmng85XageBFwb9yA8w4KOo_2K7Kcawy1j5Qnw@mail.gmail.com>
References: <20241118104524.25392-1-guenael.muller@smile.fr>
 <D5P93P1O12UG.NQJAUDP1T6Z8@bootlin.com>
 <299a188d-c7a9-4604-a491-9efb3888e7ba@cherry.de>
 <D5R5N6X7BUEX.2BBRC9BZR37GE@bootlin.com>
 <CAEbF956c=1Bk_GnSc7hxg6btAjXUVxHDbyL=pZykaRQsANV1kA@mail.gmail.com>
 <853f05e1-68a7-410c-97dc-1380e64c7721@cherry.de>
 <CAEbF956MhH+YVmng85XageBFwb9yA8w4KOo_2K7Kcawy1j5Qnw@mail.gmail.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 08:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5822

Hi Gu=C3=A9na=C3=ABl,

On Mon Nov 25, 2024 at 3:39 PM CET, Gu=C3=A9na=C3=ABl MULLER wrote:
[...]
>> I assume this works correctly if one uses an interactive container. E.g.
>> I'm expecting this won't work with these instructions in a
>> Containerfile/Dockerfile for example.
>>
>> podman run --userns=3Dkeep-id --user root debian:bookworm sh -c 'apt-get
>> update && apt-get install -y locales; locale --all-locales | grep
>> en_US.utf8; dpkg-reconfigure locales; locale --all-locales | grep
>> en_US.utf8;'
>>
>> it'll fail when running dpkg-reconfigure. If you add --frontend
>> noninteractive, then it just does nothing.
>>
>> I'm not sure if we really need noninteractive instructions, but I would
>> at least mention that we know it doesn't work for noninteractive
>> terminals in a note below the instructions? I understand we may not want
>> to instruct users to modify their locales with a simple sed command
>> which is apparently the appropriate way?
>>
>
> I see 2 solutions to solve this issue there:
>
>    - just add "(interactive mode only)"  to the line before the command
>    line.
>    - add a complete note that explain all the stuff, something like:

I'd go with this approach (explain it all).

>
>  - If your are not using the interactive mode, ``dpkg-reconfigure`` will
> not work as expected. To add the locale
> you will need to edit ``/etc/locale.gen`` file. A naive way to do this as
> root is::
>
> $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
> $ locale-gen

Yes, I would add this after the dpkg-reconfigure method (although maybe I
wouldn't echo into /etc/locale.gen, but rather instruct that "en_US.UTF-8" =
must
be present and uncommented in this file).

Also, before that, I would simply mention that the dpkg-reconfigure method =
is
interactive (followed by the /etc/locale.gen method above).


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

