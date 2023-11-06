Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD05C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 16:16:41 +0000 (UTC)
Received: from www3.webmail.pair.com (www3.webmail.pair.com [66.39.3.34])
 by mx.groups.io with SMTP id smtpd.web10.58946.1699287395566939240
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 08:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.3.34, mailfrom: bluelightning@bluelightning.org)
Received: from rc.webmail.pair.com (localhost [127.0.0.1])
	by www3.webmail.pair.com (Postfix) with ESMTP id 9F32D87F70;
	Mon,  6 Nov 2023 11:16:34 -0500 (EST)
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 05:16:34 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 12/12] migration-4.3: additional migration items
In-Reply-To: <6rbkc7i1vs.fsf@pengutronix.de>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
 <76de363e7d3d18d38be8d63cbd683e22337f7af6.1699266393.git.bluelightning@bluelightning.org>
 <6rbkc7i1vs.fsf@pengutronix.de>
Message-ID: <87b72e9424d830730d3fcacd12d3e225@bluelightning.org>
X-Sender: bluelightning@bluelightning.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
X-Scanned-By: mailmunge 3.09 on 66.39.3.34
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 16:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4604

On 06.11.2023 23:58, Ulrich =C3=96lmann wrote:
>> ...
>> +-  The :term:`SRCPV` variable is no longer be needed in :term:`PV`,=20
>> but since
>=20
> s/is no longer be needed/is no longer needed/

Fix pushed to the branch.

Thanks
Paul

