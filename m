Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034F3CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:33:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.18087.1757511177955035051
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 06:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hlRnV0Tm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 195C34E40BBC;
	Wed, 10 Sep 2025 13:32:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 082CA606D4;
	Wed, 10 Sep 2025 13:32:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50BF4102F1C63;
	Wed, 10 Sep 2025 15:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757511175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kc/w9Txt7BkGKhg8qQA6X2PetNVEU+Ki/AwaMREV2dU=;
	b=hlRnV0TmQUe66wtVw0i95Hy4UP5JTK5c0Z0wmJOYyJ8MeLwHyiFMeMinScYm4An3kdV7lC
	L5lesTYGJouEmSQ+Ywm6ZMWB0i9jj/vMhnfGDk6tgaVUufihUJqcuLGnpNPVTigyhCbkGi
	ktX8QJg45h76hRzAt0GDv5oXCg9cqmcAUT3NQAPDNrKdhmW/FOOYJZyjeGODcF6tdD5qOA
	wpXOhQES3IzE3o4OichKGogIPtedN08MIVmL3bD5J+0B4pLxc5bAS7qUo6DRYXiAR758iO
	yrQXe5OtY9UuTi/JcA+pDs/P948ZTc8Y0WXizgdkRDPZ9zKtQkuJWV3ZM5YZ4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 15:32:48 +0200
Message-Id: <DCP5POSAGUMF.23UE4FM0ZY1DN@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Koen Kooi"
 <koen.kooi@oss.qualcomm.com>, "Ross Burton" <Ross.Burton@arm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
 <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
 <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
 <bec3b912-1220-4478-a30e-4c4d828860b5@cherry.de>
In-Reply-To: <bec3b912-1220-4478-a30e-4c4d828860b5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 13:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7495

On Wed Sep 10, 2025 at 3:16 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 9/10/25 3:08 PM, Antonin Godard wrote:
>> On Tue Sep 9, 2025 at 3:59 PM CEST, Quentin Schulz via lists.yoctoprojec=
t.org wrote:
>>> Hi Antonin,
>>>
>>> On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Add a migration note on the pni-names default policy change after comm=
it
>>>> <> in OE-Core.
>>>>
>>>
>>> General question, the systemd manpage specifies the policy as mac and
>>> not MAC, should we follow that as well?
>>>
>>>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>>> Cc: Ross Burton <Ross.Burton@arm.com>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/migration-guides/migration-5.3.rst | 25 +++++++++++++=
+++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/documentation/migration-guides/migration-5.3.rst b/docume=
ntation/migration-guides/migration-5.3.rst
>>>> index 2d2f8d91a..8aa7b537f 100644
>>>> --- a/documentation/migration-guides/migration-5.3.rst
>>>> +++ b/documentation/migration-guides/migration-5.3.rst
>>>> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to=
 build this FIT image, as
>>>>    described in the :ref:`Removed Classes <migration-guides/migration-=
5.3:Removed
>>>>    Classes>` section of the Migration notes for |yocto-ver| (|yocto-co=
dename|).
>>>>   =20
>>>> +systemd Predictable Interface Names no longer MAC policy by default
>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> +
>>>> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-cor=
e/systemd>`
>>>> +used to forcibly set the MAC policy by default when the ``pni-names``
>>>> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See
>>>
>>> s/was/is/ ?
>>>
>>>> +https://www.freedesktop.org/software/systemd/man/latest/systemd.link.=
html#AlternativeNamesPolicy=3D.
>>>> +
>>>> +This is no longer the case. Instead, when the ``pni-names`` :term:`di=
stro
>>>
>>> SHould we justify here why it is no longer the case?
>>>
>>>> +feature <DISTRO_FEATURES>` is enabled, the default policy from system=
d is
>>>> +selected (from https://github.com/systemd/systemd/blob/main/network/9=
9-default.link).
>>>> +
>>>> +To set the MAC policy to systemd, add the following to a systemd ``.b=
bappend``
>>>
>>> s/to systemd/in systemd/ ?
>>>
>>>> +file in your custom layer::
>>>> +
>>>> +   do_install:append() {
>>>> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true=
', 'false', d)}; then
>>>> +                  if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_li=
bdir}/systemd/network/99-default.link; then
>>>> +                          sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${no=
narch_libdir}/systemd/network/99-default.link
>>>> +                  fi
>>>> +                  if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}$=
{nonarch_libdir}/systemd/network/99-default.link; then
>>>> +                          sed -i '/AlternativeNamesPolicy=3D/s/$/ mac=
/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>>> +                  fi
>>>
>>> My brain's sh parser says this is invalid because we're missing a
>>> closing fi for the outermost if block.
>>=20
>> Yes, my bad I must have removed it by mistake
>>=20
>>> I'm also a bit worried about this code snippet as it'll just not be
>>> tested or maintained once this gets merged.
>>=20
>> This snippet belongs to a release note for 5.3 so it already matches the=
 Yocto
>> version? I will include the version of systemd version here at the time =
of
>> writing to give some more context.
>>=20
>
> Does this mean that we already know it's not going to be compatible with=
=20
> Wrynose?
>
> People are told to follow each migration manual between their current=20
> and target Yocto releases, so this will essentially be understood as=20
> "apply for any release starting from 5.3".
>
> We already saw how well maintained old example recipes were since we=20
> don't test them, I'm not sure it makes sense to have code snippets we'll=
=20
> likely never test as well?

A simpler approach could be to say:

"""
To set the mac policy to systemd, modify the ``99-default-link.link`` file
provided by systemd in a ``.bbappend`` file to set the ``NamePolicy=3D`` an=
d
``AlternativeNamesPolicy=3D`` settings to "mac".
"""

This should not require maintenance. Do you agree?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


