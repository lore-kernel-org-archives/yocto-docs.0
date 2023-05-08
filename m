Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40355C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 05:42:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.100766.1683524538730770750
 for <docs@lists.yoctoproject.org>;
 Sun, 07 May 2023 22:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=heIMoATS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 368F7FF805;
	Mon,  8 May 2023 05:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683524536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xkn9g6fWKB1SJIEA54rGnFticaIL4wWQTWhZJn0qGZw=;
	b=heIMoATSdNzXCrEO/imv8LXOK16MpVo+9bU/T3+y1ruwzqAS6YZL7izID/AZXKVeolIn44
	sBQMcz7dQ+nvV0/P0BwLjBniXgJ5II3GhmaPmRCAHtcAkEALO2S1ZygNSSzJhcggqDHSuZ
	Q9iFVeWG6FKkAuK5fm+Dom8lD32nokRH2bgRQBOi4gE9X2Z2pmP7bhakU2evF3xiTIsa6p
	iRHr+GwU+FzqIf9lPrCHy9XzKQ2vZM3p5arnCnv89w104Hmt21Dv27u62oIVQkVWQM3EPZ
	VPqHiY+UaMihEPZfnq2TBKJqtCoXi76FLtck5diveX3Hw6+T4i/nZ98kRSBjKA==
Message-ID: <a6d6cc08-6640-2b50-a0fb-741489a1e83f@bootlin.com>
Date: Mon, 8 May 2023 07:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] release-notes-4.2: update known issues and
 Repositories/Downloads
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20230506012740.3904740-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230506012740.3904740-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 May 2023 05:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3922

Hi Lee,

On 06.05.23 at 03:27, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>   .../migration-guides/release-notes-4.2.rst    | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)


Many thanks for the release!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


