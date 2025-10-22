Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E483CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 21:24:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.6058.1761168294014796353
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 14:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 59MLNlad594886;
	Wed, 22 Oct 2025 16:23:47 -0500
Received: from [192.168.2.99] ([192.168.2.99])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 59MLNkol029024;
	Wed, 22 Oct 2025 16:23:46 -0500
Message-ID: <1c03195e-e70c-4523-900c-b6469f7975a7@kernel.crashing.org>
Date: Wed, 22 Oct 2025 16:23:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
Content-Language: en-US
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, raj.khem@gmail.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca>
 <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com>
 <cae364e5-12b4-e69a-fa62-dfc37d3c2d4b@crashcourse.ca>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <cae364e5-12b4-e69a-fa62-dfc37d3c2d4b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 59MLNlad594886
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 21:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7779



On 10/22/25 4:00 PM, Robert P. J. Day wrote:
> On Wed, 22 Oct 2025, Khem Raj via lists.yoctoproject.org wrote:
>=20
>> On Wed, Oct 22, 2025 at 1:37=E2=80=AFPM Robert P. J. Day via
>> lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.org=
>
>> wrote:
>>>
>>>
>>>    reading here:
>>>
>>> file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/html/ov=
erview-manual/yp-intro.html
>>>
>>> and that page states:
>>>
>>> "commercial Linux vendors such as Wind River, Mentor Graphics,
>>> Timesys, and ENEA could take it and provide ongoing support"
>>>
>>>    well, sure, but there are a *lot* of other sources for support tha=
t
>>> are not listed there that might deserve a mention. perhaps that
>>> sentence should include a link to, perhaps:
>>>
>>>    https://www.yoctoproject.org/about/participants/
>>>
>>> or at least a more all-encompassing list of support providers.
>>
>> I think a link is a good option provided it is kept uptodate.
>=20
>    I'm sure there is a significant difference between "participants"
> and orgs that provide actual support; I'm just saying that the list on
> that page is awfully short and it would be useful to have a separate
> list/link for support providers. How one gets onto that list is a
> whole other issue.

(in the distant past) it was always expected that list would be updated o=
r=20
pointing to another page.  The text that is there is based on the origina=
l=20
membership of the Yocto Project, and I suspect does need to be updated.  =
IMHO=20
members (not participants) should be the ones listed.

The original list was based on OSVs specifically, but this can absolutely=
 be=20
word-smithed to be more generic then just OSVs.

--Mark

> rday
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7778): https://lists.yoctoproject.org/g/docs/messag=
e/7778
> Mute This Topic: https://lists.yoctoproject.org/mt/115899908/3616948
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@ke=
rnel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

