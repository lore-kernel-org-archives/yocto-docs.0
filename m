Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC9AC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 07:41:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.122703.1683013307386686209
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 00:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X73ZtvN5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C1B6FF807;
	Tue,  2 May 2023 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683013305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=APiV6iY8IOyKCYV+UPycRzTbaGwmP8D/yaVHo3BGcco=;
	b=X73ZtvN5vF0fCi8Gy1t0wTZlN1ooSEltpLETB4Dwlsq0zmNRWV/4BqftTJ6E3URvj4a9iz
	WMHOWyopmcVvbYUYzrwBba1k+ix9CMEs/VlrkjhLDV/Z6FopNEdSKRc2C5WLlrUVPRLfKR
	WZ2Jvm1H6bAuxoUWoeon5A2atALu4nlrSKVmnVe6LgT2JcfQ6rrYpk6Q3zbpmj9bARHnpy
	uw42mbTF6RSrfknjoci/8ejUT4f91Qls7J8ag6qVIdXpuUWEQh/THC1TtZ6c8U9iaa8pI1
	NwnV15HRy9Si9o2p6zhFNzgeie46oEx1N8y+J8GV1c5sRatSqf2Cbh29CTNMJA==
Message-ID: <c207efdb-f0c5-33f4-885c-932851a4ac48@bootlin.com>
Date: Tue, 2 May 2023 09:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.2: remove/merge duplicates entries
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230429061830.3359909-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230429061830.3359909-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 May 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3885

Hi Lee,

On 29.04.23 at 08:18, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-notes-4.2.rst    | 48 ++++---------------
>   1 file changed, 10 insertions(+), 38 deletions(-)


Many thanks for these fixes!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


