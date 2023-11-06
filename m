Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F96C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:14:41 +0000 (UTC)
Received: from www3.webmail.pair.com (www3.webmail.pair.com [66.39.3.34])
 by mx.groups.io with SMTP id smtpd.web10.58899.1699287280788883684
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 08:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.3.34, mailfrom: bluelightning@bluelightning.org)
Received: from rc.webmail.pair.com (localhost [127.0.0.1])
	by www3.webmail.pair.com (Postfix) with ESMTP id E4B3687FB5;
	Mon,  6 Nov 2023 11:14:39 -0500 (EST)
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 05:14:39 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 09/12] release-notes-4.3: feature additions
In-Reply-To: <6rfs1ji2cj.fsf@pengutronix.de>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <dab7f691e3716938a7f05d62f0ff1a6026bc5ac8.1699266393.git.bluelightning@bluelightning.org>
 <6rfs1ji2cj.fsf@pengutronix.de>
Message-ID: <f6675f8dbcc8fd580890ca300e01c71f@bluelightning.org>
X-Sender: bluelightning@bluelightning.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
X-Scanned-By: mailmunge 3.09 on 66.39.3.34
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 16:14:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4603

On 06.11.2023 23:45, Ulrich =C3=96lmann wrote:
>> @@ -225,6 +307,18 @@ New Features / Enhancements in 4.3
>>        :term:`SPLASH_IMAGES`, instead of a harder to generate and=20
>> modify
>>        ``.h`` file.
>>=20
>> +   -  The ; character is no longer needed to separate functions=20
>> specified in
>> +      :term:`IMAGE_POSTPROCESS_COMMAND`,=20
>> :term:`IMAGE_POSTPROCESS_COMMAND`,
>=20
> The term IMAGE_POSTPROCESS_COMMAND is enumerated twice here.

Oops - fix pushed to the branch.

Thanks
Paul

