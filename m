Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A8AC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 15:11:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.15940.1743693061033862484
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 08:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Uxacy1uy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D945244502;
	Thu,  3 Apr 2025 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743693059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/3xEy3x5tPCFgYgqXKcv8ZA9Oo5wXtv530aLJho/PE=;
	b=Uxacy1uyFsNirfs+Glm3pCzSA5m8hhojx2odTxW/tyhOc9WJFkBo7GXCxcx+7QTmXxWkMp
	dfygW82G/gSWYP0A+c5ImKSDLwkJDmJdvOkWnSUxTyaPS940PA6ALuyBR2raINj4rXTEDO
	BEcU8AbterdbxhSYpRN7oJTF7KRT3w6YdSxz3asM8AIQsRV5mUoGGTu22/SGVXqPOxP/zX
	tc9AewAniBrrUbc66mTaAnAnYp5iKi7n9GsGtWIv3voik1C+/hcdULkYH5ZE0BWsdVi32a
	/tJNdbH71jrpsAXW8IbpB/WbmwRh+hQgi527PHR+aH5MKB4hZGZVlN+dldXdvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2025 17:10:58 +0200
Message-Id: <D8X3LOMBN1NV.TBIZ0Z7H4CCQ@bootlin.com>
Subject: Re: [PATCH 2/2] migration-guides/{migration,release-note}-5.2:
 improvements and fixes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Antonin Godard"
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250403-release-note-5-2-updates-fixes-v1-0-13d16361f17c@bootlin.com> <20250403-release-note-5-2-updates-fixes-v1-2-13d16361f17c@bootlin.com> <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de>
In-Reply-To: <874b31e6-63df-4d13-b967-3014e6ea8ffb@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgfehveefuedvjedufeeiheetgffggfeuteekuefhudelieegieeiudejteelveenucffohhmrghinhepshhomhgvrdhhohhsthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Apr 2025 15:11:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6709

Hi Quentin,

On Thu Apr 3, 2025 at 4:23 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/3/25 4:08 PM, Antonin Godard wrote:
>> Address some of the reviews received on the release notes and migration
>> guide for 5.2:
>>=20
>> - Remove the wget fetcher addition, I misread commit 0a9f90ff658e
>>    ("tests/fetch: support setting PV in the wget fetcher") from BitBake,
>>    and it actually affects the tests for the wget fetcher, not the
>>    fetcher itself.
>> - Add a way to transition from the branch=3DnameX,nameY syntax. From wha=
t
>>    I have tested, I achieve the same behavior when using one or the othe=
r
>>    syntax.
>> - Remove the default value for SPDX_PACKAGE_VERSION in the release note.
>> - Fix a couple of typos.
>>=20
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/migration-guides/migration-5.2.rst     | 10 +++++++++-
>>   documentation/migration-guides/release-notes-5.2.rst |  7 ++-----
>>   2 files changed, 11 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/documentation/migration-guides/migration-5.2.rst b/document=
ation/migration-guides/migration-5.2.rst
>> index c54f054c7..59f21ff4c 100644
>> --- a/documentation/migration-guides/migration-5.2.rst
>> +++ b/documentation/migration-guides/migration-5.2.rst
>> @@ -193,6 +193,14 @@ anymore::
>>   This was rarely used in the core repositories, and this removal simpli=
fies the
>>   code logic in several places.
>>  =20
>> +If one of your recipes is still using this mechanism, you can split the
>> +code source fetching into two separate entries::
>> +
>> +   SRC_URI =3D "git://some.host/somepath;branch=3DbranchX;name=3DnameX =
\
>> +              git://some.host/somepath;branch=3DbranchY;name=3DnameY"
>> +   SRCREV_nameX =3D "xxxxxxxxxxxxxxxxxxxx"
>> +   SRCREV_nameY =3D "yyyyyyyyyyyyyyyyyyyy"
>> +
>>   Git fetcher: Branch parameter now required in :term:`SRC_URI`
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>  =20
>> @@ -242,7 +250,7 @@ The following recipes have been removed in this rele=
ase:
>>      :oe_git:`openembedded-core </openembedded-core>` or :oe_git:`meta-o=
penembedded </meta-openembedded>`.
>>  =20
>>   -  ``blktool``: It was created in 2004 as an alternative to hdparm and=
 never
>> -   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active.
>> +   updated since (while :wikipedia:`hdparm <Hdparm>` remains in active)=
.
>
> Mmmm, should we say
>
> s/remains in active/remains active/ ?
>
> Slow brain day so maybe my intuition is wrong today :)

No, the slowness seems to have been on my side the other day, thanks ;) Wil=
l fix.

>>  =20
>>   -  ``cargo-c-native``: converted to a target recipe and renamed to ``c=
argo-c``.
>>  =20
>> diff --git a/documentation/migration-guides/release-notes-5.2.rst b/docu=
mentation/migration-guides/release-notes-5.2.rst
>> index 05fc92e85..2ad441449 100644
>> --- a/documentation/migration-guides/release-notes-5.2.rst
>> +++ b/documentation/migration-guides/release-notes-5.2.rst
>> @@ -44,11 +44,10 @@ New Features / Enhancements in |yocto-ver|
>>         uses.
>>  =20
>>      -  The :term:`GRUB_MKIMAGE_OPTS` can be used to control the flags t=
o the
>> -      ``grub-mkimage`` command in the context of the Grub recipe (``gru=
b-efi``).
>> +      ``grub-mkimage`` command in the context of the GRUB recipe (``gru=
b-efi``).
>>  =20
>>      -  The :term:`SPDX_PACKAGE_VERSION` variable controls the package v=
ersion as
>> -      seen in the SPDX 3.0 JSON output (``software_packageVersion``). T=
he default
>> -      value for this variable is :term:`PV`.
>> +      seen in the SPDX 3.0 JSON output (``software_packageVersion``).
>
> The indentation seems odd here (but to be fair, it is also in the part=20
> of the diff that is being removed).

Hmm, already on the previous patches you noticed this I think, but after
verifying in the code, the alignment was proper. Actually, I may have alrea=
dy
seen this in your answers before, I wonder if the problem is on my side or
yours. Exporting the email in an mbox file does not show any issue as well.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

