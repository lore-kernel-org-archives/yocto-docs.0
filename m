Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C3ACAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 11:28:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14428.1757676481256716350
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 04:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=raZhGFOt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6ED2D1A0DCD
	for <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 11:27:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4560B60638;
	Fri, 12 Sep 2025 11:27:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54F70102F2A3E;
	Fri, 12 Sep 2025 13:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757676478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oxCroEavSvYB4z/af5VQwpRdPuw6HURnQhmTSadOZMs=;
	b=raZhGFOtNipW4n6Vf4xM1kQQt7fu/8yxNyZDsGMMK2MnPneARs0UWAm5qoLWEO7o4kO7Rb
	6DSZlzXv7O++K9js0ovuuNVSis2a0ZSH3q+qC4nYiDRE/fvLAeyYUCePpaPyLko/Xykue7
	AFPy4IKbiBoV/dRKSF+ySEAGli4q9dypsIBvSHclghLcmyJwboS38C284ll0r5xq0iiFGl
	84k0q/b1znuwWCzwkSTOe/RgGyXv57ujRfhyab6WH9hC6lD0i/YtLGlHK/h0SPJRhryLBm
	jaCDgVR17Wst4Ihb47GrjpwVeBiNEALcncJsoVlUI1oeYVjDFBLLrmNS9qgXwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 13:27:45 +0200
Message-Id: <DCQSB16YG4WC.12YXCXX57B55Q@bootlin.com>
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Koen Kooi"
 <koen.kooi@oss.qualcomm.com>, "Ross Burton" <Ross.Burton@arm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
 <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
 <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
 <bec3b912-1220-4478-a30e-4c4d828860b5@cherry.de>
 <DCP5POSAGUMF.23UE4FM0ZY1DN@bootlin.com>
 <f270625a-1bb3-4f42-b8ad-4ef13aced825@cherry.de>
In-Reply-To: <f270625a-1bb3-4f42-b8ad-4ef13aced825@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Sep 2025 11:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7500

On Wed Sep 10, 2025 at 4:08 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 9/10/25 3:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> On Wed Sep 10, 2025 at 3:16 PM CEST, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>> Hi Antonin,
>>>
>>> On 9/10/25 3:08 PM, Antonin Godard wrote:
>>>> On Tue Sep 9, 2025 at 3:59 PM CEST, Quentin Schulz via lists.yoctoproj=
ect.org wrote:
>>>>> Hi Antonin,
>>>>>
>>>>> On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>>>> Add a migration note on the pni-names default policy change after co=
mmit
>>>>>> <> in OE-Core.
>>>>>>
>>>>>
>>>>> General question, the systemd manpage specifies the policy as mac and
>>>>> not MAC, should we follow that as well?
>>>>>
>>>>>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>>>>> Cc: Ross Burton <Ross.Burton@arm.com>
>>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>>> ---
>>>>>>     documentation/migration-guides/migration-5.3.rst | 25 ++++++++++=
++++++++++++++
>>>>>>     1 file changed, 25 insertions(+)
>>>>>>
>>>>>> diff --git a/documentation/migration-guides/migration-5.3.rst b/docu=
mentation/migration-guides/migration-5.3.rst
>>>>>> index 2d2f8d91a..8aa7b537f 100644
>>>>>> --- a/documentation/migration-guides/migration-5.3.rst
>>>>>> +++ b/documentation/migration-guides/migration-5.3.rst
>>>>>> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe =
to build this FIT image, as
>>>>>>     described in the :ref:`Removed Classes <migration-guides/migrati=
on-5.3:Removed
>>>>>>     Classes>` section of the Migration notes for |yocto-ver| (|yocto=
-codename|).
>>>>>>    =20
>>>>>> +systemd Predictable Interface Names no longer MAC policy by default
>>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>> +
>>>>>> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-c=
ore/systemd>`
>>>>>> +used to forcibly set the MAC policy by default when the ``pni-names=
``
>>>>>> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See
>>>>>
>>>>> s/was/is/ ?
>>>>>
>>>>>> +https://www.freedesktop.org/software/systemd/man/latest/systemd.lin=
k.html#AlternativeNamesPolicy=3D.
>>>>>> +
>>>>>> +This is no longer the case. Instead, when the ``pni-names`` :term:`=
distro
>>>>>
>>>>> SHould we justify here why it is no longer the case?
>>>>>
>>>>>> +feature <DISTRO_FEATURES>` is enabled, the default policy from syst=
emd is
>>>>>> +selected (from https://github.com/systemd/systemd/blob/main/network=
/99-default.link).
>>>>>> +
>>>>>> +To set the MAC policy to systemd, add the following to a systemd ``=
.bbappend``
>>>>>
>>>>> s/to systemd/in systemd/ ?
>>>>>
>>>>>> +file in your custom layer::
>>>>>> +
>>>>>> +   do_install:append() {
>>>>>> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'tr=
ue', 'false', d)}; then
>>>>>> +                  if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_=
libdir}/systemd/network/99-default.link; then
>>>>>> +                          sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${=
nonarch_libdir}/systemd/network/99-default.link
>>>>>> +                  fi
>>>>>> +                  if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D=
}${nonarch_libdir}/systemd/network/99-default.link; then
>>>>>> +                          sed -i '/AlternativeNamesPolicy=3D/s/$/ m=
ac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>>>>> +                  fi
>>>>>
>>>>> My brain's sh parser says this is invalid because we're missing a
>>>>> closing fi for the outermost if block.
>>>>
>>>> Yes, my bad I must have removed it by mistake
>>>>
>>>>> I'm also a bit worried about this code snippet as it'll just not be
>>>>> tested or maintained once this gets merged.
>>>>
>>>> This snippet belongs to a release note for 5.3 so it already matches t=
he Yocto
>>>> version? I will include the version of systemd version here at the tim=
e of
>>>> writing to give some more context.
>>>>
>>>
>>> Does this mean that we already know it's not going to be compatible wit=
h
>>> Wrynose?
>>>
>>> People are told to follow each migration manual between their current
>>> and target Yocto releases, so this will essentially be understood as
>>> "apply for any release starting from 5.3".
>>>
>>> We already saw how well maintained old example recipes were since we
>>> don't test them, I'm not sure it makes sense to have code snippets we'l=
l
>>> likely never test as well?
>>=20
>> A simpler approach could be to say:
>>=20
>> """
>> To set the mac policy to systemd, modify the ``99-default-link.link`` fi=
le
>> provided by systemd in a ``.bbappend`` file to set the ``NamePolicy=3D``=
 and
>> ``AlternativeNamesPolicy=3D`` settings to "mac".
>> """
>>=20
>> This should not require maintenance. Do you agree?
>>=20
[...]
> We could simply say that when pni-names is unset, NamePolicy and=20
> AlternativeNamesPolicy are unset. Otherwise, the systemd upstream=20
> default is used.
>
> Maybe add a link to the manpage as well, via :manpage:`systemd.link(5)`=
=20
> (not tested)?
>
> No better suggestion though :/

Yes, I think we both want to keep things simple. I'll send a v2 with a link=
 to
the manpage and just mention the NamePolicy and AlternativeNamesPolicy opti=
ons,
as you phrased it.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


