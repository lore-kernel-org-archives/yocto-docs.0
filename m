Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF05EC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:01:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.54422.1743433264585088560
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FdxmPnxK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F95344422;
	Mon, 31 Mar 2025 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nirijKf3LnHC17+HuvJCVIkwwN78H879QgtqDpM3xtk=;
	b=FdxmPnxKoRhlzYBiCKEppxP8QbAp45CUEntFTjvGmf6MsrfmlXN7qbpDV9tBr/QX0LepD3
	SzvF3Al2nYvC3PUPKHdsqzIu2hIXTIC5iRDHHwat1qRKyh7wApRHdWLFS0jRdnFfQwmL6J
	aPa89ao2iuqlg7mf4Fxh7CnIzIDUDRfPd2QuNtBNzcltVlRzkLPgLTczJmC+dtLCJmNtFU
	rtzQ4AbwZN1QaMVtGVhlsFmChdLkD2vnvkLNo9X7ZcWQo02efILlWselR+z34Btz57frbI
	HYH3q4mcNA+URBego8ojY+MvF0LWLss9fCzGV1NLLsGiKF1YLLQuVz42WDA7Jw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 17:01:01 +0200
Message-Id: <D8UJIFBMDZ1V.2OYD1Z131BP1G@bootlin.com>
Subject: Re: [docs] [PATCH v3 1/6] documentation/conf.py: define a manpage
 url
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>,
 <antonin.godard@bootlin.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-42-g7f7db0373f6c
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
 <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
 <670f3cce-9919-4418-a2c6-e96bc3fbe58f@kernel.crashing.org>
In-Reply-To: <670f3cce-9919-4418-a2c6-e96bc3fbe58f@kernel.crashing.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeeijeejveeffedvtdefieeggeeuvdettddvhfekffdvffeuiedutdegudfhfeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhsphhhihhngidqughotgdrohhrghdpfihikhhiphgvughirgdrohhrghdpuggvsghirghnrdhorhhgpdhhvgdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehmrghrk
 hdrhhgrthhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6685

Hi Mark,

On Thu Mar 27, 2025 at 4:35 PM CET, Mark Hatle wrote:
> I'm going to be a bit pedantic below, I'm not sure it matters at this poi=
nt but=20
> I want to clarify one thing.
>
> On 3/27/25 4:07 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> By defining the manpages_url we can use the :manpage: role in the
>> documentation for providing links to manpages. See:
>> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-ma=
npages_url
>>=20
>> Replace existing manpages links to use this role.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/conf.py                      | 3 +++
>>   documentation/overview-manual/concepts.rst | 2 +-
>>   documentation/overview-manual/yp-intro.rst | 2 +-
>>   documentation/ref-manual/variables.rst     | 4 ++--
>>   4 files changed, 7 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 477e75112a..0352bbef20 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -111,6 +111,9 @@ extlinks =3D {
>>       'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
>>   }
>>  =20
>> +# To able to use :manpage:`<something>` in the docs.
>> +manpages_url =3D 'https://manpages.debian.org/{path}'
>> +
>>   # Intersphinx config to use cross reference with BitBake user manual
>>   intersphinx_mapping =3D {
>>       'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_ver=
sion, None)
>> diff --git a/documentation/overview-manual/concepts.rst b/documentation/=
overview-manual/concepts.rst
>> index e4d806f98f..416c28f0d9 100644
>> --- a/documentation/overview-manual/concepts.rst
>> +++ b/documentation/overview-manual/concepts.rst
>> @@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlie=
r steps ran in a fake
>>   root environment does not cause problems.
>>  =20
>>   The capability to run tasks in a fake root environment is known as
>> -"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
>> +":manpage:`fakeroot <fakeroot(1)>`", which is derived from
>>   the BitBake keyword/variable flag that requests a fake root environmen=
t
>>   for a task.
>>  =20
>> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/=
overview-manual/yp-intro.rst
>> index 4a27e12e01..11e6d99e32 100644
>> --- a/documentation/overview-manual/yp-intro.rst
>> +++ b/documentation/overview-manual/yp-intro.rst
>> @@ -400,7 +400,7 @@ Yocto Project:
>>      Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
>>  =20
>>   -  *Pseudo:* Pseudo is the Yocto Project implementation of
>> -   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
>> +   :manpage:`fakeroot <fakeroot(1)>`, which is used to run
>>      commands in an environment that seemingly has root privileges.
>
>
> psuedo is an implementation of three separate items:
>
> fakeroot
> fakechroot
> fakepasswd (which was never a debian tool or widely used - it emulates=20
> /etc/passwd and /etc/group that do not match the running system)

Thanks for the details. I will try clarifying that later in a separate patc=
h.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

