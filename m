Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B69D13C07
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:08:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19533.1769432886413425628
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 05:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZeLzWSJ7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 48DE71A2995;
	Mon, 26 Jan 2026 13:08:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F0C860717;
	Mon, 26 Jan 2026 13:08:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA1F1119A80E2;
	Mon, 26 Jan 2026 14:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769432883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n5U3jaRatjt9dlapFcYVijfwW8kGu5VLfIoDF+Xp5Ls=;
	b=ZeLzWSJ7MtyqH2uYonF1z/4DbeUw8jM5V+kNoXTWgXj1WnXVwqjz8yjc0ocE9rxD7vJxVH
	S/WGcb6AnK3Z9lNL6qG3GKsnQse71S3zliFZOzXTO9vp+U1/FOFzorMdlFygwt9cvntma6
	8LsfRjcCxmrYWzucsdctR9JeREJO8vbrvTqT3qenAxCvQ/4D0dYgxYwPS6PaNQdNMMQiia
	D0g/i8HRlh4bIfFW+XEkEYf+BgOTAfJpI3ue6mEPf0u6HOrkfkWE9n9pQ5bIg6zV6F5HsU
	YdAPBjYP9UUaYtTa78vZt9qr5dHyb36m2hx8VfjNfhsE+Efg1dSO8ojh6aULHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 14:08:02 +0100
Message-Id: <DFYJLWBVD6BX.2BUOP228CD4H7@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 07/53] dev-manual/building.rst: remove obsolete
 poky repo references
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-7-658a5f4dbde2@bootlin.com>
 <d2516cf3-669d-4b82-97a1-7fb2674e6f9e@cherry.de>
In-Reply-To: <d2516cf3-669d-4b82-97a1-7fb2674e6f9e@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 26 Jan 2026 13:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8648

Hi,

On Tue Jan 13, 2026 at 12:30 PM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Remove references to the Poky repository, replace by OpenEmbedded-Core
>> in most cases.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/dev-manual/building.rst  | 40 +++++++-------------------=
--------
>>   documentation/ref-manual/fragments.rst |  2 ++
>>   2 files changed, 10 insertions(+), 32 deletions(-)
>>=20
>> diff --git a/documentation/dev-manual/building.rst b/documentation/dev-m=
anual/building.rst
>> index 60ad11f52..c153eb9de 100644
>> --- a/documentation/dev-manual/building.rst
>> +++ b/documentation/dev-manual/building.rst
>> @@ -51,32 +51,9 @@ The following figure and list overviews the build pro=
cess:
>>      Yocto Project*: See the ":doc:`/dev-manual/start`" section for opti=
ons on how to get a
>>      build host ready to use the Yocto Project.
>>  =20
>> -#. *Initialize the Build Environment:* Initialize the build environment
>> -   by sourcing the build environment script (i.e.
>> -   :ref:`structure-core-script`)::
>> -
>> -      $ source oe-init-build-env [build_dir]
>> -
>> -   When you use the initialization script, the OpenEmbedded build syste=
m
>> -   uses ``build`` as the default :term:`Build Directory` in your curren=
t work
>> -   directory. You can use a `build_dir` argument with the script to
>> -   specify a different :term:`Build Directory`.
>> -
>> -   .. note::
>> -
>> -      A common practice is to use a different :term:`Build Directory` f=
or
>> -      different targets; for example, ``~/build/x86`` for a ``qemux86``
>> -      target, and ``~/build/arm`` for a ``qemuarm`` target. In any
>> -      event, it's typically cleaner to locate the :term:`Build Director=
y`
>> -      somewhere outside of your source directory.
>> -
>> -#. *Make Sure Your* ``local.conf`` *File is Correct*: Ensure the
>> -   ``conf/local.conf`` configuration file, which is found in the
>> -   :term:`Build Directory`, is set up how you want it. This file define=
s many
>> -   aspects of the build environment including the target machine archit=
ecture
>> -   through the :term:`MACHINE` variable, the packaging format used duri=
ng
>> -   the build (:term:`PACKAGE_CLASSES`), and a centralized tarball downl=
oad
>> -   directory through the :term:`DL_DIR` variable.
>> +#. *Make Sure Your Configuration is Correct*: Use :ref:`bitbake-config-=
build <ref-bitbake-config-build-qf>` to
>> +   define the :term:`MACHINE` or :term:`DISTRO`, and open your
>
> Unrelated to this, but I'm very confused as to why we enforce a MACHINE=
=20
> when one is set with the fragments (which is the default). I don't think=
=20
> there's a reason for that and it makes it "painful" for me to build=20
> multiple machines within the same setup. Let me pass MACHINE=3D on the=20
> command line? We don't even tell users they can simply remove the=20
> machine fragment to then pass MACHINE from the CLI, which I believe ends=
=20
> up encouraging users to have completely separate setups when the only=20
> thing that changes is MACHINE.

I agree and think this is a regression compared to what was possible before=
. I
would suggest bringing this up in the bitbake mailing list to open the
discussion.

I usually end up removing the fragment definition entirely and use local.co=
nf to
set my MACHINE.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


