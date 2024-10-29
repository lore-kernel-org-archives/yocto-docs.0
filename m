Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B86D2AB0A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:27:00 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14962.1730194020091243162
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Oct 2024 02:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LF+jco7k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 160BA40007;
	Tue, 29 Oct 2024 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730194018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQHVWkSxMjb81TuEMEMX51hF3hcG4HweADjEYhGasYA=;
	b=LF+jco7kSxAf1xkK6dCCgiAzKNFG+6wuRpSomH6wgPn9h0HW++pTy7ZM3HtwKmV1/KIdK9
	n5b7LFvFfcGbT1mNt0BxUWCYS0dngfoOkypAWcx29hfse92cV6VzTmfb1vM+ImIFj2ZRJZ
	+t+hvjrAevHPbblghB8+htZ8piMIENnua3e+5wVfbUrQqkzQNrt1gSCl1zEIm61zj7fIxb
	opNlHw1D3Z8AFwMzknIISwPbD/GKx5seU2txbdcsjqMU/j7hf93cmEfooqZp4sf4+k+w32
	OTBgr1ff7QmapytBsalOwMxVgJ8uIj1knKEDQFE+wDXDi4peb0u5tkirtTlH6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 10:26:57 +0100
Message-Id: <D586LAX4M493.BOT4E8JLNCWP@bootlin.com>
Subject: Re: [PATCH v3 1/2] ref-manual: release-process: update releases.svg
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
 <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
 <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
 <D57HN7HBWZD2.3N3ZUTN2E6EFP@bootlin.com>
 <5540c8e7-9add-4646-92c4-e3068f5650f3@cherry.de>
In-Reply-To: <5540c8e7-9add-4646-92c4-e3068f5650f3@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Oct 2024 09:27:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5606

Hi Quentin,

On Mon Oct 28, 2024 at 3:33 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/28/24 2:53 PM, Antonin Godard wrote:
>> Hi Quentin,
>>
>> On Mon Oct 28, 2024 at 11:40 AM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 10/23/24 9:32 AM, Antonin Godard wrote:
>>>> * Add Walnascar release.
>>>> * Remove dunfell, gatesgarth, hardknott, honister: these release are n=
ot
>>>>     supported anymore. Start from kirkstone, which is still supported.
>>>>
>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>> ---
>>>>    documentation/ref-manual/svg/releases.svg | 907 ++++++++++++-------=
-----------
>>>>    1 file changed, 346 insertions(+), 561 deletions(-)
>>>>
>>>> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation=
/ref-manual/svg/releases.svg
>>>> index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..b1036e066ceb65a7391cec=
616cb4304094728f3f 100644
>>>> --- a/documentation/ref-manual/svg/releases.svg
>>>> +++ b/documentation/ref-manual/svg/releases.svg
>>>> @@ -2,11 +2,14 @@
>>> [...]
>>>> +    <text
>>>> +       xml:space=3D"preserve"
>>>> +       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%=
;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bol=
d';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill=
-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linej=
oin:miter;stroke-opacity:1"
>>>> +       x=3D"1659.087"
>>>> +       y=3D"-3.6722763"
>>>> +       id=3D"text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
>>>> +         sodipodi:role=3D"line"
>>>> +         x=3D"1659.087"
>>>> +         y=3D"-3.6722763"
>>>> +         style=3D"font-style:normal;font-variant:normal;font-weight:n=
ormal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans'=
;-inkscape-font-specification:'Liberation Sans';text-align:center;text-anch=
or:middle;fill:#000000;fill-opacity:1;stroke:none"
>>>> +         id=3D"tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></tex=
t>
>>>
>>> This is a bit dangerous as "current" keeps its meaning while time
>>> passes. So building docs from years ago from a tarball will still say
>>> "current" event though it isn't really supported anymore. The X axis
>>> showing the dates should be enough for people to get the idea, but mayb=
e
>>> we can also add the last update date of the SVG after Current? e.g.
>>> "Current (Oct. 2024)"?
>>
>> I agree on adding the date after current would timestamp the image and m=
ake it
>> valid for a given date. I like the idea of putting the current releases =
as the
>> most prominent color, so I guess we can keep "Current" but add the times=
tamp?
>>
>
> That's an option, yes.
>
>>> Additionally updating that SVG for all releases might be an issue. If w=
e
>>> backport it "too far" then the release of the docs will not even be in
>>> that graph anymore, which is a bit odd. Moreover, the paragraph in the
>>> LTS section may become outdated as well.
>>
>> I would have thought that EoL releases would receive a last update that =
puts the
>> color of that release to the faded color, and then receive no updates to=
 the
>> diagram anymore.
>>
>
> You would still have more recent releases in the graph, even though at
> some point those also wouldn't be supported anymore.
>
>> Is it that bad that reading the doc for an old release shows a outdated
>> "Current" state? Granted that they also show the timestamp mentioned abo=
ve.
>>
>
> I am of the opinion of yes. Imagine a user getting Yocto from a vendor
> and the SVG that shows Current shows their release in there, which could
> have been EoL for a while already. It's not uncommon to have questions
> from people "stuck" on a very old release because of BSP layers from
> vendors which do not care about updating.
>
>>> A random thought I just had was to maybe treat this the same way we do
>>> with the migration manuals, that is to take the source from the last
>>> release/master and inject it into all earlier releases whenever we buil=
d
>>> the docs through the autobuilder. We could still have an outdated
>>> version if people build it from an old tarball but there's no much we
>>> can do about that sadly.
>>>
>>> What do you think?
>>
>> I guess that's the ideal solution, and it shouldn't be too hard to add t=
oo!
>> (especially if code already exists for the migration manuals)
>>
>
> It'll be a bit odd though because people looking at an old release and
> the release won't appear in the graph.

While adding it dynamically to the svg may be too hard (or is it? it is a t=
ext
file after all), we can still refer to the current release using the
`&DISTRO_NAME` syntax, maybe in a sentence above the graph.

> There's no perfect solution that comes to mind right now though. Sooo,
> best effort for now and trying to not confuse people is a good
> compromise I think :)

So perhaps:

- Add a date stamp after "Current".
- Automate the deployment of the svg file, like what's done for the migrati=
on
  manuals.
- Mention the documentation's release above the graph with &DISTRO_NAME.

Is the best we can do?

> Cheers,
> Quentin

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

