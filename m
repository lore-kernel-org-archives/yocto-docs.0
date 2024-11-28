Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D22D690FC
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 11:35:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.92836.1732793745328862022
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Nov 2024 03:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gc8K3oxe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C7281C0005;
	Thu, 28 Nov 2024 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732793743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0hHIV3qFC7gShq9KznLAj36Or3z2fAdcmcQypn3uhg=;
	b=Gc8K3oxescXGBHeyyYgVbjPI1edDTOjJjx2HiWIX9UtZssbiw7/u1XhG8UTrjiOovVnwiS
	1RTm1rvPXrAeLYCid0Tgd1wy4bryzSS7vHUQY0TnddTpCzdgsviQ+lZpm5IDpT3Kv1kYmg
	PCeLcxpZduegqj6k8pr2YQPu0Ng0K0nHDKeMRT7wd8sRpG+ZhV1TGJOyTXy0lRg53MDw56
	nRal7c75zTAwCM9WUB7cDzhmRokOFn4w3/wy16HtdALUvtoj3PI0NRPE4jzLyjJ5PC1lNZ
	DCF4z5YhFbfV7LPqJeg3EX7lgXAwDoNmosilz83/OGWlc53n/jok2cIENm+E8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Nov 2024 12:35:43 +0100
Message-Id: <D5XS485VZ3HG.316L4FZXW319X@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [yocto-docs][PATCH v4] ref-manual: classes: fix bin_package
 description
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
In-Reply-To: <760a8cf6-a54c-4046-81c4-de3616451d88@cherry.de>
References: <20241127-fix-bin-package-v4-1-e7f7c2325dea@bootlin.com>
 <760a8cf6-a54c-4046-81c4-de3616451d88@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Nov 2024 11:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5842

Hi Quentin,

On Thu Nov 28, 2024 at 11:07 AM CET, Quentin Schulz wrote:
[...]
>> +This class assumes that the content of the package as installed in :ter=
m:`S`
>> +mirrors the expected layout once installed on the target, which is gene=
rally the
>> +case for binary packages. For example, an RPM package for a library wou=
ld
>> +usually contain the ``usr/lib`` directories, and should be extracted to
>
> s/directories/directory/ ?

+1!

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

