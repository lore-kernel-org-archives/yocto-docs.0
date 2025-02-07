Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9D8C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 11:21:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.67249.1738927277108518540
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 03:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z75W1RcA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86C5143155;
	Fri,  7 Feb 2025 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738927274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9Ym8tAIO2icvgbCMrcPaM4pTT/oTlyEmZZFXcZNmu8=;
	b=Z75W1RcAPl0Zkecr9PmGW9eMr/w/J+eROuGnWkoH/hAqtR9xGIBAV7KZZMhD8iFCX/RAW0
	mYKPX2FYlApCpXKNs1/JuE7qqN3OgAWZxNyMgBrarqKEt8z5Lt11qzecvKfHGEAoWbVpMD
	Flqu2ZuVM1L9MZYaaSXb0+pBE4Jc77UKePAHIl2YlqmJCzG3jSpn6xQK4qCFiaAOdIndjB
	VgdgPlEk6yqjzHbVYcgjxEUOnxKmCL+ORQlk/8/eLPy8jn3ORfW9diJ2bf+DAWp0notYa2
	+gYWCnlOEJ/pSOxbRE3OwfyDeWbfgXceJSlFJiKNHqCbP3uBcLS5WhS+dcbraQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 12:21:14 +0100
Message-Id: <D7M69TH319AM.QRQACZ44XTFN@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Quentin Schulz" <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
 <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
 <f404f281-6a3e-442d-b2f8-ca29940d0c3c@cherry.de>
In-Reply-To: <f404f281-6a3e-442d-b2f8-ca29940d0c3c@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejueekvdehvdeuvefgfedugfevvdekffeuleelgeetjeeffeevkeelledtudegheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghdpsgegqdifrhgrphhpvghrqdhpohhkhidrphihpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegth
 hgvrhhrhidruggvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepfhhoshhssedtlhgvihhlrdhnvghtpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 11:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6295

Hi Quentin,

On Fri Feb 7, 2025 at 11:48 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/7/25 11:28 AM, Antonin Godard wrote:
>> On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
>>> On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
>>> lists.yoctoproject.org wrote:
>>>> At the same time, I've done some shady stuff with b4 for poky where I
>>>> check (rather **guess**) if the current patch is the last patch in a
>>>> series. c.f.
>>>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper=
-poky.py#n44
>>>>
>>>>> In any case we might also use your container scripts for this
>>>>> (which I will get
>>>>> to soon hopefully!).
>>>>>
>>>>
>>>> That itself may be adding a lot of time to the test since we need to
>>>> compile the container first. Additionally, remember that absolutely
>>>> NO
>>>> message should be output to stdout or stderr by the script otherwise
>>>> the
>>>> check is understood as a fail. I'm wondering if we couldn't add
>>>> support
>>>> for a PIPE between b4 and the scripts so that we can ask it to print
>>>> stuff (e.g. "please be patient, this may take a while" and maybe even
>>>> print some progress). For example, I briefly added some WIP support
>>>> for
>>>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time
>>>> before returning something, not very user-friendly :/
>>>
>>> My view is that any preflight checks should be relatively fast. We
>>> could ask someone setup an autobuilder in a container and run the whole
>>> AB test matrix but that would be unfair and crazy! :)
>>>
>>> I'm fine with having two levels of checks but I do think we need
>>> something relatively quick by default else nobody will use it.
>>=20
>> After a clean build, for me it takes ~10 to 15 seconds to build the docu=
mentation
>> in html format. Most of the time is taken to index everything, so the ou=
tput
>> format doesn't really matter.
>>=20
>> So, quite a long build from my perspective. Not sure there's much we can=
 do
>> about it, though.
>>=20
>
> Also, on which PC are you building that? Some people may compile on much=
=20
> less powerful PCs for example.

You're right, I'd say I have a quite powerful PC, so I would imagine that n=
umber
could be at least doubled on a slow computer.

I think in the case where Sphinx isn't installed the script could point tow=
ards
instructions on how to install.
On top of that, the script could also print something like: "if you don't w=
ant
to run preflight checks, set 'prep-pre-flight-checks' to include
'disable-needs-checking' locally with <command/instruction>".

And so, with these two messages here, a user which sends a contribution and=
 who
didn't compile the docs at all can choose to either take the time to do so,=
 or
ignore and send the patch. What do you think?

>> We do have sphinx-lint, which takes ~half a second for variables.rst (li=
kely the
>> biggest file here). So we could perhaps run that against each file the p=
atch
>> series modifies (per-commit).
>
> Any time you add linters, you take the risk of false positives. For=20
> public CI (e.g. GitLab CI), it is "fine" because you can tell people to=
=20
> ignore it. When run locally, that's a different story.
>
> Finally, sphinx-lint only supports Python 3.8+ (and even dropped support=
=20
> for 3.8 in the main branch), we still want to build on Python=20
> 3.6-systems, so that makes it an unlikely tool to use for us for the=20
> time being.

Fair points!

>> We would have to solve the existing issues, though! :)
>> There are also areas of improvements for this linter, for example enforc=
ing
>> three spaces for indents, etc. I'm willing to put some time into it, if =
that's
>> an option we consider for b4 checking.
>>
>
> Should we really be holding off b4 support for this?
>
> We already cannot enforce requirements on running anything before
> sending patches with git send-email, supporting b4 doesn't need to be
> better from that side from the start, we can just start by supporting a
> different contribution workflow and build on that if and when desired.

No, I think b4 support can be added without the pre-checks, of course.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

