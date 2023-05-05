Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD0BC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 14:59:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.29609.1683298768528105488
 for <docs@lists.yoctoproject.org>;
 Fri, 05 May 2023 07:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RqVpFsdy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1DBBF1BF208;
	Fri,  5 May 2023 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683298766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMzUSrVoaEqrHIBt321MZuq3oSlzFyxSPKq6aWuqOYE=;
	b=RqVpFsdyXD+GxRVx/FVFv38zVZu9Ligux+NZX0686uWoU+rENlscAA4GuAnoNJffq94z9/
	OgfmKTsICxsydvemrsffVw/3GcGHG1gMfe/lDBrh95ilQy/kMA1VoPd7uH5/GLF9Ur/a1A
	AaoMsP9V14/B3eRb7R0BLiOhIR6JBkzaulUZ4+ONVYhi4FXxB28EDGEzgyEoPkmCJbxCaN
	Xvn2RgASwMmk1630KfhWDnSjG11Ap6neLvyc6JptQeDC4nCNsOXwSODZ39boP3sX7MgAyJ
	Ull9bexYnbeRiMc6idzActrHuEbhaK91UEFlzzwoxqKXAQd3+B9ZWkopNOo80w==
Message-ID: <55137b72-2555-33dc-f5b5-620bb2c749fc@bootlin.com>
Date: Fri, 5 May 2023 16:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration/release-notes-4.3: Add extra notes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230505124754.3136997-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230505124754.3136997-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 May 2023 14:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3914

Hi Richard,

On 05.05.23 at 14:47, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../migration-guides/migration-4.3.rst        | 28 ++++++++++++++++++-
>   .../migration-guides/release-notes-4.3.rst    | 11 ++++++++
>   2 files changed, 38 insertions(+), 1 deletion(-)


Many thanks for the updates!
I just added a few minor formatting tweaks.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


