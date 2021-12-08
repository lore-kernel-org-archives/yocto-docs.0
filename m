Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F26AC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:53:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.12563.1638971634355858730
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C94F21BF213;
	Wed,  8 Dec 2021 13:53:51 +0000 (UTC)
Subject: Re: [docs] [PATCH v3] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: "Simon A. Eugster" <simon.eu@gmail.com>, docs@lists.yoctoproject.org
References: <20211115124546.97456-1-simon.eu@gmail.com>
 <09f9337d978b9d0727de2a937eb417e8185ca0b3.camel@linuxfoundation.org>
 <16B7BA9296511776.16692@lists.yoctoproject.org>
 <CAO8d5Ba4SJ_SeK2y+qHcGWqxVWjDL=buaOcYxcGXDmhYZg3MGA@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d3d82ca1-935c-83d7-18e1-43475f14d57c@bootlin.com>
Date: Wed, 8 Dec 2021 14:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAO8d5Ba4SJ_SeK2y+qHcGWqxVWjDL=buaOcYxcGXDmhYZg3MGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2231

Hi Simon,

Thanks for the update! Apologies for the slow reply.

On 11/29/21 8:50 AM, Simon A. Eugster wrote:
> Now based on the bitbake repository and not on the poky repo!


Could you send the patch again through "git send-email", please? This
way, people can review your patch and make comments or ask questions by
replying to specific changes.

Another thing: since this is Bitbake documentation, you should send it
to both bitbake-devel@lists.openembedded.org and
docs@lists.yoctoproject.org, as described in the toplevel README file.

Thanks again. You're very close.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


