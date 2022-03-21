Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D9EC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:33:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.233.1647884007003755713
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SZ4teFZk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id i187so25511wma.3
        for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vj63pWuR9SxviFWx7tMaCx+5l9CMrtoTOvH0BeLOUjg=;
        b=SZ4teFZkvHfax9VLdY/ulsoO3Axvl/U3EfK793i7TukiSTsGgumviOxUikc6wSYWe3
         awrNK+o4EiARDwn3dNnbDPp2WgvJv1qmHKMsuHZJ7bSgokaFDlqBXQopyj5NgAgdQNcL
         OK5inAyO4aY1bLfb3zeOi3mVfwb+rwcgQcrp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vj63pWuR9SxviFWx7tMaCx+5l9CMrtoTOvH0BeLOUjg=;
        b=vGubFINAEPSUZ55WDd3bzAFgA68YcqbNa0otuaicV/hIYuJVP2DJr/J8qXVguEOkvP
         hu9jiRgWiUTNjk9sUXB5ku1xdwC1/2LHPhIk9qQTFPTnin/gVZSqqgfjHif00rQCSNl0
         g+CZI4be9stUC9v284KjMvsvLBXR4Zphg97DGfQ9d+Iml1hc6toqSNyhP9eO9Wz90S9T
         ihEZLck3kv4KYfg2lzXGZHFFcDeg21FnEA4MP2vBO3eg0k8qXK4BOb/Wr/7CLlmufjr3
         bEgxpnha7PuYXlOB06GWC2VZEbBgYbCEFVCJVCLq4W38Z2UlSiA68gBXJMdRZynMtU6N
         ByAg==
X-Gm-Message-State: AOAM533ZQtIHLY/Mh0VOjcIUC4Zi9T1VDG0rlJs8f9hRDRiCr2qDXvZc
	jPtpYUZ2BUD9pyasd+gM6olVVQ==
X-Google-Smtp-Source: 
 ABdhPJzA1P3L7Wecs7D0m6Mvy32bQ9M34+xuZ/2syFoOuX3zMmn6p35n45+oRGKzuZ+tj2qNBCGKrA==
X-Received: by 2002:a05:600c:1d88:b0:38c:b121:c669 with SMTP id
 p8-20020a05600c1d8800b0038cb121c669mr167230wms.150.1647884005404;
        Mon, 21 Mar 2022 10:33:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7422:13d5:6a39:d39?
 ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 e12-20020a5d6d0c000000b001a65e479d20sm5136957wrq.83.2022.03.21.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:33:25 -0700 (PDT)
Message-ID: 
 <6157cab4302631ca624837e94ac98181f81a2dd3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/1][transition] Makefile: Use switchers
 generated from master
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>, Nicolas Dechesne
	 <nicolas.dechesne@linaro.org>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Mon, 21 Mar 2022 17:33:23 +0000
In-Reply-To: <b23f24f6-29b9-320b-b949-48b7bbebd375@theobroma-systems.com>
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
	 <b23f24f6-29b9-320b-b949-48b7bbebd375@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:33:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2661

On Mon, 2022-03-21 at 18:28 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On 3/19/22 16:28, Richard Purdie wrote:
> > This allows an improved and custmomised switcher for each release
> > showing the current doc version, the latest in that series and the
> > latest releases for the project overall.
> > 
> 
> Not sure to understand the reason for this patch?

For every other docs branch we can run set_versions.py once and have the correct
information in switchers.js. For transitions, we have multiple runs of the
documentation generation and we want to customise switchers.js in each case.
This is so we can show the current version, and the current release series
latest version which allows the switcher to work properly.  To do that, it is
easiest just to fix the transitions branch to handle that.

Cheers,

Richard


