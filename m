Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430E6EB363E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 15:04:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20542.1772550252018977880
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 07:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LsX2RsnW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DEBD1A2338
	for <docs@lists.yoctoproject.org>; Tue,  3 Mar 2026 15:04:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E60E05FF29;
	Tue,  3 Mar 2026 15:04:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A800110368F4D;
	Tue,  3 Mar 2026 16:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772550249; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4EWfiRwxfpdXIfSy2OyfNE0LR4PQNHdFNdp6B/DDOU8=;
	b=LsX2RsnWp6isIcr5f4gPUXNt3S5YmZy0lZxBjgt7/HCcpM0yqspFrWsRdoP2z4SPEq8x8G
	/ICWDUgfPGEp2xeyYDcexOIbnopOW9HgrwiReDWKNarALGA4K6nFDhyVMKphlwt1pqo0sA
	B4qCCMn+6pObMONnrFr7fNKHCniG/X3YYFuItMX7kLOskPXVkIpk6Fwib95auZ5G0GFkub
	M1xrJZPE2AN+9jsLYWjcF4AIJFAUOrSsQFyYbkzuM2HryDhM/FtqItY9fbUnBIlLn30Nl3
	kddBhrrig6liM+YLyyMG2YHZ4nzxnnqIQxxQodh2yIovRSJnURln/jp+jPrNMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:04:08 +0100
Message-Id: <DGT8MEGLW8P6.3TETSMEDUEIMD@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/3] tools/fetch-releases-json: add to fetch
 and format releases.json
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
 <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
 <38678bef-ba8f-4181-85f4-c367c3f6dc29@cherry.de>
 <DGT6A4L263BU.ODVFK33QLCYV@bootlin.com>
 <531ad3a1-0eb4-414a-a389-e8b7da698ba5@cherry.de>
In-Reply-To: <531ad3a1-0eb4-414a-a389-e8b7da698ba5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 15:04:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9053

Hi,

On Tue Mar 3, 2026 at 3:48 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 3/3/26 2:14 PM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Fri Feb 27, 2026 at 11:26 AM CET, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>>> Hi Antonin,
>>>
>>> On 2/26/26 3:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Add a simple script that can be used to fetch and format the
>>>> releases.json file from https://dashboard.yoctoproject.org/releases.js=
on.
>>>>
>>>
>>> OK but why do we want this in the tree? It'll still be regularly outdat=
ed.
>>>
>>> I understand not wanting to rely on a network connection, but we alread=
y
>>> need that for the bitbake's object.inv we download... so this ain't tha=
t
>>> much different.
>>=20
>> You're right, I forgot about that inventory file :( made this change wit=
h an
>> offline build in mind.
>>=20
>> Fetching the file when building seems like a proper solution, although:
>>=20
>> - IMO, we need to fallback on fixed values, even if they're outdated, to=
 not
>>    block a documentation build if we can't fetch the releases.json file
>>=20
>
> Makes sense. I actually thought about this a few days ago and I was=20
> wondering if we shouldn't simply have a single version as fallback...=20
> The current one. There's no reason to show multiple versions in the=20
> switcher (and elsewhere?) when there's only one built locally?
>
> So maybe still generate the file from git and not even attempt to=20
> download releases.json?

Actually, we can simply have some default values for the following variable=
s:

activereleases =3D ["whinlatter", "scarthgap", "kirkstone"]
devbranch =3D "wrynose"
ltsseries =3D ["wrynose", "scarthgap", "kirkstone"]
release_series =3D collections.OrderedDict({
    "wrynose": "6.0",
    "whinlatter": "5.3",
    "scarthgap": "5.0",
    "kirkstone": "4.0",
})

And fallback on them when we don't find a releases.json file locally and we
aren't able to fetch it remotely. This should happen rarely, but I've added=
 a
warning if that happens (working on it right now).

I'd rather keep the switchers version as it is, even in this case where we =
build
locally and we only have one version to display. Just so it sort of matches=
 what
we're supposed to get from a releases.json file. I believe there are
implications in how we compute the values in poky.yaml.in, which rely on th=
is,
so I'd rather not over-complicate it and provide default values in case we =
can't
find a releases.json file, which should happen rarely anyway.

>> - on the Autobuilder, we need to do the opposite: block a build if we ca=
n't
>>    fetch the releases.json file
>>=20
>> - avoid fetching the file again if we already did (especially important =
on the
>>    Autobuilder as we don't want the file to be fetched for every tag + w=
e don't
>>    want it to change during a build)
>>=20
>
> Wondering if we can't simply handle releases.json downloading=20
> externally. I think we should still have whatever handles releases.json=
=20
> in the git repo(s) (but maybe not?) but we can simply put releases.json=
=20
> somewhere the script in the repo expects one to be present.
>
> Essentially... if there's a releases.json available at location X, you=20
> use it, if not, then you use the fallback of the current version. The=20
> git repo wouldn't have a releases.json, only the autobuilder downloads=20
> it once before building all docs.

> I guess the main issue is that we wouldn't know whether the current=20
> version is EoL if you don't download releases.json? Is it important?=20
> (thinking about people building the docs locally such that their=20
> colleagues only look at the documentation for the version they actually=
=20
> use).

Not sure I follow exactly, but I'm working on the Autobuilder part too whic=
h
generates this releases.json on the fly and uses it for each docs build. I =
hope
that will answer most of your questions here.

I think we still want to fetch the releases.json file in yocto-docs though,=
 to
give the user building locally an accurate version of what is hosted on
docs.yoctoproject.org (and it doesn't cost much). And anyway, as you remind=
ed,
if a user cannot fetch the releases.json file from the remote location, the=
y'll
fallback on some possibly outdated active releases array (the default value=
s
above), but they'll also have a wall of errors due to lack of bitbake inven=
tory.

Antonin

