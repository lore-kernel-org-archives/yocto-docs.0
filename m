Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E53C0219B
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:36:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.65702.1738920952974196434
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kMGXWNMK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBBB74427C;
	Fri,  7 Feb 2025 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738920951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOshyGbJHOUaTS9nxet7puGOdwU+CQDHI1pTX+srzjo=;
	b=kMGXWNMKmWmTF2dqgfrdcCqji3jJcGqAVksoHtL6G/KQM/gOryJxI4ceJ+pJYabuRiEElv
	V+AYpgTtYHzREFWkKnAHC8XLQa3HsgwiSHRh+oZENL+S6vxJyKfb+czecuJdfZRwowfXg9
	A7vMJ8oedVSmXswBjokZ8YM+l51oVnwvUJ+sK/ayyx2+d5EB+1243I6AF/4dIuO3oCzP3X
	K9cmIIOAL97Pwn5H7VqjoVpFexofUPDu5Notjac8vKqS8s0vxLiSE+TnCKNUWgMvXKVibf
	4dyIDE2aEowSWPXAWfgmAJRkz3i//F5fKCttFxYWyx/qJZ+jyRuRtAHlhv2b9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 10:35:50 +0100
Message-Id: <D7M414DI5EPE.22H0A4EO3Q0M@bootlin.com>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
In-Reply-To: <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheevveekledtfedtkeegtdehiedvieffleeffeevtedvuefhveeiudeuvdelfeenucffohhmrghinhepphihphhirdhorhhgpdhkvghrnhgvlhdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgpdgsgedqfihrrghpphgvrhdqphhokhihrdhphidpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhli
 iestghhvghrrhihrdguvgdprhgtphhtthhopehfohhsshestdhlvghilhdrnhgvthdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:36:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6287

Hi Quentin,

On Fri Feb 7, 2025 at 10:26 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/7/25 10:09 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Wed Feb 5, 2025 at 3:02 PM CET, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> b4[1] is a very nice tool for mail-based contribution. A config[2] file
>>> exists to set up a few defaults. We can use it to set the To recipients
>>> to always add, in our case the mailing list.
>>>
>>> Because we do not have anything to check for now, disable needs-checkin=
g
>>> so patches can be sent without running b4 prep --check.
>>>
>>> Because we do not have any auto-to-cc support (and the implicit one
>>> using scripts/get_maintainer.pl cannot work for us), also disable
>>> needs-auto-to-cc so patches can be sent without running b4 prep
>>> --auto-to-cc.
>>>
>>> [1] https://pypi.org/project/b4/
>>> [2] https://b4.docs.kernel.org/en/latest/config.html
>>>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>> I'm wondering if we couldn't add some per-patch check as well, checking
>>> that the documentation builds for each for example. Could be added in a
>>> later patch though. Any idea?
>>=20
>> I think this is a good idea although I think it would make more sense to=
 build
>> the tip commit only, as doc builds are a bit long? Don't know if this is
>
> Ideally individual patches shouldn't break builds so that bisectability=
=20
> is guaranteed.
>
> At the same time, prep-perpatch-check-cmd currently runs sequentially=20
> and Sphinx caches stuff between builds... so probably the first run=20
> would be the longest and subsequent ones would benefit from the cache=20
> (if we reuse the build output from previous patches).
>
>> possible with b4, though.
>>=20
>
> Not yet, see=20
> https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/src/b4/ez.py#n1683
>
> Konstantin is typically the only one really working on that, so I'm sure=
=20
> he would appreciate some patches :)
>
> At the same time, I've done some shady stuff with b4 for poky where I=20
> check (rather **guess**) if the current patch is the last patch in a=20
> series. c.f.=20
> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-po=
ky.py#n44
>
>> In any case we might also use your container scripts for this (which I w=
ill get
>> to soon hopefully!).
>>=20
>
> That itself may be adding a lot of time to the test since we need to=20
> compile the container first. Additionally, remember that absolutely NO=20
> message should be output to stdout or stderr by the script otherwise the=
=20
> check is understood as a fail. I'm wondering if we couldn't add support=
=20
> for a PIPE between b4 and the scripts so that we can ask it to print=20
> stuff (e.g. "please be patient, this may take a while" and maybe even=20
> print some progress). For example, I briefly added some WIP support for=
=20
> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time=20
> before returning something, not very user-friendly :/

Ok, all of that sounds like we could already have a first version of this
scripts that just builds the doc locally (no container), commit-per-commit.

Also, is there an option to opt out of this easily? I wouldn't want to
discourage people to contribute because they are unable to setup the docs b=
uild,
if you see what I mean (even though I really encourage them to do so, this =
saves
me time).

Random idea, but the script could read an env variable that switches to a
container build rather than a local build. So the default behavior is build=
 to
build locally but we could always opt out of it. In any case, I would appre=
ciate
a first version of the script that just does the build locally.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

