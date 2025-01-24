Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21FFC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 11:27:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.9673.1737718047305463092
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 03:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k0shM1f+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B442AE0008;
	Fri, 24 Jan 2025 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737718045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SNFsTGkr3bWOULbKB3bBEx+alfsGXCp8kZ1ZIVYcuB8=;
	b=k0shM1f+6fXq98A8rLiIJZIkcspWz37VD6DaIrta5DPoFyct3sZE4I49tEZqi6QqT49ebL
	qPqhL2lho7mUrO2faKS6UTp4bXQZl2lI4yzNf5fD9n8BMAreGFJIlabs3F3EuEuFhv/TGY
	kPcMoOccUnjkjT6dnZeGMeL8BqXVATxZPyR3cdDJHocBvFlQJbxB7hS41C+bBsv8SvFcT0
	V7BXGOxEAa6hWsINmYtbQfxPGBgstr09wy9J0QVen/GeSsA0NDMKru75N1uPd7L0V3FgN1
	IHOZIQSw5T+TGeuPgk/9qwtsI87h0GLXnoLDVvoddjjZowZQShuZoFtcCm7v4w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 12:27:24 +0100
Message-Id: <D7A9MWYP0NSW.2LQS3GNQQDYLJ@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC v2 2/2] tools: add script for building
 documentation inside containers
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de> <20241217-instructions-shell-container-v2-2-ce687b0cfac2@cherry.de> <D6LKI7KCD6K5.3S86QV4WB1OYF@bootlin.com> <ba64fc90-e388-4753-bc4d-baa4a1417a55@cherry.de>
In-Reply-To: <ba64fc90-e388-4753-bc4d-baa4a1417a55@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 11:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6168

Hi Quentin,

On Mon Jan 13, 2025 at 5:43 PM CET, Quentin Schulz wrote:
[...]
>>> +# relative to the location of the dockerfile
>>> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
>>> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
>>> +COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
>>=20
>> A bit of a hacky workaround, but maybe here run
>> sed -i 's/zypper/zypper --non-interactive/ ...' on the scripts? So we do=
n't need
>> to provide this option in the doc.
>>=20
>
> Another dirty hack is to have a shell zypper wrapper that calls=20
> /usr/bin/zypper --non-interactive.
>
> Up to you.

Let's go for a sed in the Containerfile.

[...]
>>=20
>> Can we have a way of listing images here so a user doesn't need to read =
the
>> script and guess which one to use?
>>=20
>
> The ones in=20
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions?=20
> Though I guess Rocky and CentOS are still missing. Do we want the name=20
> of the distro or the name + the version? Basically we can end up with=20
> two places where this information will be, in the docs and in the contain=
er.

I was thinking of just listing what the script supports, not from the docs.=
 I
did that in my version of the script. Something like `./build-docs-containe=
r
list`. In your case, it would probably extract that information from the
Containerfiles.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

