Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95213C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 11:10:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.6132.1646219420086274661
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 03:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Iyy2W9FP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0702E0017;
	Wed,  2 Mar 2022 11:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646219418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrBfDoGLUBE9UnCZ8lCuoq09yTRf4eC2aOYJQh2Nr48=;
	b=Iyy2W9FPtUQ2WjNv+CYNKIHoW0SmZ0yR0CA9b7sg6SMspTcncyddLhjyAuTJNc7KsqY9qr
	F/8d22RlHNaZ5UFD9x6Pwyd3WcKPBEOurhQvvpEf+UJqE70NaXjnbWmzXuxbwwUX2q4RqN
	UfGsXWG2bOR3KnGoQl0zvQNV7xS7dcjmdjqxT+DkM+sWCuMzc6BGxljHCYVMDH4QANAVMC
	MdsmuRL6sV7FDqNipx9Nn5/5JnQh40lWaA9qA1UlZ71+LQijO2L/b00I8ZuZ2387pGUEzX
	VlFHHz3/dPRJPmWkYz3LJ8SNxuagQq0Qwqh0fTKXkH5KIdmNmOPgJ75KWMVhPQ==
Message-ID: <360b9fb9-f408-7081-9010-0e53c08489ff@bootlin.com>
Date: Wed, 2 Mar 2022 12:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: Re: [docs] [PATCH 2/3] docs: add pip install variables
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, docs@lists.yoctoproject.org
References: <20220228035547.1134436-1-tim.orling@konsulko.com>
 <20220228035547.1134436-2-tim.orling@konsulko.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220228035547.1134436-2-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Mar 2022 11:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2524


On 2/28/22 04:55, Tim Orling wrote:
> Add the new variables used to install Python `wheel` binary archives:
> * PIP_INSTALL_ARGS
> * PIP_INSTALL_DIST_PATH
> * PIP_INSTALL_PACKAGE
> * PYPA_WHEEL
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>


For both patches:
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

I add to remove a trailing whitespace, but no harm, everything else was
fine.
I merged your two changes into "master-next".

Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


