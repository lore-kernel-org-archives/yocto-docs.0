Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B17C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 18:26:02 +0000 (UTC)
Received: from www1.webmail.pair.com (www1.webmail.pair.com [209.68.6.94])
 by mx.groups.io with SMTP id smtpd.web10.13892.1698863152656193134
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 11:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.6.94, mailfrom: bluelightning@bluelightning.org)
Received: from rc.webmail.pair.com (localhost [127.0.0.1])
	by www1.webmail.pair.com (Postfix) with ESMTP id 6A45F1A0C7A;
	Wed,  1 Nov 2023 14:25:51 -0400 (EDT)
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 07:25:51 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org, ross.burton@arm.com
Subject: Re: [docs] [PATCH] migration-guides: updates for 4.3
In-Reply-To: <3e5aa494-8541-40b3-b2b9-bc6dc8074b24@bootlin.com>
References: <1791F57D905EEBD5.3183@lists.yoctoproject.org>
 <e3ad6981-b0cb-4d91-9ee6-c9b4df114bff@bootlin.com>
 <3e5aa494-8541-40b3-b2b9-bc6dc8074b24@bootlin.com>
Message-ID: <b2673a860aeb1e6e3d8bbc5a7fb3457b@bluelightning.org>
X-Sender: bluelightning@bluelightning.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
X-Scanned-By: mailmunge 3.09 on 209.68.6.94
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Nov 2023 18:26:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4561

Hi Michael

I see Ross just sent release notes changes, sorry I guess I kept you=20
waiting too long :( I had done a bunch of work already, but I'll use=20
what I have to check Ross's content and send any delta on top of that.

Paul

On 28.10.2023 04:50, Michael Opdenacker via lists.yoctoproject.org=20
wrote:
> Hi Paul,
>=20
> On 27.10.23 at 14:10, Michael Opdenacker wrote:
>>=20
>> On 27.10.23 at 14:07, Michael Opdenacker via lists.yoctoproject.org=20
>> wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>=20
>>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>> CC: Paul Eggleton <bluelightning@bluelightning.org>
>>> ---
>>> =C2=A0 .../migration-guides/migration-4.3.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++
>>> =C2=A0 .../migration-guides/release-notes-4.3.rst=C2=A0=C2=A0=C2=A0 |=
 30=20
>>> +++++++++++++++++--
>>=20
>>=20
>> By the way, I'm checking commits one by one. Currently at:
>> 2023-06-17 selftest/reproducible: Allow chose the package manager
>> <https://git.yoctoproject.org/poky/commit/?h=3Dnanbield&id=3D88abdec71=
5ed0c1f613c9b5132cd45db741d5c65>(https://git.yoctoproject.org/poky/log/?h=
=3Dnanbield&ofs=3D1350)=20
>> 1350 to go ;-)
>=20
>=20
> By the way, if you have time to contribute to the release notes (which=20
> would be great, as I am likely to miss significant changes), please=20
> submit them against "master-next", which is where I keep my recent=20
> changes.
> Thanks :)
>=20
> Michael.
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4518):=20
> https://lists.yoctoproject.org/g/docs/message/4518
> Mute This Topic: https://lists.yoctoproject.org/mt/102219472/2167413
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub=20
> [bluelightning@bluelightning.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

