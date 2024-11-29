Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83825D729E8
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:21:45 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.117784.1732893698842558046
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 07:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HGvFG4/Z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD08320007;
	Fri, 29 Nov 2024 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732893697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+t8ywVUplB7Mjm4EY+J2T9t+Uj3hn++Xm7K+oWI7V0=;
	b=HGvFG4/ZH/5pDX7MnWKag2iF7+0nKEVdkN3SiPK3NtCPgThMkXXqmh17LHqat4UUMQzq1o
	MzLLSCBh/nWdHWLgS9jrq1sna79I/wZyhGftPIAKPxshG+jlPBCDBmP3LVexl/4LSi/kIE
	Gl0wHjWgMEZFSWKra07dGacjKVIlwuq52K8L+bw60mYIg7QWJvOEGz4fEH4CYm7RyHlWIu
	zId4U10VRpEwlu3XBsqXDM8lLCBKkVOrEWp8KWT11pBN8d9AARwv+8e6IL4UPwmRNPlwlj
	1DvSU9tcU4QYk4z8i9X2kEhkLKEHIpj9ImOWhLClXDXQ5kuPP7qu1omCiG0/Pw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 16:21:36 +0100
Message-Id: <D5YRJQ7RZHV2.1UY0JCMYJ23GA@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 4/5] system-requirements.rst: add
 dependencies for pdf builds
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
 <fd1c29ef-20f8-49d1-8c72-92359a16b894@cherry.de>
 <D5YPY67J862H.XCE8HJIWX48N@bootlin.com>
 <77cb6f09-e059-4ee1-9139-cb55ef618520@cherry.de>
In-Reply-To: <77cb6f09-e059-4ee1-9139-cb55ef618520@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 15:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5857

Hi Quentin,

On Fri Nov 29, 2024 at 3:28 PM CET, Quentin Schulz wrote:
[...]
>>>> +  texlive-collection-latex
>>>> +  texlive-collection-latexextra
>>>> +  texlive-collection-latexrecommended
>>>
>>> latex-extra already requires latex-recommended which already requires
>>> latex so only the former is necessary.
>>=20
>> +1
>>=20
>
> Actually I think this is potentially a bad recommendation. It depends=20
> exactly what we need. But if we need stuff from latex-recommended or=20
> latex, we should explicitly list either or both, because it would=20
> prevent issues when the distro decides latexextra doesn't require=20
> latexrecommended which doesn't require latex anymore. This has happened=
=20
> to me (in a different context) when upgrading from Debian Bullseye to=20
> Bookworm.

Okay, let's keep all of them to be safe then.


Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

