Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F8C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 07:47:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.5342.1634888845087351610
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Oct 2021 00:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 141D860002;
	Fri, 22 Oct 2021 07:47:21 +0000 (UTC)
Subject: Re: [docs] [PATCH 0/2] Fixes for 3.4 changes
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <198605f9-2b47-afca-264a-9570b3b91e6e@bootlin.com>
Date: Fri, 22 Oct 2021 09:47:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 07:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2037


On 10/22/21 5:09 AM, Paul Eggleton wrote:
> In wrapping up the release notes for 3.4 I found a few more things that
> I missed earlier.
>
> Note: these don't need to be rushed into the release, as long as we can
> regenerate the online docs after merging that should be fine.
>
>
> The following changes since commit 160d672641c52338ba499edfb66339a10b088490:
>
>   ref-manual: document SOURCE_DATE_EPOCH (2021-10-20 18:44:19 +0200)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib paule/3.4-fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/3.4-fixes
>
> Paul Eggleton (2):
>   poky.yaml: fix lz4 package name for older Ubuntu versions
>   migration-3.4: add some extra packaging notes
>
>  documentation/migration-guides/migration-3.4.rst | 9 +++++++++
>  documentation/poky.yaml                          | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)


Both "Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>"

Merged into "master-next" and "honister-next".

Thanks Paul!

Michael.
-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


