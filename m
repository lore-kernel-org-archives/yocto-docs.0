Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A07FCD5BCF
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 07:48:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32358.1779781687666134310
 for <docs@lists.yoctoproject.org>;
 Tue, 26 May 2026 00:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CKhu/RGi;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B37CAC79AB2;
	Tue, 26 May 2026 07:48:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 740A660732;
	Tue, 26 May 2026 07:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86860108883D0;
	Tue, 26 May 2026 09:48:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779781684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D1rN3CfliSBCO1H9/qO1COLn+52dGD/ksonKTOv/kcU=;
	b=CKhu/RGi2m4rXcHQsU3K6xNUnccGy917ED8J5NqBXHdppthVgNRYffE4hOIuS7yt6yOrF9
	YmnkfF/5IkSgB4uAAOtMpvMk0yEVcUg+U+Ny9Hb1XWpy5s/hDnyl6TbQsH+625bLpMZ9VG
	BvlVi/bYOSPpdD4MNhfsgQThQ5hwvbnY0Qko6Dt57EsuO41WP5VPZ7xre8FIRzDtVWBHlH
	Qk2ZnO61KitawxS5kjozP3tJs+XtxEJQi3tsMC4s14jIPI1No7l07Qfwe2qWn0DfAb4zLl
	c0NxF7Ed1qGRW9YizCzxSWk8a/Ay4X0wKkVzK4BBmZfHaJsQcQFoXVCs4dfcIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 09:48:02 +0200
Message-Id: <DISFY9Q6CGSZ.TT46F4NAJSFC@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] ref-manual: clarify that PACKAGE_EXCLUDE
 supports DEB packaging
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
References: <cb7c2ab0-bf11-5fa5-5730-2776d56dad0d@crashcourse.ca>
 <005af954-7f10-4b76-9257-d86b25713d32@cherry.de>
 <3ef2473d-af97-e952-6279-45e8438a7380@crashcourse.ca>
 <36d0ec5d-8965-44fd-8886-ac3a014d6fab@cherry.de>
In-Reply-To: <36d0ec5d-8965-44fd-8886-ac3a014d6fab@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 May 2026 07:48:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9535

Hi,

On Fri May 22, 2026 at 6:23 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> On 5/22/26 6:26 PM, Robert P. J. Day wrote:
>> On Fri, 22 May 2026, Quentin Schulz wrote:
>>=20
>>> Hi Robert,
>>>
>>> On 5/22/26 6:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>>
>>>> As an accompaniment to earlier commit
>>>> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
>>>> PACKAGE_EXCLUDE supports the DEB packaging backend.
>>>>
>>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>>
>>>> ---
>>>>
>>>> diff --git a/documentation/ref-manual/variables.rst
>>>> b/documentation/ref-manual/variables.rst
>>>> index c65794229..2773e9864 100644
>>>> --- a/documentation/ref-manual/variables.rst
>>>> +++ b/documentation/ref-manual/variables.rst
>>>> @@ -6927,8 +6927,8 @@ system and gives an overview of their function a=
nd
>>>> contents.
>>>>          an iterative development process to remove specific component=
s from
>>>> a
>>>>          system.
>>>>
>>>> -      This variable is supported only when using the IPK and RPM
>>>> -      packaging backends. DEB is not supported.
>>>> +      This variable is supported by all of the RPM, DEB and IPK
>>>> +      packaging backends.
>>>>
>>>
>>> Considering those are all the backends we support, can't we simply remo=
ve the
>>> paragraph entirely?
>>=20
>>    i mentally flipped a coin and thought about people who might have
>> remembered the earlier situation, but i'm happy to toss that last line
>> entirely.
>>=20
>
> Fine either way, let's see what Antonin prefers :)

Considering both options, I think they are for the most part equal, except =
that
someone who did know about the limitation before will now have a clear sent=
ence
that clarifies this point now. So let's keep it, I'm taking the patch :)

Antonin

