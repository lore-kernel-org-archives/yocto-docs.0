Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DC5C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 14:50:59 +0000 (UTC)
Received: from www1.webmail.pair.com (www1.webmail.pair.com [209.68.6.94])
 by mx.groups.io with SMTP id smtpd.web10.259.1713451856681644252
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 07:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 209.68.6.94, mailfrom: bluelightning@bluelightning.org)
Received: from rc.webmail.pair.com (localhost [127.0.0.1])
	by www1.webmail.pair.com (Postfix) with ESMTP id 5ABBA1A0B97;
	Thu, 18 Apr 2024 10:50:53 -0400 (EDT)
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 07:50:53 -0700
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 9/9] release-notes: additional features and one
 known issue for 5.0
In-Reply-To: <269d718f-5d81-4ef4-865c-036f4215fc08@bootlin.com>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
 <bd77ae10-99da-44cc-9086-3eb4deb80218@theobroma-systems.com>
 <269d718f-5d81-4ef4-865c-036f4215fc08@bootlin.com>
Message-ID: <67767a97a85d5232f3e7f50c869fc7c2@bluelightning.org>
X-Sender: bluelightning@bluelightning.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
X-Scanned-By: mailmunge 3.09 on 209.68.6.94
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Apr 2024 14:50:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5163

On 15.04.2024 08:22, Michael Opdenacker wrote:
> On 4/15/24 at 10:06, Quentin Schulz wrote:
>> I think there's a way to link to the bitbake doc for inherit=20
>> directive.
>>=20
>> Maybe something like:
>>=20
>> """
>> :ref:`inherit=20
>> <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\=
`\`=20
>> directive>`
>> """
>>=20
>> would work? Just a suggestion though.
>=20
>=20
> It works! I made the change.
>=20
>>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it is only evaluated at the end of pa=
rsing - recommended where=20
>>> a conditional
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expression is used, e.g.
>>> +
>>=20
>> I think we're missing a double colon here to make this a code snippet?
>>=20
>> """
>> expression is used, e.g.::
>> """

Thanks to you both, I added this late and didn't even think about=20
linking to the BitBake manual - perfect!

Cheers
Paul

