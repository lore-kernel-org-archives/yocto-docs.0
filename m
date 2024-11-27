Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D731FD609AF
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 08:29:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.67386.1732696153491118453
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 00:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fqFcVQ+R;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE30660004;
	Wed, 27 Nov 2024 08:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732696151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGfxDWiV0gHXijxaulz8JSwwNa6/zgpImKliQvot30Y=;
	b=fqFcVQ+R+23A93xvH62gpwg7aJFlxOvYqUfdPokCDDIjAknRgSkXyNU83DXEWy5M7ddog6
	gPVSs14LSZ+u2/gdiMdri+fgU9MnHU2g/bBE0aAZ0YriH7iwDC/ayf7fckYBG0tc3eWEwh
	8gJqmf/BzNGY4RO0PyUXQMmjrwaEbOTL5g2/BaiZ0tDgsYpesCMuzx4IKgFx8+NWQfxMSN
	Z0p8eGYUWsl7XnCrnwP3yDXB1Eb/RccR2o+u0kTcFeiG5h3KqgJ6mTBl1CxhTvBBJ6OaB+
	5ETCz4td3tGycAbNnKOi1XMcEqGboF5ID5f9nMCO94nHzgrd6kWTsqrC1bOosw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Nov 2024 09:29:10 +0100
Message-Id: <D5WTIUOY6R8E.1W5N7SXOW7PMC@bootlin.com>
Subject: Re: [yocto-docs PATCH v2] ref-manual: classes: fix bin_package
 description
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com>
 <7e1b27c1-0833-4f66-835b-02e39a837fa0@cherry.de>
In-Reply-To: <7e1b27c1-0833-4f66-835b-02e39a837fa0@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 08:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5820

Hi Quentin,

On Mon Nov 25, 2024 at 5:28 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/20/24 8:57 AM, Antonin Godard wrote:
>> The previous bin_package description was confusing: it would instruct to
>> use the git fetcher to extract the content of an RPM package using the
>> `subpath` option - but that's not possible as the git fetcher can be
>> used to clone a repository but not to do the extraction.
>>=20
>> Simplify the example with the HTTP fetcher that points to an RPM file,
>> and instruct the user to use `subdir` to extract its content to the
>> directory expected by S.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> [...]
>> +The :ref:`ref-classes-bin-package` class is a helper class for recipes =
that
>> +extracts the contents of a binary package (e.g. an RPM package) and ins=
talls
>> +those contents rather than building the binary from source. The binary =
package
>> +is extracted and new packages in the configured output package format a=
re
>
> I think this is actually all misleading, this is not what bin_package=20
> class does.
>
> What it does is disable the configure and compile tasks, take the=20
> entirety of ${S} (aside from patches/ and .pc/ directories) and install=
=20
> it in ${D}.

True.

> However, it is mostly useful when providing RPMs/tarballs/debs, etc...=20
> but the extraction is actually done by the fetcher I believe?

Yes.

> While looking in the fetcher, I discovered that there's a parameter we=20
> haven't documented yet for RPMs which is "extract", c.f.=20
> https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/__init__.py#n1568=
=20
> I believe this is a way to extract only one (or more?) files from an RPM=
=20
> and then extract it again? c.f. commit=20
> 906285ff00d6ffd3fd7713af52250e7c6503edb7 in poky. Unrelated though :)

Interesting (and old) find :) I couldn't find examples of this in poky, and
there's no test associated to it. I think we should probably add both doc a=
nd
test, probably.

> So we should document this and states for what kind of recipes this is
> usually inherited but I think the current content is inadequate?

Right I agree, I'll explain the S to D copying, which is what bin_package d=
oes.
And mention that the extraction is done by the fetcher in most cases.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

