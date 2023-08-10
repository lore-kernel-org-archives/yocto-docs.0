Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA10C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:42:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.12369.1691653348222160889
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20221208.gappssmtp.com header.s=20221208 header.b=ZrAmRiVt;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.167.42, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe0c566788so834236e87.0
        for <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 00:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20221208.gappssmtp.com; s=20221208; t=1691653346; x=1692258146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdyP9P8wCUvlcH1p/6TGiYg/2419rrVCwstlldw1sFk=;
        b=ZrAmRiVtkyqQmrinHUga8Gz5pG58nrycdC38GhwXdRl/YYB3ojWFWwDwObaATlY1Sr
         3NygBzSvTC5bw7v1XL2k/H2GLN6YcWw9Bh5Z3IAkIMbAF2c604nJQlHKcfnc2XFl/7qO
         5JcSlbN8yre0AkEvn4OqbYekNEY3qD696E/UNS0mFx0XAK2eopgX9H/sVGbVPoqtNeud
         gJbDfi6vPULt2IYN2Nm/Rb/UZgE7Jkgjg42gNHF4oUowsqs/2cqb8HS9qb6PfhFkCPzC
         w10lZOZrUZuakYC0NVyNmoz7mFILlSBqCL4pids0gmkD01ve0rM5ydXzaG6m5u/utjhm
         tNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653346; x=1692258146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdyP9P8wCUvlcH1p/6TGiYg/2419rrVCwstlldw1sFk=;
        b=YwJkj6eCOHyS+H38jTmQKaJQK+QrwzCMEnUYmdfx+83H/BzXg5Ij6CAIlYRGqLCY3l
         k2AG5fZo9rnqOZK4FRHKPS4ggn5bST+pRI9avshYgC3Zak/tT4frh7sKhdrQe/G+2otM
         z+Dk2FsoweXT+Ld4YuFrPE35EyH/nRxLoGp0IBdjCn2LxVu9PJFY0CrKBI/xzj8DW06k
         FWzA6u3iltDNYSXpn77KPcCoXDEFYeN1unXCS6FHEvPGNsltQnwVrGLqroF5GkT7a9Y7
         EetA3pPl02BrGYWrZdDbjlCwvWoCzObEp6p5MtcAZg9tjT8goqldJL/zLgIufJuRJf35
         ZClQ==
X-Gm-Message-State: AOJu0Yxu9lu9k/JICXDFSAA8UU8fNXhYymrXe1oALYe+HlrYVKtOklCO
	2YB5A/P7i9kwx6r/d33uTuGSvg==
X-Google-Smtp-Source: AGHT+IETJcSZOIVSUR6aUk0Y4XlrA2WxMlwgcqyESsdWfxurZ3QVk928Py6DEcyFdPWYassTriCVMQ==
X-Received: by 2002:a05:6512:3054:b0:4f8:714e:27a8 with SMTP id b20-20020a056512305400b004f8714e27a8mr1515466lfb.0.1691653345903;
        Thu, 10 Aug 2023 00:42:25 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id kf3-20020a17090776c300b00989027eb30asm546897ejc.158.2023.08.10.00.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 00:42:25 -0700 (PDT)
Message-ID: <47c260f3-2057-9c3b-1a56-e9c430142668@bytesatwork.ch>
Date: Thu, 10 Aug 2023 09:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [docs] [PATCH 2/3] contributor-guide: add section about why we
 use mailing lists
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
References: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
 <20230809142520.226581-2-michael.opdenacker@bootlin.com>
Content-Language: en-US
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
In-Reply-To: <20230809142520.226581-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4130

On 8/9/23 16:25, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   .../contributor-guide/submit-change.rst       | 41 ++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-change.rst
> index 2555767102..573491ecbc 100644
> --- a/documentation/contributor-guide/submit-change.rst
> +++ b/documentation/contributor-guide/submit-change.rst
> @@ -8,10 +8,49 @@ Because the system is extremely configurable and flexible, we recognize
>   that developers will want to extend, configure or optimize it for their
>   specific uses.
>   
> +.. _ref-why-mailing-lists:
> +
> +Contributing through mailing lists --- Why not using web-based workflows?
> +=========================================================================
> +
> +Both Yocto Project and OpenEmbedded have many key components that are
> +maintained by patches being submitted on mailing lists. We appreciate this
> +approach does look a little old fashioned when other workflows are available
> +through web technology such as GitHub, GitLab and others. Since we are often
> +asked this question, we’ve decided to document the reasons for using mailing
> +lists.
> +
> +One significant factor is that we value peer review. When a change is proposed
> +to many of the core pieces of the project, it helps to have many eyes of review
> +go over them. Whilst there is ultimately one maintainer who needs to make the
> +final call on accepting or rejecting a patch, the review is made by many eyes
> +and the exact people reviewing it are likely unknown to the maintainer. It is
> +often the surprise reviewer that catches the most interesting issues!
> +
> +This is in contrast to the "GitHub" style workflow where either just a
> +maintainer makes that review, or review is specifically requested from
> +nominated people. We believe there is significant value added to the codebase
> +by this peer review and that moving away from mailing lists would be to the
> +detriment of our code.
> +
> +We also need to acknowledge that many of our developers are used to this
> +mailing list workflow and have worked with it for years, with tools and
> +processes built around it. Changing away from this would result in a loss
> +of key people from the project, which would again be to its detriment.
> +
> +The projects are acutely aware that potential new contributors find the
> +mailing list approach off-putting and would prefer a point-and-click web GUI.
> +Since we don’t believe that can work for us, the project is aiming to ensure
> +`patchwork <https://patchwork.yoctoproject.org/>` is available to help track
> +patch status and also looking at how tooling can provide more feedback to users
> +about patch status. We are looking at tools such as ``patchtest`` to
> +test user contributions before they hit the mailing lists and also at better
> +documenting how to use such workflows since we recognise that whilst this was
> +common knowledge a decade ago, it might not be as familiar now.
> +
>   Finding a Suitable Mailing List
>   ===============================
>   
> -The Yocto Project uses a mailing list and a patch-based workflow that is

Oops

>   similar to the Linux kernel but contains important differences. In
>   general, there is a mailing list through which you can submit patches. You
>   should send patches to the appropriate mailing list so that they can be
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4121): https://lists.yoctoproject.org/g/docs/message/4121
> Mute This Topic: https://lists.yoctoproject.org/mt/100643892/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

