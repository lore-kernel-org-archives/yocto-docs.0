Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E1AD13C31
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:23:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22060.1769440979156974982
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 07:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GBF0DMlH;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 36D044E42295
	for <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:22:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D2DC60717;
	Mon, 26 Jan 2026 15:22:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF040119A80E2;
	Mon, 26 Jan 2026 16:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769440976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y/KG1ka7heDt01YCfR91mplAkdi/SSC0X1PfEDdOdlA=;
	b=GBF0DMlHQ8J+heqW87iFoVIhfzFXP8pbHfgov6ruLKOQxjjG8VMxLDJgqhEvaoI58lg9rH
	WHDTU4+3w3J+ePnqwfyVLyI9osDnaVu91Ina/GEjWCgHEX3iuGWlS/tPHs+Rbojt+oWu88
	c9JiA5XsGxACA+o1JWYRbby0BpgTnao9bi7NiVLpl6aINeMzkc8s2HhTvJkgk33d8wkofE
	zwKhKk3CizmP4HWRBzcAitBoRpxZvrziIhnWIq+La9qd2tkPkVuovQBR1WSs1OihKJ6pkF
	muI2sQs0RBJHv1I/iDJFS3bmgB6/hcOprzdxyCE4NimGhvKjoMVvAVdIzoMz7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 16:22:55 +0100
Message-Id: <DFYMH68TBJ0Y.2UHYWFH983C4G@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 22/53]
 overview-manual/development-environment.rst: remove obsolete poky repo
 references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-22-658a5f4dbde2@bootlin.com>
 <064b4d3d-0695-4ffe-8ae0-cd53ab2d281d@cherry.de>
 <DFYLXI28FQVB.2K36J5CKAU4ML@bootlin.com>
 <ed829b23-cc35-4191-8286-c07520bf0f4f@cherry.de>
In-Reply-To: <ed829b23-cc35-4191-8286-c07520bf0f4f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:23:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8651

Hi,

On Mon Jan 26, 2026 at 4:18 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 1/26/26 3:57 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Tue Jan 13, 2026 at 2:49 PM CET, Quentin Schulz wrote:
>> [...]
>>>> +      :term:`BitBake` repositories. For example, if you have checked =
out the "&DISTRO_NAME_NO_CAP;"
>>>
>>> Do not use this branch as it will never exist as it points to the name
>>> of the not-yet-released version. You want to use
>>> DISTRO_NAME_NO_CAP_MINUS_ONE likely (or DISTRO_NAME_NO_CAP_LTS).
>>=20
>> No? This is true for the dev version of the docs, but once the docs are
>> released, this equals to the current version of the docs you are reading=
.
>>=20
>> [...]
>>>>    It is important to understand that Git tracks content change and no=
t
>>>>    files. Git uses "branches" to organize different development effort=
s.
>>>> -For example, the ``poky`` repository has several branches that includ=
e
>>>> +For example, the :yocto_git:`yocto-docs </yocto-docs>` repository has=
 several branches that include
>>>>    the current "&DISTRO_NAME_NO_CAP;" branch, the "master" branch, and=
 many
>>>
>>> DISTRO_NAME_NO_CAP is wrong here, it's the not-yet-released version. We
>>> shouldn't be using that (or set_versions.py doesn't work right now). Or
>>> is it just wrong for the "master" branch of the docs maybe? Still,
>>> people will likely reach the official docs through the master branch?
>>> Should we show a warning on the docs for the master branch stating this
>>> applies only to unreleased software?
>>=20
>> No, docs.yoctoproject.org shows the latest released version of the docs,=
 which
>> is the tip of the whinlatter branch right now. The master version of the=
 docs is
>> docs.yoctoproject.org/dev, and the master-next version of the docs is
>> docs.yoctoproject.org/next.
>>=20
>
> Ack. FYI, the version is invalid though, c.f.=20
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions=20
> search for 5.3.999. So we should be wary of using that.

Correct, I'm also not a fan of that and find it confusing (a lot of people =
do)=E2=80=A6
At the same time I wonder what else we could do/show when we're pointing to=
 a
branch tip.

"5.3.999" -> "5.3 (latest)"?

> All good, got confused, sorry for the noise.

No worries!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


