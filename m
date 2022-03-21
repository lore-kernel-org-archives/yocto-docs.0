Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E94EC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:14:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1090.1647882863458301282
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hmBfC2lE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so2669053wme.0
        for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=J1lM6t3bnuPDF4av+U58YcYPyjAa66UzIySm+Ct4hG4=;
        b=hmBfC2lExXlNaibQ+0xLgRPi9MpbLbQUnGdhirgn/i/2RpR5VqlGUedBIrcYHRz5gD
         fy5qfy2Ec1Mkt4PZdwOYW2uPGAKn6xe1nFkT3BxutnN78JkpVfavY9mvEI5woq1qRQRB
         MuOHDgdixKJHoeQVLdx7Zpv2nA9YjhMLlvmpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J1lM6t3bnuPDF4av+U58YcYPyjAa66UzIySm+Ct4hG4=;
        b=1nqRiStNidQeD8PEmM1/mqt329b4lD4/nuYglVX4oBJC1+g5JOkaCLkMe/5axb/pot
         uEFwuT6hfZkTgebpgqzZfQUqrZ8ORHum4ZggiTjWNEJ9k+SxfCwKLch67W3GTOtpdQ9T
         iMBe+n5yZD1CmU7q7XzmEcsihgiHDvyZ0DCGFLz4f7zEecPNPJFf3nJT7YXOwtnS2NfW
         5k622vEFtAr78/vVuyHpsXpOnVzLZJ2Nx0raat7Njv3aikhoXRdtJqxUL1/x4Z058ruR
         r3w6ar+PUEbkyA1mL1Gyj4sSxOKIufd1t0xSlR8+BjNAU/PK6wZ5cclZn6qkF+lxx7JB
         KJRg==
X-Gm-Message-State: AOAM533c6Su9DCqjsuu/J9vBGDBN9pyRQPUnT5uywDd7KqZFL7RAW3+U
	TrlI+riP4GsP/DsgBCYUzLUl/w==
X-Google-Smtp-Source: 
 ABdhPJwFpgm4FJrmqa6+M7C6XE+2W3HUGsjsfU8uBKjW62OrJtdxwgVvTLuZyGBRMZR7H+V87WJq6g==
X-Received: by 2002:a05:600c:4f82:b0:38c:9185:1ecd with SMTP id
 n2-20020a05600c4f8200b0038c91851ecdmr97570wmq.130.1647882861894;
        Mon, 21 Mar 2022 10:14:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7422:13d5:6a39:d39?
 ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 r186-20020a1c2bc3000000b0037bdd94a4e5sm64801wmr.39.2022.03.21.10.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:14:21 -0700 (PDT)
Message-ID: 
 <09de573178a10bc0e8d639a26531cdb2c00438fd.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 2/2] set_versions: Handle older non-active
 releases
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Date: Mon, 21 Mar 2022 17:14:20 +0000
In-Reply-To: <300671dc-db7a-1005-e84b-7987dd050294@theobroma-systems.com>
References: <20220318162945.1072835-1-richard.purdie@linuxfoundation.org>
	 <20220318162945.1072835-2-richard.purdie@linuxfoundation.org>
	 <300671dc-db7a-1005-e84b-7987dd050294@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2658

On Mon, 2022-03-21 at 18:11 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On 3/18/22 17:29, Richard Purdie wrote:
> > Ensure older non-active releases are shown in the switchers.js
> > release list.
> > 
> 
> We're currently showing EOL releases in the docs too. I think we need to 
> discuss this first before removing EOL releases in the previous patch 
> (pretty sure I commented on another patchseries questioning this 
> decision). I don't think it's a good idea to mask them but I'm happy to 
> be proven otherwise :)

I'm of the view that we should show the currently supported ones by default. You
can navigate to the older ones or follow links to them but we want to give users
a strong hint about which versions they should be looking at, and hint to them
if they're on old versions...

Cheers,

Richard


