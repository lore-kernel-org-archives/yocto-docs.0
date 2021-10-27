Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC6CC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:45:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.9994.1635331540814800960
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 03:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BTOA4e6y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 b194-20020a1c1bcb000000b0032cd7b47853so810115wmb.5
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RAuf3pdSocayS1/AORTGU/h66HvuJQN8+S/4lbbfCZs=;
        b=BTOA4e6yhG64zrNIIBfi8TOLz+6vS1LdaqQORuTP71Ft6cotmBJLtFkkKY/IEvLCFz
         aupnux0vrm3P2KhyC7TzDINygwNUjiiMyJz1qnbzRcPUkGnyimcpWVZPazwT5Q/sLvzI
         4gNeTFlXIOF8TUfERsXiMZDLnvZKBj0i6vXzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RAuf3pdSocayS1/AORTGU/h66HvuJQN8+S/4lbbfCZs=;
        b=C45K6MgqD2WuNiS6Wk3UuNygpzy1aMJjK+YRustltx+EWGKwLcGqirw7iZSxw6pJC1
         o4iGXk59OVfMKSY8dTYCPvO+hAhJ2t13tXWIQQ3VNqwWbN/c6PbRg6e5idp5FDBzY9CL
         GYldRRckXrp4bIarq+OhWIRMwByRLPknkxXXTea5Vac3qE7JsxhLpF59+LdaE6XXCjlE
         0CzA1xkd4NT+RFcU4LB9ikDcvSdR1f/1ZHebmlXc6XgZ7+QTHcrVz0d7knov/VTGPEHU
         xwH/PVd59jnLrUi8j4h7g79VpcspydRhrsRUuXfD6nxmO7+PXWyH6ZGADRp3FqLX0ueN
         ajGQ==
X-Gm-Message-State: AOAM531tQWjkxgMhUk4V2MsWtBrA/+FUqIT4eqrBAJy+HIG2t2F/JZfX
	kapGPwybwN1Xep3hkAgzYisrYg==
X-Google-Smtp-Source: 
 ABdhPJzWjLh297aB1gDw4kRJ3CHaPI+C8EH6plAUphRsT1Jrlcgs2ruikPq5sn11kwjZfk1HjK6Usg==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr4911586wmh.137.1635331539243;
        Wed, 27 Oct 2021 03:45:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c?
 ([2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c])
        by smtp.gmail.com with ESMTPSA id
 f13sm4243978wrw.11.2021.10.27.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 03:45:38 -0700 (PDT)
Message-ID: 
 <b1ceabab92cf6b2b6894c85162d84af74aa4abe5.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] [honister] conf: update for release 3.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	docs@lists.yoctoproject.org
Date: Wed, 27 Oct 2021 11:45:35 +0100
In-Reply-To: <20211027104016.uqi7y5d2aluyvf4x@fedora>
References: <20211021084332.334075-1-quentin.schulz@theobroma-systems.com>
	 <20211027104016.uqi7y5d2aluyvf4x@fedora>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Oct 2021 10:45:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2049

On Wed, 2021-10-27 at 12:40 +0200, Quentin Schulz wrote:
> I specifically sent this patch before we tagged the release to be sure
> we don't have the same issue as on 3.3. But we do have the same issue
> now that yocto-3.4 is tagged and this patch is not in...

Sorry, too many different moving pieces to track with release :(

Whilst it was sent before tagging, the release was already in QA and the
revisions used in QA are used in the final release tags as if we don't that
causes a different set of problems/concerns.

> Can we settle on a solution? I assume moving git tags is deemed to risky
> which I can agree with but the issue(s) need to be resolved. Can we
> patch the tagged release from within yocto-autobuilder-helper doc-building
> process?

To clear this up for now I will take patching in the doc building process with a
patch or sed command.

Cheers,

Richard


