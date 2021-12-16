Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8AEC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:59:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.9216.1639652386339748678
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 02:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UVH3u+A4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so249042wms.3
        for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 02:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ui651UfMhOKYrXxH9aN4DoqLqD0nGDHSeGKcomVAXQE=;
        b=UVH3u+A4GTskTcfEBAPVsp/TdS7nt7cGvMXXoLbTbwp6h0nXolQSBVu/qS2QwdXhjw
         +WKc0jCJtu7jgoj+egA5PLQqa92kee60KkkXOyAy0cVKOXGjf5Bioove1AddUpX4Z7qB
         ANcEXEP2UAEDDLUNREqyjDKfP/eETMPhIlQaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ui651UfMhOKYrXxH9aN4DoqLqD0nGDHSeGKcomVAXQE=;
        b=S9DrBTA3W7tUL6z9vxCz16MwzQwQSBSfJuLTX4Nva2FMhpmmDb8o9PGhyjYw9Taubp
         a0a/TqhOMDhzJ3Eh4qwIL99kesC2PKkzCyvXK12+2jA8evik9iEcOovM3Q4mtqPS8OTd
         rg+VKfecsaCt55FatgZw9/6yKdEvid0JjKFsbuKcxQD4Pc1c3AWjC7rFCvF5t4+kXoxx
         EMer05SYKr2wdHiA2fyLZJBZVlqkNFTn0CN2HpOU4RarAcOVcMzCmzAwMbZFrqGjgj46
         uuxk81boaNHH4yBdSnZqOdA8fKJNbgGfJf+u3GTGdEnDY8NzCVtvvp7bFHpSIqOn8rCh
         Qlgg==
X-Gm-Message-State: AOAM533aGj9Id03VsQzwKGFIjGiUFwD9Vj9iSTSjiGX4PRi255lLvohi
	E3KojOrQIFkjaefHFp2zNca0qRhe3xy/7Q==
X-Google-Smtp-Source: 
 ABdhPJwBfzmRTAIx04uajNNcY0Ked0XKoV/PSkKRCaB0RqJU4tjaoprJyJhpsUWSljVO7d+fX8hzCw==
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr4384418wme.79.1639652384830;
        Thu, 16 Dec 2021 02:59:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828?
 ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 o1sm5677100wri.100.2021.12.16.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 02:59:44 -0800 (PST)
Message-ID: 
 <e3b5eab5515c4602140797c7a9133ef1b719a87f.camel@linuxfoundation.org>
Subject: Re: [docs] no mention in var glossary of SSTATE_SKIP_CREATION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Thu, 16 Dec 2021 10:59:42 +0000
In-Reply-To: <5e9071cc-fdb1-ec62-efa8-46ac447895a8@crashcourse.ca>
References: <5e9071cc-fdb1-ec62-efa8-46ac447895a8@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 10:59:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2284

On Thu, 2021-12-16 at 04:57 -0500, Robert P. J. Day wrote:
>   asked this morning about how to disable sstate-cache creation for an
> individual recipe -- i had no clue so a quick google took me here:
> 
> https://stackoverflow.com/questions/69674939/how-to-disable-sstate-cache-per-recipe-in-yocto
> 
> whereupon i verified that there is no mention of this potentially
> useful variable in the glossary.
> 
>   i'm not convinced that this is what the questioner really needs, but
> i'm suggesting that solution until such time as i can figure out what
> they're *really* trying to do.

This is one of those variables which was added as there was a specific need but
you really shouldn't be using it so I'm not surprised it isn't documented and
personally, I'd kind of prefer it wasn't, not that I can stop anyone.

It does have some really "interesting" side effects which once you use it,
you'll then complain about.

Cheers,

Richard


