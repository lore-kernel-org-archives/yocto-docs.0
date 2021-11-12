Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23358C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:11:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.16035.1636726261148654531
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 06:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=StujwgfY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d24so15819766wra.0
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 06:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LteyCcEFvqdjaldPQ/tuYST8bs3uEqk7a2r0DMI19do=;
        b=StujwgfYFQxJ2Fjk+iWfBus/OAKt+tOfFCai5mWAHCfqBnVMtaEGbB1iUehpG1OLDz
         93HYk5v4El0XQKlahYxWtht5r/i0kNQCpCf27fKwbnQXpbajZ0opaU19CbbKwKYqtrz6
         MVROT/hkHmu80CCw0LDgp+kFc1b3jJ24VIlP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LteyCcEFvqdjaldPQ/tuYST8bs3uEqk7a2r0DMI19do=;
        b=HzEBkETrxuFi48kfbuUrfgg+hpWOqyAdv3tgUKCDVyFMqgOOlyBnHPyvvGOeFHEcxY
         dsSns5Qeo47yd8sMU0PJu3LnvOwRL73RvckVwr28i+d+h1nWplO2706/82EBdnz/2pNM
         arHNoWBh5JusfjwZuWwvNz73aZ/6PrHwkwM+HXcJUd01QHpahOOskMobQYOLnJxIgJLp
         0UxYeKPjlrwmt1w1glFFJPPO5AnZZwlOk+pZn3HopCaOC+mHn4RZ6GvyfnRMgfmfcNwA
         n3yNAj9R8Fb3elvBD+CGuKnrzGBk7hYyWlGLIHUzlVEdpA0b/5UH7CQEkujkCOCBOYDZ
         hhdw==
X-Gm-Message-State: AOAM533gRKiS6SMbxjYrwzeM40HBi2LsYeC+TxNOogtICx9+maeD9bG3
	GrIiMQpP8fu8Tg2OYwSW5gLSlQ==
X-Google-Smtp-Source: 
 ABdhPJxAI0ijbtrxcY4RIoIrASmgBSXeJK5UoP8BL0QKNhPjFMpAhVQ05tcUE9TryUpWVWCZjk60Mw==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr18701171wri.416.1636726259286;
        Fri, 12 Nov 2021 06:10:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 w15sm5750127wrk.77.2021.11.12.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 06:10:58 -0800 (PST)
Message-ID: 
 <95a5685baef118dc72a39cc063fc47e7e77c4f8e.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 0/4] Supported distros update and preparation for
 3.1.12
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Fri, 12 Nov 2021 14:10:56 +0000
In-Reply-To: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
References: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 14:11:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2136

On Fri, 2021-11-12 at 14:47 +0100, Michael Opdenacker wrote:
> These are updates already applied to Dunfell. Note that I added
> both Fedora 33 and 34.
> 
> Is it OK to assume that openSUSE 15.2 is supported on "master" too?
> I'm finding success builds on this version, but I'm not sure this
> is sufficient, and it's probably not up to me to decide.

That is ok since we are testing that combination.

Cheers,

Richard


