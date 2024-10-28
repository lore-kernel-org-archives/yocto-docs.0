Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4498AD33982
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 13:54:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.52370.1730123642215543049
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 06:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jmjiG7me;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B22A6E0002;
	Mon, 28 Oct 2024 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730123640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uv28HV3SIZhkIgh6NpEUwc0qKHBkunx8/jXui5VRrSs=;
	b=jmjiG7meLWom3Sd1LeuHbClQLksllYae0WEOLrP18wJ1IGX7LqZGfEuBgXZaYufCeeMcKB
	mTqqYBcQLxXgLiXxOvFmd6Gkw6pPACGXroH/QGR3gxrFlfHbe3vm4Ki038T3tZ8qk9UQd2
	r4LX3HKg0ybAGQ3PQj0FwxhlucPrnV7E8+ag1NFd2E8jMGCoHy8vzRUWFHKdsBV80kFEWN
	o+NMB6vbSQlWMBRgki/EQoo08zkEYT1kmELhsJWVrwlvEbQGOC1QuP+qYJjfbqZhrqDyID
	OnWUPuHQefDV61r472/xFLat2zLJFibsuVh5O2z7rmt/pRkx+vqAPEt2wS7WtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Oct 2024 14:53:59 +0100
Message-Id: <D57HN7HBWZD2.3N3ZUTN2E6EFP@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v3 1/2] ref-manual: release-process: update releases.svg
Cc: "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
 <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
 <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
In-Reply-To: <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 13:54:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5601

Hi Quentin,

On Mon Oct 28, 2024 at 11:40 AM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/23/24 9:32 AM, Antonin Godard wrote:
>> * Add Walnascar release.
>> * Remove dunfell, gatesgarth, hardknott, honister: these release are not
>>    supported anymore. Start from kirkstone, which is still supported.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/svg/releases.svg | 907 ++++++++++++----------=
--------
>>   1 file changed, 346 insertions(+), 561 deletions(-)
>>
>> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/r=
ef-manual/svg/releases.svg
>> index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..b1036e066ceb65a7391cec61=
6cb4304094728f3f 100644
>> --- a/documentation/ref-manual/svg/releases.svg
>> +++ b/documentation/ref-manual/svg/releases.svg
>> @@ -2,11 +2,14 @@
> [...]
>> +    <text
>> +       xml:space=3D"preserve"
>> +       style=3D"font-weight:bold;font-size:13.3333px;line-height:125%;f=
ont-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold'=
;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-o=
pacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoi=
n:miter;stroke-opacity:1"
>> +       x=3D"1659.087"
>> +       y=3D"-3.6722763"
>> +       id=3D"text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
>> +         sodipodi:role=3D"line"
>> +         x=3D"1659.087"
>> +         y=3D"-3.6722763"
>> +         style=3D"font-style:normal;font-variant:normal;font-weight:nor=
mal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-=
inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor=
:middle;fill:#000000;fill-opacity:1;stroke:none"
>> +         id=3D"tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></text>
>
> This is a bit dangerous as "current" keeps its meaning while time
> passes. So building docs from years ago from a tarball will still say
> "current" event though it isn't really supported anymore. The X axis
> showing the dates should be enough for people to get the idea, but maybe
> we can also add the last update date of the SVG after Current? e.g.
> "Current (Oct. 2024)"?

I agree on adding the date after current would timestamp the image and make=
 it
valid for a given date. I like the idea of putting the current releases as =
the
most prominent color, so I guess we can keep "Current" but add the timestam=
p?

> Additionally updating that SVG for all releases might be an issue. If we
> backport it "too far" then the release of the docs will not even be in
> that graph anymore, which is a bit odd. Moreover, the paragraph in the
> LTS section may become outdated as well.

I would have thought that EoL releases would receive a last update that put=
s the
color of that release to the faded color, and then receive no updates to th=
e
diagram anymore.

Is it that bad that reading the doc for an old release shows a outdated
"Current" state? Granted that they also show the timestamp mentioned above.

> A random thought I just had was to maybe treat this the same way we do
> with the migration manuals, that is to take the source from the last
> release/master and inject it into all earlier releases whenever we build
> the docs through the autobuilder. We could still have an outdated
> version if people build it from an old tarball but there's no much we
> can do about that sadly.
>
> What do you think?

I guess that's the ideal solution, and it shouldn't be too hard to add too!
(especially if code already exists for the migration manuals)

I can take a look on that when I have the time.

> Cheers,
> Quentin

Thanks for the insights!
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

