Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFE6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 08:20:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.9307.1663662026974907123
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 01:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CacX38J+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4D8540005;
	Tue, 20 Sep 2022 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K6pmXSTPxTBZkgdqgzgGXivfEspjkvo4EaPPoGGhkA=;
	b=CacX38J+3EH6DovDbhGmwN1VHftb6VcxMNEkMFVs4mObYbBDuMyQ795vMZOejZpIn63ofu
	Tzpx3emVbDezwylZkpEttfKZZ3GGeaX5WOZXAUuTQQ0zTo4k7t7RqesSsAwovfldhVfLJr
	OQPV3gSBJ7xmtpZlC4otPWRc5fTWY1Q8OaqZa7V2WjWwTlG8igY30ZhveheJDuU3nNC3Yv
	8Z+yWSJMuaW/PyPl4/7XVv2J7zcXj5LMkjDwpplf0Z9Uq6hZzwi61AgUEAb5He4RypHtRc
	Ndm98HMlT7UsodvWtZnK6Vu1uHJgZzjVTyaEjT+H1BhQA7K65pMq4qFaZqF1NA==
Message-ID: <6c27f805-a962-2bc0-3f08-16cef7df9766@bootlin.com>
Date: Tue, 20 Sep 2022 09:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [doc][PATCH v3 2/2] kernel-dev/common.rst: remove
 SRC_URI:append from examples
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20220920074548.17466-1-mikko.rapeli@linaro.org>
 <20220920074548.17466-2-mikko.rapeli@linaro.org>
 <cab69782-69f6-14f5-7a13-d9016432328c@bootlin.com>
 <CAJFpGrNTu7FmBg=sdTCCVG330LD-RQ8b=vDXRjkXJWUx8f5+Tg@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: 
 <CAJFpGrNTu7FmBg=sdTCCVG330LD-RQ8b=vDXRjkXJWUx8f5+Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 08:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3185

Hi Mikko

On 9/20/22 09:16, Mikko Rapeli wrote:
>
> The other changes in the original series are already merged in master
> so it's a bit
> late for commit message updates.


Oops, my bad. I didn't realize they were not documentation changes :}
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


