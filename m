Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3536AC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 09:04:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.7957.1709715875769936485
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 01:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lZ9lvWBS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBC0224000B;
	Wed,  6 Mar 2024 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709715874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGUHltSqNoS3/yCcofV9tNrepFpfXoqgsUVQIsisqjc=;
	b=lZ9lvWBS2Cj/EScBnkcxuxoRzsFu3F5+8+7dXoV4NfEBGT3r0VSl1qugk2+vmd4jm9CLE6
	JUO9rq/ivhNtvDdwsx/dXIZEnS21gfP5UxmgL2lM9C1pobkw0/iEuMjFHxp6bfSnwhX3wD
	oQJ8RmjIDs2+hB8rH1bBnkLFflOdq2dvUM9yJCmtAQ2hHYgvrnF2qLb4z3qcdZXZ4D7Puc
	W7dPFUmOl+oLW75Tqmn5rqZ710af5cnRKb7QdlXzpUkanNgmufbNFlFTaggQw4F8I+uBGp
	EXl3u10XIkIv7/DOFxjwE3aZvolMlD4wCEV8LATLg+CzKXWDgBnh8xFb8rlfSQ==
Message-ID: <6f132256-1f3b-43b8-beb3-2d3e2c7f7fe2@bootlin.com>
Date: Wed, 6 Mar 2024 10:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] contributor-guide: Add notes for tests
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>
References: <20240305164651.5132-1-simone.p.weiss@posteo.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20240305164651.5132-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Mar 2024 09:04:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4939

Hi Simone

On 3/5/24 at 17:46, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> This adds some hints that and how changes should be tested when contributing.
>
> Fixes [YOCTO #15412]
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
> v2: improve ptest wording and fix spelling
>   .../contributor-guide/submit-changes.rst      | 37 ++++++++++++++++++-
>   1 file changed, 35 insertions(+), 2 deletions(-)

Thanks for the update.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Merged into master-next.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


