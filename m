Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90BAC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 13:32:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.9414.1634823151413953051
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A52DBE0017;
	Thu, 21 Oct 2021 13:32:28 +0000 (UTC)
Subject: Re: [docs] [PATCH] ref-manual: Update how to set a useradd password
To: docs@lists.yoctoproject.org,
 Daiane Angolini <daiane.angolini@foundries.io>
References: <20211020170549.526108-1-daiane.angolini@foundries.io>
 <16B00E4412FB3143.5910@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <73eda9d8-01b2-36d4-3f21-906971b76f52@bootlin.com>
Date: Thu, 21 Oct 2021 15:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16B00E4412FB3143.5910@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 13:32:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2026


On 10/21/21 3:19 PM, Michael Opdenacker wrote:
>
> And when I tried to log in with user "alice" and the password, I got:
> "crypt method not supported by libcrypt? (SHA512)"
>
> Not sure our instructions are enough here...


Actually, if I generate the password with "mkpasswd -m sha256crypt bob",
everything works fine. Not sure libcrypt in Poky's "core-image-minimal"
is sufficient.

What about using sha256crypt instead?

If you don't have time right now, I'll be happy to propose a V2 of your
patch if you are interested.
Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


