Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FDDC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:44:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6763.1634805895060653566
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=daCAs+au;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id o24so14699869wms.0
        for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8d4AWZv+u+Qu+Omy6tLcRFl2nSiV+a1Kc4QRGEufg50=;
        b=daCAs+aurzUiyzsPOsYN0J5iasQsix/ruWC0Fpqxbje6NlpXutPiDE8SkS1HjSqgoR
         EP72A/V86qiwHww1UKgjCtywXz6cvQSS5MG4IeetcEPOyN0tASCAUvd4lonOgckYWOOd
         q2cxwvBExCZNqHbWrPF8i2QpoHu8B+idRznpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8d4AWZv+u+Qu+Omy6tLcRFl2nSiV+a1Kc4QRGEufg50=;
        b=oTSoZwUFCB8SFe05Z6Qb44DjLQTWygA92yRRgUxkdqZrKxxEGT7qqVmp+C4Y30M2/d
         42DOPgTiZ5QVWvI7fR7szR8kbDMHhzpi31XgwKVKozPKvaaOR2OcTXC3kxZv7DFREWwL
         UT8ui6AYcRGOYUbd5dFqxWQ1OAh6Z6ksXlY8stDacmjbv08D1H9/ll0St3Ym/44NSztt
         cI0gPqRwD47dUXvCKiNJoFpJiTAM1Qp6cqKfYNcHNzDMfDVqhe9PDfTaFiVUHCfys3QG
         6YjFht3YoOKmh6DkhYxBVvXsvBEISRfDZdgzQTp2DsLSZN+YWPf4E7015rdTooeTzlgy
         iBjw==
X-Gm-Message-State: AOAM5325DtJDwgjNK6mpzXIEfKnu9yylaaeS6w91LxjMG03u7wqzEG5l
	/AzwxEVKuxyTvJfYvVjQcXd3Iw==
X-Google-Smtp-Source: 
 ABdhPJxAHPGWw7BuEeBBdD9B5hjqrYoY6PlLbJFKBWQWCaCwnDDWYz6Xn7icNIXCsaZiyDEZCIUtgw==
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr5046842wmq.77.1634805893459;
        Thu, 21 Oct 2021 01:44:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94e5:d60f:488f:1d10?
 ([2001:8b0:aba:5f3c:94e5:d60f:488f:1d10])
        by smtp.gmail.com with ESMTPSA id
 f186sm7035368wma.46.2021.10.21.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 01:44:53 -0700 (PDT)
Message-ID: 
 <a22eb2f4ecea883343735481dfe42f28c17f1e38.camel@linuxfoundation.org>
Subject: Re: [PATCH] [yocto-3.3] conf: update for release 3.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org, michael.opdenacker@bootlin.com,
	nicolas.dechesne@linaro.org, mhalstead@linuxfoundation.org
Date: Thu, 21 Oct 2021 09:44:49 +0100
In-Reply-To: <20211021083834.k2rkz5robufkdkyn@fedora>
References: <20211001153924.93354-1-quentin.schulz@theobroma-systems.com>
	 <20211021083834.k2rkz5robufkdkyn@fedora>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 08:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2020

On Thu, 2021-10-21 at 10:38 +0200, Quentin Schulz wrote:
> Hi all,
> 
> Gentle ping.

I think we're all a bit nervous of changing this since tags aren't meant to be
changed and we're not sure we've thought through all the implications :/

Cheers,

Richard


