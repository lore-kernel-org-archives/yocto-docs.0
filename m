Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799AFC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 10:06:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.10003.1642759569185620158
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 02:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C0E5240003;
	Fri, 21 Jan 2022 10:06:06 +0000 (UTC)
Subject: Re: [docs] [yocto-docs][dunfell 1/1] documentation: update for 3.1.14
 release
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1642715781.git.steve@sakoman.com>
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <940d6bfc-7f86-4bf6-550d-af095673c289@bootlin.com>
Date: Fri, 21 Jan 2022 11:06:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <e94c4c7d7103b8af5a332e53afb1e0c5d848695b.1642715781.git.steve@sakoman.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Jan 2022 10:06:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2442


On 1/20/22 10:57 PM, Steve Sakoman wrote:
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  documentation/conf.py                    | 2 +-
>  documentation/poky.yaml                  | 8 ++++----
>  documentation/releases.rst               | 1 +
>  documentation/sphinx-static/switchers.js | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)

Thanks Steve.
I'll apply the patch when the release is out.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


