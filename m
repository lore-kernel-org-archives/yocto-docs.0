Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29196CFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:11:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15723.1764335490179229162
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 05:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zxTyJ+Ba;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 179D51A1E05
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:11:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB3C460706;
	Fri, 28 Nov 2025 13:11:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A78510B01E3A;
	Fri, 28 Nov 2025 14:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764335487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9TRqeTTbOWKMq4Rtq62LKmJdrT2fB97OhUiUyHFV2AE=;
	b=zxTyJ+Ba5T6V8NA6AgxOdBcbkLuOsn1ko4ClZuJqkNGLSLphdEJPWsfoNbBlPigmnfhxrW
	hHNj9M5xT+380ARCLiEmJFiIyXpB6zFMKT++FOlIAFUm/pRjJu9+rRolw7rYuAh0wRTYNi
	2rQ44X47g2NGQQ+aJMmqrguWZIafKUlaIv04DNBQYXM+d8rDZo6bDGeriA+6FWaYQ7IZW0
	RSuASEWWHfsemMyZlEjeBOTeRFShj2/ZeW2xfGiL5AZiBhJuKUhu6H5Km4JKNaa7hysfSi
	NBxexxWJhJOTjRS44VNdOJahMX5ahv+HRadkDu0h1G4RSVqF1oqWxKXVpaOevw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 14:11:25 +0100
Message-Id: <DEKCQCLV0UHY.2TD6EXECC6FA6@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/3] brief-yoctoprojectqs/index.rst: switch shell
 block to to console lexer
References: <20251127-bitbake-setup-updates-v1-0-75ac1e490a40@bootlin.com>
 <20251127-bitbake-setup-updates-v1-3-75ac1e490a40@bootlin.com>
 <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
In-Reply-To: <1d128f7c-1af4-4e11-9ce9-b72cecff0485@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 13:11:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8159

Hi,

On Thu Nov 27, 2025 at 5:47 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
>>   #. Choose a configuration (for example, ``poky-master``):
>>  =20
>> -   .. code-block:: shell
>> +   .. code-block:: console
>>  =20
>
> Neither shell nor console. I would suggest to simply use a literal block=
=20
> (::), c.f.=20
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#r=
st-literal-blocks

Thanks, I'll change that.

I just noticed but I think the default lexer for literal blocks is Python u=
nless
you explicitly set it to something else in the global configuration[1]. I t=
hink
it makes sense to change it to "text" as the rendering looks odd in most pl=
aces
where it thinks it's Python code, whereas most of the time it's either text
snippets or bitbake assignments.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


