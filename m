Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E79EC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 12:30:52 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.8705.1634819450907121435
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 05:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0C1BF40016;
	Thu, 21 Oct 2021 12:30:48 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Update how to set a useradd password
To: Daiane Angolini <daiane.angolini@foundries.io>,
 docs@lists.yoctoproject.org
References: <16AFCC10F2844E5D.10624@lists.yoctoproject.org>
 <CA+HEL7-2J1mkD_9JAv+-b+Ydr6U=b=nUemJn1SN4O4RLu9E3EQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ee2829eb-96f7-95ff-6949-3e68a48d6217@bootlin.com>
Date: Thu, 21 Oct 2021 14:30:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CA+HEL7-2J1mkD_9JAv+-b+Ydr6U=b=nUemJn1SN4O4RLu9E3EQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 12:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2023

Oi Daiane

Many thanks for the patch!

On 10/20/21 7:25 PM, Daiane Angolini wrote:
> Hi
>
> I am not completely sure of some details on this patch. Any
> suggestions to make it better, please let me know.
>
> There is a bug [1] and the commit which changed this behavior is [2]
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14605
> [2] http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/shadow?id=759df7395908f18b3b68f28d043ac9ebd42dd0c8


Your patch looks perfectly good to me. I'm currently testing it.
Why do you say that it only partially fixes [YOCTO 14605]?

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


