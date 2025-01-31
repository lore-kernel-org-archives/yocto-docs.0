Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FA0C0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 10:31:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.16104.1738319481132285961
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 02:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MEAyzhJl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B3DA4427B;
	Fri, 31 Jan 2025 10:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738319479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gHynhezsebRaGWjYMzJpcyyI3K5HTysPnMBIqeV9Mw=;
	b=MEAyzhJlBmgWsz+d3KdOmp3k/LqPtF4VNKIze7NRGah8NrrfbC4wK/KblRT75k3dIY5Hoo
	kAawQ4B7d618XwKidz5wADWvQtc259BKUg+s8MUnVgnVrdzMLxyxeERIUuH989R16LbfhC
	KHICzhxZbJBpBRYJDtgKE1FQUmqeSaSTsOf3Q/Kfqu/vRnPa177v41V2sFkeRVVVi1lJXq
	t4hLGNKbBE6Q3F0wSGednr/g/5mknVcc+0GEl3CfdBksgSlGaeZtxK20CVvMj9knsWH45Z
	VGH2UaW8j2J//ozmWF4BJ3G8KkzWZt4XeYuobCRiMz2O7eKQRYPDNh6YdK8QnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 Jan 2025 11:31:18 +0100
Message-Id: <D7G6TS1RMDBT.30D86G3JTP7ZY@bootlin.com>
Subject: Re: [docs] [yocto-docs][PATCH] migration-5.2: Add entries for
 virtual provider and multiconfig changes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250129-migration-5-2-updates-v1-1-98416a476828@bootlin.com>
 <e7ba99fe-b117-47b8-a298-29e88f240504@cherry.de>
In-Reply-To: <e7ba99fe-b117-47b8-a298-29e88f240504@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekfeeivdehffehfedvgeevffdvkefgleelleevtdegtdegtdeuhfegleehudehvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhts
 hdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 10:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6224

Hi Quentin,

On Thu Jan 30, 2025 at 5:05 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 1/29/25 11:25 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add some information to the migration guide about two important potentia=
lly
>> breaking changes in 5.2.
>>=20
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>> Notes:
>> * original patch by Richard Purdie:
>>    https://lore.kernel.org/r/20250126111850.2609298-1-richard.purdie@lin=
uxfoundation.org
>>    This patch is just reformatting/typo fixes.
>> * The BB_CURRENT_MC should ideally be documented, but that will come at
>>    a later point with
>>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15709.
>> ---
>>   documentation/migration-guides/migration-5.2.rst | 23 ++++++++++++++++=
+++++++
>>   1 file changed, 23 insertions(+)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.2.rst b/document=
ation/migration-guides/migration-5.2.rst
>> index e9de6910e..245c22f28 100644
>> --- a/documentation/migration-guides/migration-5.2.rst
>> +++ b/documentation/migration-guides/migration-5.2.rst
>> @@ -94,6 +94,29 @@ systemd changes
>>      not for socket files).
>>      Now all service files must be explicitly added to :term:`FILES`.
>>  =20
>> +Multiconfig changes
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +-  The value of ``BB_CURRENT_MC`` was changed from ``default`` to an em=
pty string
>> +   for the default multiconfig configuration to avoid needing to map th=
e values
>> +   within BitBake. This was already not happening in some cases so this=
 fixes
>> +   some obscure bugs.
>> +
>> +Virtual toolchain provider changes
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +-  Support was added for virtual providers on a per-recipe basis for sp=
ecific
>> +   key toolchain providers listed in ``BB_VIRTUAL_RECIPE_PROVIDERS``. A=
s part of
>> +   that support, the ``cross`` providers were simplified to remove the =
triplet
>> +   prefix and generalise the naming, so for example::
>> +
>> +      virtual/${TARGET_PREFIX}-binutils -> virtual/cross-bintuils
>> +      virtual/${TARGET_PREFIX}-gcc -> virtual/cross-cc
>> +      virtual/${TARGET_PREFIX}-g++ -> virtual/cross-c++
>> +      virtual/${TARGET_PREFIX}-compilerlibs -> virtual/compilerlibs
>> +      virtual/${SDK_PREFIX}-binutils -> virtual/nativesdk-cross-binutil=
s
>> +      virtual/${SDK_PREFIX}-gcc -> virtual/nativesdk-cross-cc
>> +
>
> This is in the migration manual so we need to explicit what the user=20
> needs to do.

I don't know if there is a definite rule, but I will try to add more exampl=
es
here so hopefully it gives a clear overview of what should be replaced.

> What needs to be done wrt BB_CURRENT_MC change?

I would assume that any logic based on BB_CURRENT_MC =3D=3D "default" shoul=
d be
changed, like what's done in ff469ab2e865 ("bitbake.conf: Handle empty
BB_CURRENT_MC") on OE-Core.

I will suggest to do that in the v2.

> For the removal of TARGET_PREFIX/SDK_PREFIX, I assume a simple tree-wide:
>
> sed 's;virtual/\${TARGET_PREFIX}binutils;virtual/cross-bintuils;'
>
> should do the trick?

In the docs, we don't have any reference to virtual/XXX<something> where XX=
X is
HOST_PREFIX, SDK_PREFIX, or TARGET_PREFIX. So no changes to be done here at
least.

> Also, all of the above didn't have a dash after ${SDK_PREFIX} or=20
> ${TARGET_PREFIX}.

Indeed, good catch, will fix in v2.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

