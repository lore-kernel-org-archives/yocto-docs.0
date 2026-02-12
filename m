Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980DEEB48F2
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 09:49:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41954.1770889766058161002
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 01:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kRXwhGP8;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B102E4E40CB4;
	Thu, 12 Feb 2026 09:49:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87841606CA;
	Thu, 12 Feb 2026 09:49:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44D061197167F;
	Thu, 12 Feb 2026 10:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770889763; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TreHj85w4HE+XQ96MUwU+nwiZGsR+ii8gMWEVwtgedU=;
	b=kRXwhGP8lOfvL8G8Ir0UPxgDNPow/3pk3+Shqwh187Fs0L5XwcbtmA50Mr6xxs8eRpDqS8
	q2MCyg3P9ttHmWAjZruvATPIOWGzZEKwnSuqbytUfDVJCSryBFE4eWI5VDL8J3NLospFpA
	UKtmooeyuVM7exSxoP9zMKdcPMnXcKC03Nbn6MLw3El5BGirJXtHPWGAtMwB9n/+BKx2Vm
	+1x/Yi54JPEVr4hONPwyjUL8sMO97ODlJnvhNSNCebN40RbnjNTeyMe/O72GDjpugf9lMZ
	gb+10U1L1k5NUXb7wGsiaR+7/STABHZEUixc8t//WzBMh3yLY8ceTMio4gu4fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 10:49:21 +0100
Message-Id: <DGCW11KABQIL.QJTTJ8CE3QZO@bootlin.com>
Subject: Re: [docs] [PATCH v3] convert SVGs to PDF and PNG using
 sphinxcontrib.rsvgconverter plugin
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
References: <20260211-fix-make-multi-target-v3-1-1168a6f1525f@cherry.de>
 <DGCUROORFMR0.ZZUIPYYRXZXE@bootlin.com>
 <5288e4be-8e16-4447-b1fd-94d21aa91c4f@cherry.de>
In-Reply-To: <5288e4be-8e16-4447-b1fd-94d21aa91c4f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8904

On Thu Feb 12, 2026 at 10:39 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/12/26 9:50 AM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Wed Feb 11, 2026 at 4:25 PM CET, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>> [...]
>>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/d=
ocumentation/tools/host_packages_scripts/pip3_docs.sh
>>> index 907ecec55..3e4045e7e 100644
>>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>>> @@ -1 +1 @@
>>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>>> +sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton 'sp=
hinxcontrib-svg2pdfconverter>=3D2.0.0'
>>=20
>> pip3_docs.sh is not used for ubuntu and debian, meaning we need to find =
the
>
> Woopsies.
>
>> equivalent package to add to
>> documentation/tools/host_packages_scripts/ubuntu_docs.sh, or write a cus=
tom
>
> There's none as far as I could tell and even if there was one, unlikely=
=20
> to be 2.0.0 for all Debian/Ubuntu versions as they are generally pretty=
=20
> conservative with upgrades and this was a recent one.
>
>> pip3_docs.sh file for ubuntu/debian.
>>=20
>> Or drop the ubuntu_docs.sh file and use pip3_docs.sh for ubuntu/debian, =
which
>> would make this kind of mistakes unlikely to happen. What do you think?
>>=20
>
> I don't mind either way. Makes it easier to maintain if all use the same=
=20
> packages from pip is my opinion.
>
> What would you prefer?

I prefer having pip3_docs.sh shared between all. Do you mind deleting
ubuntu_docs.sh and replacing it with pip3_docs.sh in a separate patch?

Thanks!
Antonin

