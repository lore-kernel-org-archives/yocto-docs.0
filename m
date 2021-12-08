Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89C4C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 21:57:25 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.3005.1639000644058562139
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 13:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5B921100003;
	Wed,  8 Dec 2021 21:57:21 +0000 (UTC)
Cc: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
 <20211203100259.54n7h7ghlqfr5tia@fedora>
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
 <20211203105151.3hez2atqxq3ye63h@fedora>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <56b2a1f4-9a8e-11a7-1ced-b9cbba5eda53@bootlin.com>
Date: Wed, 8 Dec 2021 22:57:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203105151.3hez2atqxq3ye63h@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 21:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2236

Quentin, Nico,

On 12/3/21 11:51 AM, Quentin Schulz wrote:
>
> I think all our issues always come down to this weird and inefficient
> organization we have for docs and common files between doc releases.
> We'll need to settle on something one day because I don't think what
> we're doing today is working :/


Thanks for your reviews. Good to know that the "transition" branch is
still in use in spite of what I wrongly believed.
It indeed, it's a good idea to see what other projects are doing. Maybe
what we are doing is unnecessarily complicated.

Look at Python docs (https://docs.python.org/) for example. They have a
switcher as we do, and also a left bar the latest versions and a
separate page for all versions. However, such versions are only shown on
the top page. When you enter one of the documents though for a given
version, the left bar is used for navigation between sections instead,
and you no longer have references to other versions.

Let's keep thinking about this, to find an easier to manage solution.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


