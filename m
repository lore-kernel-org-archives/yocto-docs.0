Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD23D44146
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:19:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8441.1765527552755383892
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 00:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C1TKExK7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F5F04E41BAA
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 08:19:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D43A4606DF;
	Fri, 12 Dec 2025 08:19:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E81F103C8CFD;
	Fri, 12 Dec 2025 09:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765527550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lsBSBX5rUCDK8OqiVSMgnxVIt7DusoWdHKZ3Yq1/o+Q=;
	b=C1TKExK7NK+sjQ03XymP2s76AAjheefViZD2iaRaBzqCB4AMFWV7f0QiA5XVxmj5TegFC/
	YoD0OrK4LVXNFe48YccCt1tzvw59+1k1ivSc5KHfuUE3qX9Qvlwbdc2OBTqkrL762mxKzW
	gnMnoKMSYfKIX5ank0z2KSOHux11rxFYDALosgsj/OXwpWIvyQZNW5iGRIShu/XsdU4CCZ
	t8YlG7pkc+ih66fC+RLeB2u/rk/9d53uDQkeqwDk7+PT4YZs2oXsBvMnvi5qzJRGTKFEbT
	qaKg4JuHTTITKqgNQSgHGUA5A/oDFclenIKnqkBvF2owY8cz3iwROo5MAgIt6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 09:19:08 +0100
Message-Id: <DEW3A6LDZ6KZ.196SQHDYBEC4A@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/5] tools/build-docs-container: move
 container files in their own directory
References: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com> <20251211-build-docs-container-tlmgr-v2-1-58719c103a50@bootlin.com> <b6c3573d-91f1-4635-b77f-c6daa1a7b0db@cherry.de>
In-Reply-To: <b6c3573d-91f1-4635-b77f-c6daa1a7b0db@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 08:19:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8257

Hi,

On Thu Dec 11, 2025 at 1:26 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/11/25 10:06 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Create a directory to hold the Containerfiles as they were lying next to
>> the scripts. Change the build context of the docker build command to
>> build from SCRIPT_DIR and pass the host packages scripts and container
>> file relative to it.
>>=20
>
> It's unclear what this helps with. (I'm assuming this could be a remnant=
=20
> from last version's ENTRYPOINT support attempt?).

It's just for re-organizing, serves no other purpose than not mixing up scr=
ipts
and container files.

>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/tools/build-docs-container                    | 13 +++++=
+-------
>>   .../tools/{ =3D> containerfiles}/Containerfile.almalinux      |  0
>>   documentation/tools/{ =3D> containerfiles}/Containerfile.apt  |  0
>>   .../tools/{ =3D> containerfiles}/Containerfile.debian         |  0
>>   documentation/tools/{ =3D> containerfiles}/Containerfile.dnf  |  0
>>   .../tools/{ =3D> containerfiles}/Containerfile.fedora         |  0
>>   .../tools/{ =3D> containerfiles}/Containerfile.ubuntu         |  0
>>   .../tools/{ =3D> containerfiles}/Containerfile.zypper         |  0
>>   8 files changed, 6 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> index b91a6daa9..7d25b15b9 100755
>> --- a/documentation/tools/build-docs-container
>> +++ b/documentation/tools/build-docs-container
>> @@ -23,7 +23,6 @@ set -eu -o pipefail
>>   SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null &=
& pwd)
>>   CONTAINERCMD=3D${CONTAINERCMD:-docker}
>>   DOCS_DIR=3D"$SCRIPT_DIR/../.."
>> -SH_DIR=3D"$SCRIPT_DIR/host_packages_scripts"
>>   INCLUDE_ESSENTIAL_PACKAGES=3D${INCLUDE_ESSENTIAL_PACKAGES:-0}
>>  =20
>>   function usage()
>> @@ -140,12 +139,12 @@ main ()
>>       --tag "yocto-docs-$sanitized_dockername:latest" \
>>       --build-arg ARG_FROM=3D"docker.io/$image" \
>>       --build-arg INCLUDE_ESSENTIAL_PACKAGES=3D"${INCLUDE_ESSENTIAL_PACK=
AGES}" \
>> -    --build-arg ESSENTIAL=3D"$essential" \
>> -    --build-arg DOCS=3D"$docs" \
>> -    --build-arg DOCS_PDF=3D"$docs_pdf" \
>> -    --build-arg PIP3=3D"${pip3:-}" \
>> -    --file "$SCRIPT_DIR/$containerfile" \
>> -    "$SH_DIR/"
>> +    --build-arg ESSENTIAL=3D"host_packages_scripts/$essential" \
>> +    --build-arg DOCS=3D"host_packages_scripts/$docs" \
>> +    --build-arg DOCS_PDF=3D"host_packages_scripts/$docs_pdf" \
>> +    --build-arg PIP3=3D"host_packages_scripts/${pip3:-}" \
>> +    --file "$SCRIPT_DIR/containerfiles/$containerfile" \
>> +    "$SCRIPT_DIR"
>>  =20
>
> This seems to be doing two things: moving Containerfile.* into a subdir=
=20
> containerfiles and changing the context dir from SH_DIR to SCRIPT_DIR.=20
> Is there a reason they are both done in the same commit? Is the latter=20
> really necessary (I'm not sure it helps in terms of readability?).

I wasn't able to make that work any other way.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


