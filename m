Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FD2C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:02:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.8213.1635526950626781710
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 10:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2D67C1C0004;
	Fri, 29 Oct 2021 17:02:26 +0000 (UTC)
Date: Fri, 29 Oct 2021 19:02:25 +0200
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
In-Reply-To: <052ddb4c-0577-e34e-980b-c7ea828c98bc@bootlin.com>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
 <20211027104016.uqi7y5d2aluyvf4x@fedora>
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
 <20211027105243.7ncoejzfms6rcxyh@fedora>
 <20211027112837.7oaibv2saa4ak2gn@fedora>
 <052ddb4c-0577-e34e-980b-c7ea828c98bc@bootlin.com>
Message-ID: <1C22AE6D-7805-42F0-BB50-D08111E1BB82@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Oct 2021 17:02:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2056

Hi Michael,

On October 29, 2021 6:15:08 PM GMT+02:00, Michael Opdenacker <michael=2Eop=
denacker@bootlin=2Ecom> wrote:
>Hi Quentin,
>
>On 10/27/21 1:28 PM, Quentin Schulz wrote:
>> Hi all,
>>
>> Just to make sure the discussion does not get mistaken as an agreement
>> on this patch being dropped, can we still merge this one patch in honis=
ter
>> branch please :) ? It still applies even though we missed the release t=
ag=2E
>
>I can take care of merging it in honister-next so that Richard can take
>it in honister=2E
>
>However, I also see that Hardknott
>(http://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/yocto-docs/tree/document=
ation/sphinx-static/switchers=2Ejs?h=3Dhardknott)
>and Dunfell
>(http://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/yocto-docs/tree/document=
ation/sphinx-static/switchers=2Ejs?h=3Ddunfell)
>should be updated too=2E
>
>Did I understand correctly?
>

Switchers=2Ejs does not need to be updated as only the one from the master=
 branch is taken and copied to all other branches and tags by the autobuild=
er=2E But you just saw why we want to get this file out of the docs so main=
tainers don't have to care about this (and also, for EOL releases)=2E

The documentation/conf=2Epy seems up-to-date for those branches so I think=
 nothing needs to be done aside from this patch in honister=2E

Cheers,
Quentin

