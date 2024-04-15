Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01DAC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 15:41:48 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.24573.1713195699058970954
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 08:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bduf3blz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2D221BF206;
	Mon, 15 Apr 2024 15:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713195697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IE4JIWIX9wIS/mbP4l7ShwoJ/J/umpn/D7HtDgKJ7WU=;
	b=bduf3blzmaIMicLzwSfNIhuTVPCJhALP6Ru9MY/CMCE32H9lVn/mKWbl7B7SmN8eaiVtiK
	bEjBuEUlIRy+Et4F9XFDz8mvT5QUdXuXvmLITYpR4QzjXjd/BT57iYu+5+Sj4zFVU1Ob8P
	hqoZnXFQL8ZDQzAg+x+qq0H+96/G5PUIwMiC8sOJgimtkl9PlAH5MwZoPc8Wszn/vsx9aq
	ESNUlJOCYHBGtM+Y3hJMGaPzcEY1hPctfhcmmocvpZY4rrrbP0NvycmQjS2iZJ3COTxMzF
	QnUCXJoR6sjp1hD/VhcfHe+TgdnGHyDj3v784lJ6kva428gsHK63JOkbjQxIqg==
Message-ID: <8571a733-4fd5-48a2-a3b1-c2d39249f7cc@bootlin.com>
Date: Mon, 15 Apr 2024 17:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [PATCH 9/9] release-notes: additional features and one known
 issue for 5.0
To: Paul Eggleton <bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
 <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <91fad937a3567c0c66d0c28e4ed2fb3227450a5e.1713127068.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Apr 2024 15:41:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5157


On 4/14/24 at 22:43, Paul Eggleton wrote:
>   
> +   -  ide: vscode: make files from recipe sysroots and debug rootfs read-only to avoid confusion

I replaced this by:

    -  ``ide``: ``vscode``: generate files from recipe sysroots and 
debug the
       root filesystem in read-only mode to avoid confusion.

I hope that's OK!

> +
> +   -  modify: add support for multiple sources in :term:`SRC_URI`
> +
> +   -  Support plugins within plugins
> +
> +-  recipetool improvements:
> +
> +   - appendsrcfile(s): added a mode to update the recipe itself
> +
> +   - appendsrcfile(s): added dry-run mode
> +
> +   - create: Added handler to create go recipes
> +
> +   - create: Improved identification of licenses
> +
> +   - create: Added support for modern Python PEP-517 build systems including hatchling, maturin, mesonpy
> +
> +   - create: Added pypi support
> +
> +   - create: Prefix created Python recipes with python3-


I made several formatting improvements to the above section and used the 
present tense. That's a bit long to describe :)
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


