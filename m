Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFD7C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 10:37:15 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.85980.1740393432754606088
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 02:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mqenHw/l;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2ED3441FE;
	Mon, 24 Feb 2025 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740393431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSqO4/9vjCk+nip1wuTY9JAm2furTmih8zseH6BG+xM=;
	b=mqenHw/lvmjQDvwewu9nC2B3jiVDtn3BUZw0QobSH3tFfh59UHcA//f9Ic3K6Z8tUEF6Cz
	AH5sfw+uSnueTTNUpoBffhWOWMPZahbeKCB+ojBaHbE4kp9g9DipRRPof//xwM+1L8Ju2b
	uNviHy1Y0HUGXdauKOQjjbivRAmCd8YKI8mEAMSRCEA12efckvOKcyKdVqHFhUpydYPGiv
	zkDPELzCuKit+mdiX5gztMaVfNjjzds9cBYy/xdupyyH1Qwh9U09KFfCumfqb/DI69M6F8
	nje8PD/emqKLIvbijioLCnkpNXAVTYnhWTHqX0itm3G5q/ETBD/N0KtIUdcnUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 11:37:10 +0100
Message-Id: <D80LZCBAIW4S.1NEGX4Z5BGFPG@bootlin.com>
Subject: Re: [docs] [PATCH 3/6] overview-manual: convert
 configuration-compile-autoreconf.png to svg
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-3-75d23b5e7a88@bootlin.com>
 <b78094a9-4994-4f7d-a6c4-beca36cf652e@cherry.de>
 <D80KBPWTCLPO.235WHNG2ZFZO0@bootlin.com>
 <4fc256cb-9ecb-4f75-8f11-72ee88fa517d@cherry.de>
In-Reply-To: <4fc256cb-9ecb-4f75-8f11-72ee88fa517d@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedvueetgeektefgjedthfffhfejudfhtedugeffvdetjeehffeiteduhfehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhoj
 hgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 10:37:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6437

Hi Quentin,

On Mon Feb 24, 2025 at 11:26 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/24/25 10:19 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Thu Feb 20, 2025 at 5:13 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 2/18/25 10:11 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Convert the png file to an SVG file, and add the UNPACKDIR reference.
>>>>
>>>
>>> The arrows for the build directory are misaligned, especially for the
>>> machine-specific package.
>>=20
>> Yes, I noticed afterwards too. There were some font issues, rsvg-convert=
 was not
>> properly picking them up. And also having so many arrows require precisi=
on that
>> is not taken into account when converting from SVGs to PNGs.
>>=20
>> In the end, I think having the different arrows as text (for the rightmo=
st part)
>> is much better and will always meet the alignment no matter what the fon=
t is.
>> E.g:
>>=20
>>    ${PV} -------- WORKDIR
>>=20
>
> Maybe
>
> ${PV} <------- WORKDIR
>
> ?

Yes, that sounds good.

>
>> So now the output is this:
>> https://lufi.bootlin.com/r/EuK0sscTNP#uV4rb2CQCPCMXONMGiBTfR9PY8BTDm0g0x=
eIAI+AsH8=3D
>>=20
>> What do you think?
>>=20
>
> I do not see much of a difference with "real" arrows, so that's fine by=
=20
> me :)
>
>>> I'm also a bit skeptical about the position of the star before
>>> EXTRA_OECONF, it feels like it's somehow part of the variable name.
>>> Maybe add a space or make the star appear a bit higher (like in the
>>> current PNG?).
>>=20
>> I will adjust that.
>>=20
>>> A remark for the original content as well, but I don't really understan=
d
>>> why B isn't passed to do_configure and do_install as well? Isn't it
>>> where build artifacts will be configured before do_compile runs and fro=
m
>>> where do_install will run in order to install files into $D?
>>>
>>> do_configure[dirs] =3D "${B}"
>>> do_install[dirs] =3D "${B}"
>>>
>>> in base.bbclass for example.
>>>
>>> I'm wondering also if we shouldn't have a bidirectional arrow for B for
>>> the configure and compile task as they are run from there, i.e. they
>>> generate files in there as well?
>>=20
>> I agree, B is used in all three.
>>=20
>> For do_install, I guess a unidirectional arrow would make more sense as =
D is
>> already used to point towards the other way.
>>=20
>
> Unidirectional D arrow makes sense to me as there's nothing D before=20
> do_install I think?

Yes that's what I meant, I think the current figure looks good. Just missin=
g B
in the other way. Sorry if that wasn't clear.

> Now to come to think of it, I'm not sure there's anything in B before=20
> do_configure? So should we have unidirectional for do_configure and=20
> bidirectional for do_compile?

True I also agree.

Thanks for your feedback, appreciate it :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

