Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DEC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 09:18:49 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.6709.1642065527977319236
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 01:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4A071200011
	for <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 09:18:44 +0000 (UTC)
Subject: Re: [docs] [RFC v2] manuals: add 3.4 release notes after migration
 information
To: docs@lists.yoctoproject.org
References: <16C999F23911730D.14005@lists.yoctoproject.org>
 <16C99A6E888C2F92.19527@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <4691a072-e87b-28c6-34ea-d209dea81f79@bootlin.com>
Date: Thu, 13 Jan 2022 10:18:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <16C99A6E888C2F92.19527@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 09:18:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2404


On 1/12/22 7:48 PM, Michael Opdenacker wrote:
> Only done for release 3.4 so far.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>
> Generated HTML output available at
> https://bootlin.com/~mike/pub/yocto-project/docs-2021-01-12/releases/3.4.html


Note that this patch is not ready for merging. I still have variable
references to add and font settings to apply (to command names, for
example). By the way, including the release notes in the documentation
is a good thing, as we refer to variables through the :term: statement,
and errors allow us to detect variables that are not documented yet :-)

However, checking
https://bootlin.com/~mike/pub/yocto-project/docs-2021-01-12/releases/3.4.html
is a good way to look at the release notes as they are described today
(the raw text remains the same) and share your suggestions here, as
Quentin just did (thanks!)

Thank you in advance.
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


