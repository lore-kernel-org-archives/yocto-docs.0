Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B06DC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 16:47:59 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.9261.1648572477711522327
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 09:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kMq79LIt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E37AC0003;
	Tue, 29 Mar 2022 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648572475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oRTsATHaa6WT6aPs7zPtiCbzFPbXbjSZ+ERlXHISL9c=;
	b=kMq79LItZwtl15XdsvqYSqOvstdz8CAkJOFd0hFBBs+9+yl/+jFYeouZqONqOUqWLIFDVy
	sGxtw6cs2NHuIprjmgvQzzbUsKh8UYWKnRkOrJptsmB7CADcdFo8lRGbZr/beye+aRbng4
	gUBv3X1EDKVsP+WavUwZ1ILJDxhW3bWpoHFuUoI/sdPTcIain4sVmXeAGJ99elP+puFpDp
	OcJeqz2JInD+7GuNro/8mRyXtOP3QSOhypqicEgZRXg2laWxeip9cnMF8xHBPxEJK/3Ny9
	cl3DM2hBkvVoNi3ylOfPm5qz8TOtyCFpQ5xIvcjDSU/hB1cM08GkdOMwjbDVWA==
Message-ID: <96d820e8-55e0-c9fd-7cb5-287b59732a76@bootlin.com>
Date: Tue, 29 Mar 2022 18:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] overview-manual: Fix reference
Content-Language: en-US
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>, docs@lists.yoctoproject.org
References: <20220329103657.52364-1-daniel.ammann@bytesatwork.ch>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220329103657.52364-1-daniel.ammann@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 16:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2732

Hi Daniel,

On 3/29/22 12:36, Daniel Ammann wrote:
> Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
> ---
>  documentation/overview-manual/yp-intro.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index a863a7d16..86a8bf2b0 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -151,7 +151,7 @@ Here are challenges you might encounter when developing using the Yocto Project:
>     ":ref:`transitioning-to-a-custom-environment:transitioning to a custom environment for systems development`"
>     documents on the Yocto Project website.
>  
> --  *Project Workflow Could Be Confusing:* The `Yocto Project
> +-  *Project Workflow Could Be Confusing:* The :ref:`Yocto Project
>     workflow <overview-manual/development-environment:the yocto project development environment>`
>     could be confusing if you are used to traditional desktop and server
>     software development.


Good catch!
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
... and merged into master-next.

Don't hesitate to send us more!
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


