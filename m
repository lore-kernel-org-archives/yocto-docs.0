Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBAFC5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 08:57:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2546.1785488223155383092
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=m5ij979F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E36361A134B;
	Fri, 31 Jul 2026 08:57:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B83AC6039A;
	Fri, 31 Jul 2026 08:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37C1F11C165A2;
	Fri, 31 Jul 2026 10:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785488216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=STojmD5XXCz2LrGAk4sIKk/ZLTKzjJSnWN58VfTgLxc=;
	b=m5ij979FVy/3Dr/y4Njr+KjkVH4n7qd92gBkOcyuVdIg8WvcN2sTMj89YvJvZH8EnB82wy
	yqZpOhIbJisSpoyFCSzmDjPFpq8jMeO8HpFnpH8gNFClhEOsrftUIv0aZ63oJ0e9PKmAcY
	LySRCLhqhWzz/ishoLVbFoU7VI4r+rvbsjw7uKVd6sGYusWv2NTfm2DRH0w6OmVX75FNTa
	0GrIi2LZw2l6ojr5Gf2cWnC1qmWJh1/HMOMZHMPHB/BIM7rFN9cpi/SrUQotsgqaaca8OM
	T7+iLVxO8rt57BlhKBK43kfe2xQ7m3/UcPMXKott8Zp5d9nvMU6bUYVOadiVrA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jul 2026 10:56:54 +0200
Message-Id: <DKCMQY8VIU9R.23GVR5E2BW4AA@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 5/5] sdk-manual/intro.rst: detail differences
 between standard and extensible sysroots
References: <20260729-sdk-clarifications-v1-0-661e65201bc7@bootlin.com>
 <20260729-sdk-clarifications-v1-5-661e65201bc7@bootlin.com>
 <c4107ff7-d2db-4da6-93fd-4eb850403f31@cherry.de>
In-Reply-To: <c4107ff7-d2db-4da6-93fd-4eb850403f31@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 08:57:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10205

Hi,

On Thu Jul 30, 2026 at 1:39 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 7/29/26 12:02 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> The sysroot in the standard and the extensible SDKs are managed
>> differently. Detail this in the Sysroots section.
>>=20
>> [YOCTO #14830]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/sdk-manual/intro.rst | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>=20
>> diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manu=
al/intro.rst
>> index 8ccbcfa20..2e5f73f0b 100644
>> --- a/documentation/sdk-manual/intro.rst
>> +++ b/documentation/sdk-manual/intro.rst
>> @@ -123,6 +123,21 @@ sysroot is based on the target root filesystem imag=
e that is built by
>>   the OpenEmbedded build system and uses the same metadata configuration
>>   used to build the cross-toolchain.
>>  =20
>> +However, the extensible and standard SDKs sysroot differ in content:
>> +
>
> Why did we stop referring to the Sysroot term (:term:`Sysroot`)?

I can keep referring to it, but thought the first reference was enough. Wil=
l try
to refer to it when I can.

>> +-  The standard SDK sysroot only contains libraries and headers for the=
 packages
>
> s/for/of/?
>
> I think we should also mention this brings the libraries and headers of=
=20
> their dependencies (recursively) as well?

Correct, I'll add that

>> +   found in the :term:`TOOLCHAIN_TARGET_TASK` and :term:`TOOLCHAIN_HOST=
_TASK`
>> +   definitions, for the target and native sysroots respectively.
>> +
>
> I know we have a nativesdk OVERRIDE, so is it still a native/target=20
> sysroot or should it be named nativesdk too (I've never built an SDK so=
=20
> I don't know).

So here saying "native sysroot" makes sense if you're only look at the SDK.
Under yocto it's true that we have a distinction between native and natives=
dk,
so maybe replacing "native" by "host" here would avoid the confusion in any
case. Will do

>> +   See :doc:`/sdk-manual/appendix-customizing-standard` to learn how to
>> +   customize it.
>> +
>> +-  The extensible SDK sysroot is completely managed by the ``devtool``
>
> Can we maybe point at some docs for devtool? From a quick grep, maybe=20
> something in documentation/ref-manual/devtool-reference.rst?

Agreed, will add that

>> +   command-line tool, and its content is the same as the sysroot of the=
 image
>> +   recipe for which the SDK was built.
>> +
>
> I guess we could show how to do this here?
>
> I think it should be something like:
>
> bitbake my-image -c populate_sdk
>
> (or maybe point at=20
> https://docs.yoctoproject.org/sdk-manual/appendix-obtain.html#building-an=
-sdk-installer=20
> ?).

Since there are already references to appendix-obtain and appendix-customiz=
ing I
think it's already enough?

>> +   See :doc:`/sdk-manual/appendix-customizing` to learn how to customiz=
e it.
>> +
>
> Thinking about it, we probably should update=20
> documentation/ref-manual/terms.rst for the Sysroot entry in the glossary=
=20
> to explain sysroot for the SDKs (or at the very least point at the=20
> section here).

I'll see what could be done

Thanks!
Antonin

