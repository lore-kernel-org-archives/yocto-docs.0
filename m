Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DB9CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 09:23:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7908.1712049792570224959
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 02:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gYsgwnNP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A022D1C0009;
	Tue,  2 Apr 2024 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712049790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgkXWNfZFcXBWlwuEiXkHwh0qH+IHoSwI5OXsTGFGXI=;
	b=gYsgwnNPyZhM3KVBX5y7YZEStc2gvH1my1ZN5X3k2L8a7QUanFndeDVcvt/L2WHRroflYx
	2NYJlUfQb5lyk0c/Jh4RwSEmPwSyDAbLDI6NWO7ocNyWXGkwdVQhiV0k70eF7N9pGcmfuo
	7Da3PWpdziLHLWA0Ey3bbFB610AAO/p/IeiOGhDZhbMHjFCGET/GJsaa8Jb85HpieXvR7M
	djLuyi+auj4Db/6ExzXIUq46kTJdutze3KTgB1hra+GrKXIivighYGGEh9Xw6sT/mV9CiF
	R71A9h2OFwzrx/3gT5x7CVH6318N6uXgk1ZnUDy5rlFkFZaaGo2YoasexAXWmQ==
Message-ID: <1026b346-562d-4967-96b6-71c3859a450d@bootlin.com>
Date: Tue, 2 Apr 2024 11:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: add initial sphinx-lint support
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
References: <20240330163609.1735506-1-michael.opdenacker@bootlin.com>
 <phnvruxf73koyubpku2axrnpil6nxkfzdzuwxda3tnxeqblvsn@tielnvpiz6ja>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <phnvruxf73koyubpku2axrnpil6nxkfzdzuwxda3tnxeqblvsn@tielnvpiz6ja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Apr 2024 09:23:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5040

Hi Jörg

On 4/2/24 at 09:53, Jörg Sommer wrote:
> Michael Opdenacker via lists.yoctoproject.org schrieb am Sa 30. Mär, 17:36 (+0100):
>> Just run "make sphinx-lint".
>> +sphinx-lint:
>> +	sphinx-lint
>> +To run sphinx-lint:
>> +
>> + $ make sphinxlint
> Is a dash missing in this command?


Oops, good catch. It was a leftover from my first version.
Fixed.
Thanks!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


