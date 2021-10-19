Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4939BC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:18:55 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web09.13999.1634667534341957681
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 11:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=V4gWfG12;
 spf=pass (domain: konsulko.com, ip: 209.85.166.182,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f182.google.com with SMTP id w10so19321784ilc.13
        for <docs@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 11:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=794Dx1rGUskrVm55Y9xGks05SHM7jDVkYTNf3zLcNDQ=;
        b=V4gWfG12LmIr0Cc9rs12wUXkLo1falwAaKbSSJFoH7tnUIqXCAMWAXt0+si5Ci8LBt
         nIJVPXKX2FCxeOLWai8yXFAu/hK+9AL6jyTo9Q2aCRuvoPQUdK+fuESMCjwI7EMBR45B
         cRuL9v/aQ3WKzRxPOSsVTB9wRo915w5Ki0e4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=794Dx1rGUskrVm55Y9xGks05SHM7jDVkYTNf3zLcNDQ=;
        b=w5XArsWAX5H409jbPnRBVqcaxRVL/lfUioQYqLrqaGXR0IiZw2VT6sNUK22snuLwEK
         DPYqo8Fs51NTORSQIA/NYLxkVBry+hJSVPET+UBcyDABIdGIlVKl9UIqB/rHnphxMaor
         AWYny8Po/eSVcWCmr4rqXgqVaf7nHeK5JfyR5BMit4SgM9Aj+WuAy02H3ccefsP13kzj
         NpaJbk7zhrRMP8aUwv2+ukmOfjhNWeg6WTTxmRQ+l18hzobZycS7KnbCmrG+3X5seHgn
         Hsv5i4tg2ad81FY+tNycjBOF4G8IbSaTHy0xzQQyhmWBki+/gxl4BealNUqloa9c65i8
         hMnQ==
X-Gm-Message-State: AOAM530dtiFretWhJ0UsV0zFWTseW+amvjPz90wGtaSfGasyt9p+JWns
	M1F6255HiBSClUZdnFQ1DC4q4w==
X-Google-Smtp-Source: 
 ABdhPJy9anINv2Khdu8zquARXFNE9EwDXCST2bDKlqlQHyd6FdYhVTeDM+U6Q74IppvdJPGuXWQmNQ==
X-Received: by 2002:a05:6e02:20ca:: with SMTP id
 10mr21421558ilq.97.1634667533633;
        Tue, 19 Oct 2021 11:18:53 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 b3sm9027386ilc.36.2021.10.19.11.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 11:18:53 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:18:52 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/3] Improve reproducible build documentation
In-Reply-To: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
Message-ID: <a4697ab-c28-93f7-8479-64b3f21683e@spiteful.org>
References: <20211019141824.1980728-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 19 Oct 2021 18:18:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2005

On Tue, 19 Oct 2021, Michael Opdenacker wrote:

> This adds documentation for the BUILD_REPRODUCIBLE_BINARIES (mentioned
> in the 3.4 migration notes) and SOURCE_DATE_EPOCH variables,
> as well as for the "reproducible_build" class.
>
> Let me know if you wish to extend the description of SOURCE_DATE_EPOCH
> to give more details about how the value is computed by reproducible_build.bbclass.
> Should we extract the comments from reproducible_build.bbclass?
>
> I could also mention REPRODUCIBLE_TIMESTAMP_ROOTFS, but since it's not
> overriden in any recipe in Poky, my first choice is not to mention it,
> not to add to many details to the documentation.
>
> Your opinion?

Richard just enabled the behavior by default in master, so the bbclass and
BUILD_REPRODUCIBLE_BINARIES variable are gone there.  It likely makes
sense to still document them for honister (and potentially earlier).

Scott


