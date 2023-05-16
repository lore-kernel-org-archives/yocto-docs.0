Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54190C77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 11:37:52 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web10.19556.1684237065671804046
 for <docs@lists.yoctoproject.org>;
 Tue, 16 May 2023 04:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [192.168.3.12] (softbank126088165209.bbtec.net [126.88.165.209])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 49D0B802F20F3;
	Tue, 16 May 2023 20:37:43 +0900 (JST)
Message-ID: <3b21c172-34f5-8e77-be7a-82e53ec37f70@lineo.co.jp>
Date: Tue, 16 May 2023 20:37:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [docs] [PATCH] releases.svg: update according to latest release
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20230508055100.2204477-1-michael.opdenacker@bootlin.com>
 <c8174cd5-ee37-2c20-bc0d-33a0c3e57d7b@lineo.co.jp>
 <ab47ab08-90ed-00ec-014a-294056bfc2b9@bootlin.com>
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <ab47ab08-90ed-00ec-014a-294056bfc2b9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 May 2023 11:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3945

Hi Michael

I remember that this was extended at the request of the community in Yoct=
o 3.4 due to incompatible override syntax changes.
https://docs.yoctoproject.org/migration-guides/migration-3.4.html#overrid=
e-syntax-changes

https://lists.yoctoproject.org/g/yocto/message/55344
"A request was made to continue hardknott support in the community and th=
is was agreed until Feb/March next year but will not=20
overlap the LTS."




On 2023/05/16 17:47, Michael Opdenacker via lists.yoctoproject.org wrote:
> Hi=C2=A0 Takayasu,
>=20
> On 16.05.23 at 09:45, Takayasu Ito wrote:
>> Hi Michael
>>
>> I see that the last point release of Yocto 3.3 was on 4/28/2022, and I=
 think Hardknott's line needs to be extended by 6 months.
>=20
>=20
> Oops, that's correct. Do you remember why we supported Hardknott for so=
 long?
> Making the change may confuse people. They could think that Hardknott w=
as a "short" LTS, but hey, that's what happened.
>=20
> Cheers
> Michael.
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3944): https://lists.yoctoproject.org/g/docs/messag=
e/3944
> Mute This Topic: https://lists.yoctoproject.org/mt/98755922/3617373
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [ito@lineo.co.=
jp]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Takayasu Ito
Solution Department, Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp
Yocto Project Ambassador


