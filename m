Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614B4C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:34:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38920.1785746051291867405
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Aug 2026 01:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XS5I/hr3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A70581A13C4;
	Mon,  3 Aug 2026 08:34:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C48B6029B;
	Mon,  3 Aug 2026 08:34:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67D4911C17C51;
	Mon,  3 Aug 2026 10:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785746048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X/sq5Y2xTWNv4J7x6TEKKqZooIDQOeZZIhPIAr5SmMk=;
	b=XS5I/hr3JEI0+Id+8NkGY7/IlKYQrWd3qrSMuvNnKr1M3BZyXZdRbI8TuBc+zA0LZoFwaQ
	ceU/9f/IPfGE73dh228Q6RtR5q6Tc5YoMjDKCKJUhovq6+3ljb2QAIQb4UiUlK7YIF54e4
	4D+uODPcZIoC8RIW+xuEv3T72MoFF+qQoYDGnnaI4WPfrNXqkh0M4j74nmjNUMfQ6aSI+P
	0SgG+XcKVg3wqf9y7f+EsSDwgs6zJvUQjXzcdrqGsltNvQ7BRgWNRWC1zGoXMHCEbImT0N
	YNl5/YovR0TETrvqvJ/8wf2/ekBc1FF4vWzWLk51xi7lq5uxZPx0W+7VD7Libg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 10:34:08 +0200
Message-Id: <DKF65591H2KN.2VWYN8EOM0GO7@bootlin.com>
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Subject: Re: [docs] [PATCH v2] features: Add distro feature "audit"
References: <alchGk8fYN2cPmGa@navimatix.de>
 <db22bdb6f13cb1a7159a9284058eba3f07a4a700.1784236750.git.joerg.sommer@navimatix.de> <DKA11RVSKMIV.2KTHUGS1LWTID@bootlin.com> <anA5F1vAGnYBEVWN@navimatix.de>
In-Reply-To: <anA5F1vAGnYBEVWN@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 08:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10231

Hi,

On Mon Aug 3, 2026 at 8:58 AM CEST, J=C3=B6rg Sommer wrote:
> Antonin Godard schrieb am Di 28. Jul, 09:31 (+0200):
>> On Thu Jul 16, 2026 at 11:25 PM CEST, J=C3=B6rg Sommer via lists.yoctopr=
oject.org wrote:
>> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>> >
>> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>> > ---
>> > Changes since v1:
>> >
>> > * I've added a link to the documentation wiki.
>> >
>> >  documentation/ref-manual/features.rst | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/documentation/ref-manual/features.rst b/documentation/ref=
-manual/features.rst
>> > index 77d034f0c..d12b7fa13 100644
>> > --- a/documentation/ref-manual/features.rst
>> > +++ b/documentation/ref-manual/features.rst
>> > @@ -141,6 +141,8 @@ metadata, as extra layers can define their own:
>> >     section in the Yocto Project Application Development and the
>> >     Extensible Software Development Kit (eSDK) manual.
>> > =20
>> > +-  *audit:* Enables `linux-audit <https://github.com/linux-audit/audi=
t-documentation/wiki>`__ support.
>>=20
>> We haven't received feedback on whether audit should be added to OE-Core=
, so at
>> least we need to note here that this recipe in available in meta-oe.
>
> I have made an attempt to transfer the recipe to oe-core:
> https://lists.openembedded.org/g/openembedded-core/message/242609
>
>> By adding the following note just below your addition?
>>=20
>> .. note::
>>=20
>>    The ``audit`` recipe is provided by :oe_git:`meta-oe
>>    </meta-openembedded/tree/meta-oe/>` in ``meta-openembedded``.
>
> If my commit gets rejected we should add this note.

Ok, thanks! I'll merge this patch to master-next now and will let you follo=
w-up
depending on the decision being made.

Antonin

