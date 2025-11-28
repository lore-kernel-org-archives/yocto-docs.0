Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C049CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:14:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15731.1764335686294832202
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 05:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j/Igt2QT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 78B501A1E07
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:14:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4985360706;
	Fri, 28 Nov 2025 13:14:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4104B10B01E4A;
	Fri, 28 Nov 2025 14:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764335683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDsD/rOhkib109kG+ci+6Q+TD2Hvoy/NdyaqVjQsnpk=;
	b=j/Igt2QTazO3Gig1H4tNhEqMk7AZu3T7uFY17Xj84w4BwQwPQZYOsXvhOp1/n0l/YO+ri6
	M6/lHeAgzE+ViN7XtTFEVS1vWc1OGtJlKIvKUIu6hPjT49cH7msheiOFI6QiBIsKyrEuAW
	HaGVP2ssd/INVxbJ5BcLZXCmfFxGogTsNCWflcrjSyVYfu0SJoEF/1IhPFMKQSXwrgKSKy
	8caqT3H8qjGSE2h0Puo/BDKaNHvYVzWTxrqna2f+sbnuM1mq7xieSSVWr4yiBPSbDbDQd/
	RoGuUkqAQh0/85lIL8I5VB3h5bJ1f7iuNLQwPgLlH2n4GyAtb5Jk36mon2LFbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 14:14:42 +0100
Message-Id: <DEKCSVB1HLZ2.3SBMWDGD7547G@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell
 block to to console lexer
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
 <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
 <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
 <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
In-Reply-To: <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8160

On Fri Nov 28, 2025 at 2:11 PM CET, Antonin Godard wrote:
> Hi,
>
> On Thu Nov 27, 2025 at 5:47 PM CET, Quentin Schulz via lists.yoctoproject=
.org wrote:
> [...]
>>>   #. Choose a configuration (for example, ``poky-master``):
>>>  =20
>>> -   .. code-block:: shell
>>> +   .. code-block:: console
>>>  =20
>>
>> Neither shell nor console. I would suggest to simply use a literal block=
=20
>> (::), c.f.=20
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#=
rst-literal-blocks
>
> Thanks, I'll change that.
>
> I just noticed but I think the default lexer for literal blocks is Python=
 unless
> you explicitly set it to something else in the global configuration[1]. I=
 think
> it makes sense to change it to "text" as the rendering looks odd in most =
places
> where it thinks it's Python code, whereas most of the time it's either te=
xt
> snippets or bitbake assignments.

Forgot the link :)

[1]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.htm=
l#literal-blocks

End of the paragraph:

Code highlighting can be enabled for these literal blocks on a document-wid=
e
basis using the highlight directive and on a project-wide basis using the
highlight_language configuration option. The code-block directive can be us=
ed to
set highlighting on a block-by-block basis.

Antonin

