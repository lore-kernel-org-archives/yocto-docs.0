Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26BAD2C55B
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 14:02:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.18983.1729605770760751696
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 07:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lw4psoJ0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 969E024000E;
	Tue, 22 Oct 2024 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729605768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9zVworxeH5a50/krtphkb8g41enAU7CTNTh4UOHg6M=;
	b=lw4psoJ0iRbpkXqDk29j2Aejj0D5C6Tn/43WNt4V7vvAGraeXfYOSMzPM4cpb2VQuUigaw
	0okddwPiD8r6molYhwE2EB/ezDWEsucNGa45rKACm3p9Ks514UFDXSePfj8rq1oh44xDWW
	RIpzuWZVwzopB2O3vdm+6emSqhU5UFt+Z+uvfsMQR6kvfxOIeoKYC7+7VUZGJLBGZ/0xG7
	kZWGPcQ2/GbZvTCIae8V8dDlB1BU4KWHr/TCEaM/PJBSQ8spSyD7BmeDWQNS0anX6jw7s8
	cFmZI36wY/awPfgfp5B+nETUTfSzI8hrMieidqgAyuSlwYGvTeYlk9yjSAbGDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 16:02:48 +0200
Message-Id: <D52E2OT8FW95.1HWYMAWG3NWBQ@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v2] overview-manual: concepts: add details on package
 splitting
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <20241022-bug-13225-package-split-v2-1-5715058872f0@bootlin.com>
 <b924ebb2-61f2-4d6a-8d57-b3807672ab61@cherry.de>
In-Reply-To: <b924ebb2-61f2-4d6a-8d57-b3807672ab61@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 14:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5565

On Tue Oct 22, 2024 at 3:47 PM CEST, Quentin Schulz wrote:
>> -The :term:`FILES` variable defines the
>> -files that go into each package in
>> -:term:`PACKAGES`. If you want
>> -details on how this is accomplished, you can look at
>> -:yocto_git:`package.bbclass </poky/tree/meta/classes-global/package.bbc=
lass>`.
>> +Packages for a recipe are listed in the :term:`PACKAGES` variable. The
>> +:oe_git:`bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`
>> +configuration file defines the following default list of packages::
>> +
>> +  PACKAGES =3D "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc=
 ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>> +
>> +Each of these packages contain a default list of files defined with the
>
> s/contain/contains/ since it's "each" so singular.

Thanks... I know it's the correct way to write it but my brain can't stop f=
rom
finding it weird that way :)

>> +:term:`FILES` variable. For example, the package ``${PN}-dev`` represen=
ts files
>> +useful to the development of applications depending on ``${PN}``. The d=
efault
>> +list of files for ``${PN}-dev``, also defined in :oe_git:`bitbake.conf
>> +</openembedded-core/tree/meta/conf/bitbake.conf>`, is defined as follow=
s::
>> +
>> +  FILES:${PN}-dev =3D "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la =
\
>> +                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfi=
g \
>> +                  ${datadir}/aclocal ${base_libdir}/*.o \
>> +                  ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
>> +                  ${libdir}/cmake ${datadir}/cmake"
>> +
>> +The paths in this list must be *absolute* paths from the point of view =
of the
>> +root filesystem on the target, and must *not* make references to the va=
riable
>
> I would use the singular here for reference as a path can only make a
> reference to another path and not multiple ones.

+1

>> +:term:`D` or any :term:`WORKDIR` related variable. A correct example wo=
uld be::
>> +
>> +  ${sysconfdir}/foo.conf
>> +
>> +.. note::
>> +
>> +   The list of files for a package is defined using the override syntax=
 by
>> +   separating :term:`FILES` and the package name by a semi-colon (``:``=
).
>> +
>> +.. note::
>> +
>> +  To find out which package installs a file, the ``oe-pkgdata-util``
>> +  command-line utility can be used::
>> +
>> +    $ oe-pkgdata-util find-path '/etc/fstab'
>> +    base-files: /etc/fstab
>> +> +  For more information on the ``oe-pkgdata-util`` utility, see the
> section
>> +  :ref:`dev-manual/debugging:Viewing Package Information with
>> +  \`\`oe-pkgdata-util\`\`` of the Yocto Project Development Tasks Manua=
l.
>> +
>
> I would move the second note to after the paragraph in which the "a file
> is only in one package" statement below, but that's personal taste at
> that point :)

Right, I agree.

> Looks good to me.
>
> With the contain/contains typo fixed:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Cheers,
> Quentin

Thanks Quentin.

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

