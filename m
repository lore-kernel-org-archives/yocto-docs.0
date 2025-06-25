Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238BAC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 06:36:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9289.1750833391763635104
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 23:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=k+Rtwbbu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7165C442C0;
	Wed, 25 Jun 2025 06:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750833389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcCm1AZJ8yNesdupslitZMyu/j57lFkIGNH+tYOgFNs=;
	b=k+RtwbbuFaTGbkn/q64GICv74zMzGv4UqTPSfYRhUm4sgta5Rax0hbow305VIeAZirT34I
	C0kwsvU7jmI8crGmxKi84StFHMX61j/bWIV5NOK7xRb2KSM5z4r5d4sjb7MzLVv3P3poBT
	HpWwX2dAA5nrItbQ81Dp6CAjLDoz9UaH4Z6G36vUiSCIXGoQYn/IZoEQKlMOQHFNErJuyq
	HMk04CwdxLT95BGAkwgWzc9r1eXVNyngUKEGTCD8QChW0UKkhaRWHCzUaXT/J8sJrjY+1O
	2gLC33J3HDNrm8gKMdTz5R6v3B26n+G6pP+SYtxWJRWt8NSgQ6ljpCN7WfiiFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 08:36:28 +0200
Message-Id: <DAVEMYWEE8O2.2WOJL179IV6MJ@bootlin.com>
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
Subject: Re: [docs] [PATCH] Add a document on limiting host resources
References: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
 <aFuS2wzR9hm3Y9CO@nuoska>
In-Reply-To: <aFuS2wzR9hm3Y9CO@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveeuveeuuedvueevgeegueefgfehueeugedutdeuudfgjeehhfeijedujeejfeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvt
 ghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Jun 2025 06:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7219

On Wed Jun 25, 2025 at 8:10 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Tue, Jun 24, 2025 at 04:42:15PM +0200, Antonin Godard via lists.yoctop=
roject.org wrote:
>> Add a "Limiting the Host Resources Usage" document to share the
>> different techniques that can be used to limit the host resources usage.
>> We do have a document to document how to speed up a build, so this
>> document comes right after.
>>=20
>> [YOCTO #15111]
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  documentation/dev-manual/index.rst              |  1 +
>>  documentation/dev-manual/limiting-resources.rst | 85 ++++++++++++++++++=
+++++++
>>  2 files changed, 86 insertions(+)
>>=20
>> diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manu=
al/index.rst
>> index 63736e0ab..4abfa59e9 100644
>> --- a/documentation/dev-manual/index.rst
>> +++ b/documentation/dev-manual/index.rst
>> @@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
>>     building
>>     multiconfig
>>     speeding-up-build
>> +   limiting-resources
>>     libraries
>>     prebuilt-libraries
>>     devtool
>> diff --git a/documentation/dev-manual/limiting-resources.rst b/documenta=
tion/dev-manual/limiting-resources.rst
>> new file mode 100644
>> index 000000000..df8208bdc
>> --- /dev/null
>> +++ b/documentation/dev-manual/limiting-resources.rst
>> @@ -0,0 +1,85 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Limiting the Host Resources Usage
>> +*********************************
>> +
>> +While you sometimes need to :doc:`speed up a build
>> +</dev-manual/speeding-up-build>`, you may also need to limit the resour=
ces used
>> +by the :term:`OpenEmbedded Build System`, especially on shared infrastr=
uctures
>> +where multiple users start heavy-load builds.
>> +
>> +This document aims at giving the different configuration variables avai=
lable to
>> +limit the resources used by the build system. These variables should be=
 set from
>> +a :term:`configuration file` and thus take effect over the entire build=
 environment.
>> +For each variable, also see the variable description in the glossary fo=
r more
>> +details.
>> +
>> +-  :term:`BB_NUMBER_THREADS`:
>> +
>> +   This sets a hard limit on the number of threads :term:`BitBake` can =
run at the
>> +   same time. Lowering this value will set a limit to the number of
>> +   :term:`BitBake` threads, but will not prevent a single task from sta=
rting more
>> +   compilation threads (see :term:`PARALLEL_MAKE`).
>> +
>
> I would add here or to intro that confusingly, CPU load caused by too muc=
h parallellism
> may not be the problem but running out of physical RAM which trigger kern=
el
> out-of-memory killer to kill processes related to builds causing very
> odd looking failures in build logs. The oom killer actions are visible in=
 build host
> kernel dmesg logs, but only there. Thus if machines has low physical RAM
> to CPU thread ratio, say less than 2 Gb, then limiting both BB_NUMBER_THR=
EADS
> and PARALLEL_MAKE can help.
>
> Cheers,
>
> -Mikko

That's a good idea for the v2, thank you. I recollect having issues in the
linking stage of some RAM-hungry recipes:

  collect2: error: ld returned 1 exit status

But no real error messages above - so looking at the kernel dmesg is a good=
 tip
here indeed.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


