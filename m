Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700E2C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 13:50:36 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.44798.1678542629575054864
 for <docs@lists.yoctoproject.org>;
 Sat, 11 Mar 2023 05:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [192.168.3.12] (softbank126088165209.bbtec.net [126.88.165.209])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id BE947802F20D4;
	Sat, 11 Mar 2023 22:50:26 +0900 (JST)
Message-ID: <d690189f-8667-6c42-a8ef-ec1036b1044e@lineo.co.jp>
Date: Sat, 11 Mar 2023 22:50:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [docs] [PATCH] migration-guides: add release-notes for 4.0.8
To: docs@lists.yoctoproject.org
References: <20230311053203.1411861-1-chee.yang.lee@intel.com>
 <174B57F0603E6B8B.27660@lists.yoctoproject.org>
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
In-Reply-To: <174B57F0603E6B8B.27660@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 11 Mar 2023 13:50:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3786

I made a mistake in the name of the recipe.

 > libgit: CVE-2023-22742

libgit2: CVE-2023-22742

On 2023/03/11 19:52, Takayasu Ito wrote:
> Hi Lee
>=20
> I would like to suggest some modifications.
>=20
> Security Fixes in Yocto-4.0.8
>=20
> libgit: CVE-2023-22742
>=20
> # https://github.com/libgit2/libgit2/blob/v1.4.5/docs/changelog.md
>=20
>=20
> Fixes in Yocto-4.0.8
>  > +-=C2=A0 Fix missing leading whitespace with ':append'
>=20
> # I would suggest clarifying which files were targeted for modification=
.
>=20
> core-image.bbclass: Fix missing leading whitespace with ':append'
> populate_sdk_ext.bbclass: Fix missing leading whitespace with ':append'
> ptest-packagelists.inc: Fix missing leading whitespace with ':append'
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3785): https://lists.yoctoproject.org/g/docs/messag=
e/3785
> Mute This Topic: https://lists.yoctoproject.org/mt/97536590/3617373
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


