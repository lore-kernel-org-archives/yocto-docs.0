Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861CBC43217
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 19:26:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.363.1649958411814620949
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 10:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f/iX0IFH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6391CFF803;
	Thu, 14 Apr 2022 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649958409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfLG0MLYNr9zoPgRlQYqI/rfN3LPkXwEnaARiZH3km8=;
	b=f/iX0IFHf4UrkEZ7zu1i5CeJRd5+qudtAuQ6ywkLZF2WnbyHqcdU0gzffDXYS8xaeecj5v
	PiOx9rAsQhIsTFtos4+b2R+GWL7/gAWCvAYNzDy7HuDDrNgykcUKWD0A835jbtWDGveJHV
	VR2wKM+ugYWP4bNtyXTMQum7CTQVz9RAnD/UsJfua+xfAZasg6uD7Oks9TSUt8pD/vwc+B
	lED9UKv9dq06G0Y7XWVjCuBlwFDzDGOyMi139KooHwpFc6oT2GKXbJm3gok9RY4XnAKQR5
	vO70PFZxHs2PoaX40WKVAz1tXgoGAwwCNar/BQlV8VWkOtjqTz92bUOBFtS6uA==
Message-ID: <7853fd42-b65e-65e1-746a-1e7c9a4c2b7b@bootlin.com>
Date: Thu, 14 Apr 2022 19:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH v2] yocto-docs: profile manual, added banner at the
 top for direction to most recent website for version 3.1.3
Content-Language: en-US
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>,
 docs@lists.yoctoproject.org
References: <20220414144718.63967-1-abongwabonalais@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220414144718.63967-1-abongwabonalais@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 19:26:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2773

Hi Abongwa,

On 4/14/22 16:47, Abongwa Amahnui Bonalais wrote:
> Signed-off-by: Abongwa Bonalais Amahnui <abongwabonalais@gmail.com>
> ---
>  3.1.3/profile-manual/profile-manual-style.css | 28 ++++++++++++++++---
>  3.1.3/profile-manual/profile-manual.html      |  8 +++++-
>  2 files changed, 31 insertions(+), 5 deletions(-)


Thanks for the patch, but which git repository (or branch?) is it
supposed to apply to?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


