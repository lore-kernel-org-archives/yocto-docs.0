Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF37ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:42:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.12219.1663681339291354127
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 06:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ASZoxbcS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 18D4720005;
	Tue, 20 Sep 2022 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663681336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fA8isRtM3OlT+DSmLuyxFsP4g1jV0j1biH9sMstGd9E=;
	b=ASZoxbcSVsXKPYqzqdMorxXF76SEB31JcQf0NpHYuOE2eo5kBIq1yvz0N6asGV5d5+Xq+b
	yBlojEJy6FqeQ5bwq8Ko12MsgjUD1BmSxjSbKp5ZKUnRRkgJUD+IQ3M52ek0mxwlx0KWd8
	UoW0HarEcsqN8AE1kcz9qsDunZiD1NHpkkLyorr4wX4xSLPjL0R5Xisr4cnPmcselEqXAA
	4v9lBEY7godu7c+1eVWlH88HDykNM+1OktGweLEFwEYtu/jlyOSwR/crTsgsDW4ajF4fcG
	br4tZs8HTV1RAqDg3t7qYktZEAP8C1XOXbxPPjynR0VkqmR9aI+B+2GfqIzAdw==
Message-ID: <3b953e44-42e9-c134-dd2c-02476c1b3939@bootlin.com>
Date: Tue, 20 Sep 2022 14:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 2/5] common-tasks.rst: drop the output of
 'bitbake-layers --help'
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-2-alex@linutronix.de>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220911172608.2542076-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 13:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3187


On 9/11/22 18:26, Alexander Kanavin wrote:
> This is really not needed as the sub-commands are described in
> greater detail just below, and is prone to become outdated.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/dev-manual/common-tasks.rst | 33 -----------------------
>   1 file changed, 33 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index bdc528b72..c2afec946 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -653,39 +653,6 @@ For help on the BitBake layer management tool, use the following
>   command::
>   
>      $ bitbake-layers --help
> -   NOTE: Starting bitbake server...
> -   usage: bitbake-layers [-d] [-q] [-F] [--color COLOR] [-h] <subcommand> ...
> -
> -   BitBake layers utility
> -
> -   optional arguments:
> -     -d, --debug           Enable debug output
> -     -q, --quiet           Print only errors
> -     -F, --force           Force add without recipe parse verification
> -     --color COLOR         Colorize output (where COLOR is auto, always, never)
> -     -h, --help            show this help message and exit
> -
> -   subcommands:
> -     <subcommand>
> -       layerindex-fetch    Fetches a layer from a layer index along with its
> -                           dependent layers, and adds them to conf/bblayers.conf.
> -       layerindex-show-depends
> -                           Find layer dependencies from layer index.
> -       add-layer           Add one or more layers to bblayers.conf.
> -       remove-layer        Remove one or more layers from bblayers.conf.
> -       flatten             flatten layer configuration into a separate output
> -                           directory.
> -       show-layers         show current configured layers.
> -       show-overlayed      list overlayed recipes (where the same recipe exists
> -                           in another layer)
> -       show-recipes        list available recipes, showing the layer they are
> -                           provided by
> -       show-appends        list bbappend files and recipe files they apply to
> -       show-cross-depends  Show dependencies between recipes that cross layer
> -                           boundaries.
> -       create-layer        Create a basic layer
> -
> -   Use bitbake-layers <subcommand> --help to get help on a specific command
>   
>   The following list describes the available commands:


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into "master-next".

Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


