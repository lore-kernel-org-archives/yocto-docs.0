Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC49CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:08:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.17409.1757509712397300289
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 06:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=t+U2BIHv;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B838FC653F9;
	Wed, 10 Sep 2025 13:08:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83314606D4;
	Wed, 10 Sep 2025 13:08:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E3FF102F28DD;
	Wed, 10 Sep 2025 15:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757509710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ub5AUosfAgV1Fl9lBAwVrs+I2LBjctudQiAqrB26Q20=;
	b=t+U2BIHvdGjCS2rjyvVWz7DV570rylrJeGEu4kNrTZQ7n/3oAiVy4qZBz0F8DDxqnu22kP
	nWsrceSFlYk65hyOp0ZI+62TC1WN4mO3LwpV6KfJlkKxEMQ/abaaIUaSjy0saKmuEFbZ/w
	jHiRb7R0Gk/UkcXSAZPZn9X+tegvFY7q30hJNIaWX0fFrMHozs6vwhpX4ynF1+SsKS8hZU
	dJzkMU5IT1V8OmV9Rlbl8PyJ2enoOG1tLMl5LsN1ufdNwSea2xNtxzAzG9ApXmXNHr3eg2
	g3CK7fs8ra3UU1cawOMVVV09JQWng5J+aNTs7fMtsjIrWl0F5+jjflfY35FbIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 15:08:19 +0200
Message-Id: <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Koen Kooi"
 <koen.kooi@oss.qualcomm.com>, "Ross Burton" <Ross.Burton@arm.com>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
 <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
In-Reply-To: <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 13:08:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7493

On Tue Sep 9, 2025 at 3:59 PM CEST, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a migration note on the pni-names default policy change after commit
>> <> in OE-Core.
>>=20
>
> General question, the systemd manpage specifies the policy as mac and=20
> not MAC, should we follow that as well?
>
>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>> Cc: Ross Burton <Ross.Burton@arm.com>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/migration-guides/migration-5.3.rst | 25 ++++++++++++++++=
++++++++
>>   1 file changed, 25 insertions(+)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.3.rst b/document=
ation/migration-guides/migration-5.3.rst
>> index 2d2f8d91a..8aa7b537f 100644
>> --- a/documentation/migration-guides/migration-5.3.rst
>> +++ b/documentation/migration-guides/migration-5.3.rst
>> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to b=
uild this FIT image, as
>>   described in the :ref:`Removed Classes <migration-guides/migration-5.3=
:Removed
>>   Classes>` section of the Migration notes for |yocto-ver| (|yocto-coden=
ame|).
>>  =20
>> +systemd Predictable Interface Names no longer MAC policy by default
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/=
systemd>`
>> +used to forcibly set the MAC policy by default when the ``pni-names``
>> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See
>
> s/was/is/ ?
>
>> +https://www.freedesktop.org/software/systemd/man/latest/systemd.link.ht=
ml#AlternativeNamesPolicy=3D.
>> +
>> +This is no longer the case. Instead, when the ``pni-names`` :term:`dist=
ro
>
> SHould we justify here why it is no longer the case?
>
>> +feature <DISTRO_FEATURES>` is enabled, the default policy from systemd =
is
>> +selected (from https://github.com/systemd/systemd/blob/main/network/99-=
default.link).
>> +
>> +To set the MAC policy to systemd, add the following to a systemd ``.bba=
ppend``
>
> s/to systemd/in systemd/ ?
>
>> +file in your custom layer::
>> +
>> +   do_install:append() {
>> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true',=
 'false', d)}; then
>> +                  if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libd=
ir}/systemd/network/99-default.link; then
>> +                          sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nona=
rch_libdir}/systemd/network/99-default.link
>> +                  fi
>> +                  if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${n=
onarch_libdir}/systemd/network/99-default.link; then
>> +                          sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/'=
 ${D}${nonarch_libdir}/systemd/network/99-default.link
>> +                  fi
>
> My brain's sh parser says this is invalid because we're missing a=20
> closing fi for the outermost if block.

Yes, my bad I must have removed it by mistake

> I'm also a bit worried about this code snippet as it'll just not be=20
> tested or maintained once this gets merged.

This snippet belongs to a release note for 5.3 so it already matches the Yo=
cto
version? I will include the version of systemd version here at the time of
writing to give some more context.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


