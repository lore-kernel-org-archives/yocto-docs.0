Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2742CC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 21:37:55 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.5142.1739828265807031293
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 13:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 51HLbigN004614
	for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 15:37:44 -0600
Received: from [192.168.2.40] ([192.168.2.40])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 51HLbhSR021848
	for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 15:37:44 -0600
Message-ID: <4a3d8dbb-e8f7-43af-a61b-c8b6edbc635e@kernel.crashing.org>
Date: Mon, 17 Feb 2025 15:37:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] qemuboot.conf variables
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <05e07903-df94-4282-ab62-77ad6e372caa@kernel.crashing.org>
 <7cc39a0b-9a11-4716-97a4-985bdc885b0e@cherry.de>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <7cc39a0b-9a11-4716-97a4-985bdc885b0e@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 51HLbigN004614
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 21:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6405



On 2/17/25 6:04 AM, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Mark,
>=20
> On 2/14/25 4:50 PM, Mark Hatle via lists.yoctoproject.org wrote:
>> When I was looking through the large docs, I didn't see anything insid=
e
>> of it to explain the various variables used in the qemuboot.conf file.
>>
>> Looking through the code, I found the stuff mostly in the class that
>> creates the file, but there were also fragments of explanation in prio=
r
>> commit messages and other places.=C2=A0 Below is my attempt to collect=
 all of
>> the qemuboot.conf variables in one place, along with an explanation.=C2=
=A0 I
>> think this would be useful to add to the regular docs, but I'm not
>> exactly sure where or what format.
>>
>=20
> We do have a QEMU-specific document so that could be a start though we
> don't have a glossary in there so we wouldn't be able to :term:`QB_DTB`
> for example elsewhere in the docs.
>=20
> Another option is to have them all in the variables glossary with other
> variables. They may be a bit too machine-specific to be there, but mayb=
e
> that's fine. In short, I don't know either what would be best. We could
> start with documentation/dev-manual/qemu.rst in any case.

I think a qemu specific document or section would be my suggested.  There=
 is a=20
lot of stuff about runqemu that is documented in the code or in random pl=
aces=20
and it would be nice to move it all to one place.

>> There are some other things related to runqemu usage that would be nic=
e
>> to document as well (command line usage, environment variable, command
>=20
> We do have a section on the command line options for runqemu, are you
> thinking about something different?

This is only a small part.  There are environment variables and how they =
are=20
used, substitutions such as @PORT@ and others that are applied to certain=
 parts=20
of the configuration, etc.  Each of these really should be documented.

>> substitution behavior and generated command line rules), but the items
>> below are the ones that I had to search for when I was trying to expla=
in
>> the qemuboot.conf to someone else.
>>
>=20
> Thanks for sharing the info with us, looking forward to having patches
> on the mailing list :)
>=20
> Cheers,
> Quentin
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6382): https://lists.yoctoproject.org/g/docs/messag=
e/6382
> Mute This Topic: https://lists.yoctoproject.org/mt/111184281/3616948
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@ke=
rnel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

