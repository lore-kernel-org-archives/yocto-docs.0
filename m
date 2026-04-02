Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A06BCC6B32
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:28:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11158.1775118532318760613
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WOcrVWJQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 312854E428AA;
	Thu,  2 Apr 2026 08:28:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 007DF5FDEB;
	Thu,  2 Apr 2026 08:28:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DAAD104502A3;
	Thu,  2 Apr 2026 10:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775118529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5IqVwR+qqZbVRvJCMVunGAc7JLlwnZDXfUbVN0kdGiI=;
	b=WOcrVWJQb7UGjbYFRDlxh3i30yZLtlw/pOadb8RtxUXJQPDX80vSIRiEoZW3xT807FPVOU
	tWLn92AwrBaGnC9DaujDLAhFLBrZmjHw3WY31VkQK0pO6bSbrTsw7SwSxuscMBxDfi6Pwq
	+fqkpL20/c5gB2LzFbsE/b/l5bellWTc2Tx9262iwGIn553LJmK9U9JZ+D86ZyPI51i5uo
	fzS5CzVd2btbzY9yls11V/9U2sLhy0u9t51Y1PfWTzB08BDdiGgvbszD+mkJga1HGp07ob
	Yp5r0tuuUe8GDoRJoJwWS9dD5gsBIYE54RH75mii1PKxZe1F5Xaf7T0dxbk6qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 10:28:47 +0200
Message-Id: <DHIJ01UHFNCM.3PGI9MA9GAFV2@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] set_versions.py: skip laverne branch for
 closest branch
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20260402-set-versions-fixes-v1-0-0609a8747b96@bootlin.com>
 <20260402-set-versions-fixes-v1-1-0609a8747b96@bootlin.com>
 <9955c1bf-c6ea-4e6b-aa68-f0a6df16ac95@cherry.de>
In-Reply-To: <9955c1bf-c6ea-4e6b-aa68-f0a6df16ac95@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9162

Hi,

On Thu Apr 2, 2026 at 10:22 AM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 4/2/26 10:13 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> The laverne branch was created but never branched off, which breaks the
>> algorithm trying to determine the closest branch as it always gets count
>> 0. Skip this branch as it is old and we'll never branch off of it now.
>>=20
>> This fixes the following issue:
>>=20
>> Branch laverne has count 0
>> Nearest release branch estimated to be laverne
>> Traceback (most recent call last):
>>    File "/data/yoctoproject/ws/repos/yocto-docs/documentation/./set_vers=
ions.py", line 167, in <module>
>>      bitbakeversion =3D bitbake_mapping[ourseries]
>>                       ~~~~~~~~~~~~~~~^^^^^^^^^^^
>> KeyError: 'laverne'
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/set_versions.py | 5 +++++
>>   1 file changed, 5 insertions(+)
>>=20
>> diff --git a/documentation/set_versions.py b/documentation/set_versions.=
py
>> index 29638b324..465204998 100755
>> --- a/documentation/set_versions.py
>> +++ b/documentation/set_versions.py
>> @@ -142,6 +142,11 @@ if ourversion is None:
>>               result =3D subprocess.run(["git", "log", "--format=3Doneli=
ne", "HEAD..origin/" + b],
>>                                       stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.PIPE,
>>                                       universal_newlines=3DTrue)
>> +            # The laverne branch was created but never branched off, wh=
ich
>> +            # breaks this algorithm as this always gets count 0. Skip t=
his
>> +            # branch as it is old and we'll never branch off of it now.
>> +            if b =3D=3D "laverne":
>> +                continue
>
> Why run the command if we're gonna skip the loop regardless of the=20
> result of the command? Just do the continue before the subprocess.run?

An oversight, I'll move it above, thanks

Antonin

