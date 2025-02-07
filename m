Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D80C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 15:13:53 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.71623.1738941231426890706
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 07:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zjw/UBwu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B55143308;
	Fri,  7 Feb 2025 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738941229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hWHHXlYcKkF43n5OILNpUBOhzus/A0IWF3yMgiU1Uqs=;
	b=Zjw/UBwu97EPcqTW8mLKbj+Wi2a+vCVPWyR/sADZo283QNeCZa2kSG2P/ISub9Sj7uffye
	l0BrLNRK0Vz0SHtIAFeKpdB16M8Kx88oRNM3Kx847tIsjPgkAM7aclK2ML0WrYzQ6iTLd4
	ayRiPJIFP2EIkT/PR3HabWik+DumsVTEGA6icB6FBBOzX4jN04mh7xw3ksWqBIoQEV6G9D
	14fUX7qmkJRqtvBkUP6v3vV5wFGePeiImQPdBGTuS1ojUuJtBMPH1WcNVa3PzFILH050NC
	Bp6L7KR015krzYm8BaWvIcTWu65Zjx6ypJHfX6BPbHvv3P6QD1YXJXJuWW0siA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 16:13:48 +0100
Message-Id: <D7MB7W6Z9TY9.2RE95OPANJY1D@bootlin.com>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Quentin Schulz" <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
 <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
 <D7M55FM70177.BPEH6BEQMQOU@bootlin.com>
 <f404f281-6a3e-442d-b2f8-ca29940d0c3c@cherry.de>
 <D7M69TH319AM.QRQACZ44XTFN@bootlin.com>
 <6d6e092b-4f28-43b2-82b4-2e17edcab003@cherry.de>
In-Reply-To: <6d6e092b-4f28-43b2-82b4-2e17edcab003@cherry.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfeludekkeehgeekfeegtdekkedugeeijedvieejgfetteegfefhtdeivdfhgfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvugdrohhrghdpsgegqdifrhgrphhpvghrqdhpohhkhidrphihpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegth
 hgvrhhrhidruggvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepfhhoshhssedtlhgvihhlrdhnvghtpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 15:13:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6298

Hi Quentin,

On Fri Feb 7, 2025 at 12:35 PM CET, Quentin Schulz wrote:
> On 2/7/25 12:21 PM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Fri Feb 7, 2025 at 11:48 AM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 2/7/25 11:28 AM, Antonin Godard wrote:
>>>> On Fri Feb 7, 2025 at 10:53 AM CET, Richard Purdie wrote:
>>>>> On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
>>>>> lists.yoctoproject.org wrote:
>>>>>> At the same time, I've done some shady stuff with b4 for poky where =
I
>>>>>> check (rather **guess**) if the current patch is the last patch in a
>>>>>> series. c.f.
>>>>>> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapp=
er-poky.py#n44
>>>>>>
>>>>>>> In any case we might also use your container scripts for this
>>>>>>> (which I will get
>>>>>>> to soon hopefully!).
>>>>>>>
>>>>>>
>>>>>> That itself may be adding a lot of time to the test since we need to
>>>>>> compile the container first. Additionally, remember that absolutely
>>>>>> NO
>>>>>> message should be output to stdout or stderr by the script otherwise
>>>>>> the
>>>>>> check is understood as a fail. I'm wondering if we couldn't add
>>>>>> support
>>>>>> for a PIPE between b4 and the scripts so that we can ask it to print
>>>>>> stuff (e.g. "please be patient, this may take a while" and maybe eve=
n
>>>>>> print some progress). For example, I briefly added some WIP support
>>>>>> for
>>>>>> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time
>>>>>> before returning something, not very user-friendly :/
>>>>>
>>>>> My view is that any preflight checks should be relatively fast. We
>>>>> could ask someone setup an autobuilder in a container and run the who=
le
>>>>> AB test matrix but that would be unfair and crazy! :)
>>>>>
>>>>> I'm fine with having two levels of checks but I do think we need
>>>>> something relatively quick by default else nobody will use it.
>>>>
>>>> After a clean build, for me it takes ~10 to 15 seconds to build the do=
cumentation
>>>> in html format. Most of the time is taken to index everything, so the =
output
>>>> format doesn't really matter.
>>>>
>>>> So, quite a long build from my perspective. Not sure there's much we c=
an do
>>>> about it, though.
>>>>
>>>
>>> Also, on which PC are you building that? Some people may compile on muc=
h
>>> less powerful PCs for example.
>>=20
>> You're right, I'd say I have a quite powerful PC, so I would imagine tha=
t number
>> could be at least doubled on a slow computer.
>>=20
>> I think in the case where Sphinx isn't installed the script could point =
towards
>> instructions on how to install.
>
> We'd need more than just Sphinx to be safe, but then we'd need to=20
> maintain this list of Python packages somehow and test their imports.=20
> Same for external dependencies (librsvg and the likes).
>
>> On top of that, the script could also print something like: "if you don'=
t want
>> to run preflight checks, set 'prep-pre-flight-checks' to include
>> 'disable-needs-checking' locally with <command/instruction>".
>>=20
>
> I would advise against it, I don't think it makes a lot of sense to=20
> modify the .b4-config in the repo especially since b4 will refuse=20
> sending patches if your local git is dirty. They can simply ignore the=20
> "you didn't run b4 prep --check" message if they want to. This is how it=
=20
> looks when you have a prep-perpatch-check-cmd but haven't run it yet:
>
> $ b4 send --no-sign
> Converted the branch to 3 messages
> ---
> Some pre-flight checks are failing:
>    - Run local checks : b4 prep --check
> ---
> Press Enter to ignore and send anyway or Ctrl-C to abort and fix

Ah ok, yes, this is enough I guess.

>> And so, with these two messages here, a user which sends a contribution =
and who
>> didn't compile the docs at all can choose to either take the time to do =
so, or
>> ignore and send the patch. What do you think?
>>=20
>
> We could document properly in the docs contribution section and/or in=20
> the git repo README what the expectations are wrt running the checks?

Yes, I think we can document it. The contributor guide sound like a good op=
tion
to me.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

