Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF08C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 10:32:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.3653.1636108349551400921
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 03:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C244B60017;
	Fri,  5 Nov 2021 10:32:26 +0000 (UTC)
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Variable documentation overlap between Yocto and Bitbake
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <f9c8e642-a6d1-afbe-247c-39ac1db60a0c@bootlin.com>
 <20211103093533.prsusa5rblbmqset@fedora>
 <fb3b31c1-f4a1-961d-292f-db932ef2c787@bootlin.com>
 <CAP71Wjy8m+rJbWo2p_RBiLrzOgVoFScSn3XX3yHSeCP8zS0SNw@mail.gmail.com>
 <955b3fc96a77c72e505aa6ebdb3ce36656d70940.camel@linuxfoundation.org>
 <CAP71WjyG1_52rk9gkmn7nuuf8bNML6JT1ReRTkXYvzgU3Heypg@mail.gmail.com>
 <16B49C55CE06F163.24476@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <e33d773b-225a-ba82-1720-c6fc404fe1a7@bootlin.com>
Date: Fri, 5 Nov 2021 11:32:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16B49C55CE06F163.24476@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 10:32:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2083


On 11/5/21 10:27 AM, Michael Opdenacker wrote:
>
> In the meantime, the current solution works well. I'll submit a patch
> for SRC_URI, eliminating the duplicates between the two manuals.


This is an interesting exercise because I'm finding features supported
by Bitbake but documented only in Yocto docs!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


