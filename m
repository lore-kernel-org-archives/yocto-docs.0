Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84361C636F5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.9748.1649928854775322375
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 02:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fLKo0xIE;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CB693100003;
	Thu, 14 Apr 2022 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649928853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHjfC/7Z7kC6J/Pm73d0zVmySSSWWDVxmgqJt2z1i+U=;
	b=fLKo0xIEz8Sh8P92PZzuKPsilxw7yT8rUXxd1Knz0wu22WbUCdVYms/u+6n4u6TlP4z5YP
	flvp1czTVjwK4GAcEkw9Z1TdJ9XDAAhKIRragFWvKma3BZipOI1yEoDoZqf0OqzaRY5OfB
	iTSCWmI0NV2DjXZihLjah+EdeeVCFn6eKZ7R4QkCZv+da4g5oPd0HWC+0nicyLy3oNUChp
	wbvn2PMwhwhd03aAWi5wKaYE+7vZoA9UqrtjLAbhm6PHQY88T+I5hlkG9vb9nlAoWRqiSz
	g+v75lLrcYuW/ShupowFMb8pOp9zQgUNV8AS8VK5FDzDLFv3yBj6zru9VWOzXQ==
Message-ID: <eca28d2a-8e3f-1fae-4a03-43bb5c7e08f7@bootlin.com>
Date: Thu, 14 Apr 2022 11:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH][transition] transition: Update urls to
 https://docs.yoctoproject.org/
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220413175330.2187450-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220413175330.2187450-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2765

Hi Richard

On 4/13/22 19:53, Richard Purdie wrote:
> We now use docs.yoctoproject.org so update the urls to point there
> instead of at a redirect.
>
> grep https://www.yoctoproject.org/docs/ * -lrZ | xargs -0 -l sed -i -e 's#https://www.yoctoproject.org/docs/#https://docs.yoctoproject.org/#g'
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/transition/index-0.9.rst   |  4 ++--
>  documentation/transition/index-1.0.1.rst | 10 +++++-----
>  documentation/transition/index-1.0.rst   | 10 +++++-----
>  documentation/transition/index-1.1.rst   | 12 ++++++------
>  documentation/transition/index-1.3.rst   | 14 +++++++-------
>  documentation/transition/index-1.4.rst   | 16 ++++++++--------
>  documentation/transition/index-1.6.rst   | 18 +++++++++---------
>  documentation/transition/index-1.8.rst   | 20 ++++++++++----------
>  documentation/transition/index-2.1.rst   | 20 ++++++++++----------
>  documentation/transition/index-2.5.rst   | 22 +++++++++++-----------
>  10 files changed, 73 insertions(+), 73 deletions(-)


This looks good.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


