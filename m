Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D6CCD1294
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 09:15:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.6892.1712135698518077117
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 02:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kLHNv0SJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAB9520008;
	Wed,  3 Apr 2024 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712135696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMJYvgliBfvXahxhxg5zupuQv7HSKDSUsuWen9xJ+z4=;
	b=kLHNv0SJVTIi9PG13QkHzslfM9TjzX36R3/QTiZo9yh9Ckc9TNAWFlIWBGJstX/URSCwwD
	GK8BYRHXpplUrC4qAtSEA69K8itolPHNaLJ44Ha9qOgbKaWArzN2eHOSX8JWa19S3HFi2b
	fZMrnIiKKWyaLO3KE5UphvGtyK+4BlFp0leXwYo8xY+S4TIGTrQtLxaFYmGuItZdT8ojYk
	i6uhXU+/Vieu6ljaN+UYW5kdQB5+hgFXbcyesHzPRadbWMxya3m891PoywVgf5WSqYwxdg
	pSXHB1S3mUZcE6Q71j4zpFLO2uFwWdcwB/QEw1dm4282LRFguW9uIMRH0DlNpA==
Message-ID: <7430e3e7-40ab-42b6-9b00-6646efe84ffd@bootlin.com>
Date: Wed, 3 Apr 2024 11:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com
Subject: Re: [docs] [PATCH v2] migration-guides: add release notes for 4.3.4
To: Lee Chee Yang <chee.yang.lee@intel.com>, docs@lists.yoctoproject.org
References: <20240403013516.3993707-1-chee.yang.lee@intel.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240403013516.3993707-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Apr 2024 09:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5049

Hi Lee,

I was waiting for this update, thanks !

On 4/3/24 at 03:35, Lee Chee Yang wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


