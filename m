Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BBAC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:21:06 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.9966.1642180850353640396
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 09:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id A8599200005;
	Fri, 14 Jan 2022 17:20:47 +0000 (UTC)
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: Re: [docs] [PATCH v2 3/3] ref-manual/classes.rst: add
 setuptools3-base
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
References: <20220113153843.2544066-1-tim.orling@konsulko.com>
 <20220113153843.2544066-3-tim.orling@konsulko.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <fe0fe953-a9fe-4d03-fa71-dbe6424a64ab@bootlin.com>
Date: Fri, 14 Jan 2022 18:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113153843.2544066-3-tim.orling@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Jan 2022 17:21:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2411

Hi Tim

Thanks for the patches!

On 1/13/22 4:38 PM, Tim Orling wrote:
> Add setuptools3-base class
>
> +
> +The ``setuptools3-base`` class provides a reusable base for other classes
> +that support building Python version 3.x extensions. If you need
> +functionality that is not provided by the :ref:`setuptools3<ref-classes-setuptools3` class, you may
> +want to ``inherit setuptools3-base``. Some recipes do not need the tasks
> +in the :ref:`setuptools3<ref-classes-setuptools3` class and inherit this class instead.


There were syntax issues in the above references but no problem, I fixed
them.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into "master-next".

Thanks again!
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


