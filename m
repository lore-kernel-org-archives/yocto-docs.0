Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BC8E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 09:58:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6837.1733824699344751491
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 01:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FuebGs5n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4151D20003;
	Tue, 10 Dec 2024 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9HXXC293eOiSddAMx5/wzjgvQ6GbZQO7bsyx6rT1pk=;
	b=FuebGs5nCFryovMg8hyk9acURQxOpSCsDhDO/uJ4hBqIgE1VvseARAw/FFgqOrTPn/WA3j
	l48MC0b3WOY2qkyfkrnrUe4KpDBhCy5nPoX7b5SKQqlTG2UGNphcfvSph8GM6omDJAHNtI
	DFBj6+ou/5owc/nRiG8FlICiC14Jo57D6YD72PXhn8ChUVGa3lZY7OsPzoNxoyQ3a8PDuL
	048tFJUPhXv8+lFiYGRWDSzRF7qbKIfJJAth3x3CLL0h2mVaKcXBmJZabbDnWRBxkIVopz
	vYC1lHJnHpH/P0gw4zZme7U0thTARZiLWtDQeeeawy3pVon130GMZNunSSZwag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 10:58:16 +0100
Message-Id: <D67XK5T2S8K8.372YF65W5YCAH@bootlin.com>
Subject: Re: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
 <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
In-Reply-To: <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 09:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5909

Hi Quentin,

On Fri Dec 6, 2024 at 2:51 PM CET, Quentin Schulz wrote:
[...]
>> +ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
>> +  bzip2
>> +  ccache
>
> This is aligned with Fedora but I'm still wondering if it actually is a=
=20
> requirement (well, if you INHERIT ccache, yes).
>
>> +  chrpath
>> +  cpio
>> +  cpp
>> +  diffstat
>> +  diffutils
>> +  gawk
>> +  gcc
>> +  gcc-c++
>> +  git
>> +  glibc-devel
>> +  glibc-langpack-en
>> +  gzip
>
> The original list had "install" but it's gone here, on purpose?

I don't think it did actually. I see the "yum install" and "dnf install"
commands but not the "install" package.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

