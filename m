Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EDEECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 04:51:11 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.2685.1663131060740549225
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 21:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pcjVKDV+;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id s6so12102559lfo.7
        for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 21:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=w4Wn3RNTMGMHSGIcaDnWZF46O6F/w2tOU2t9TLnBXQQ=;
        b=pcjVKDV+V0ALI/UO9TlgtCsLcj9NdWFomtBJ/+UYpQxUkXlaSgxrFHdxCnyFM1g1BL
         BhCES+Xva9A/lqDbUIf7HZ8F/8oPBP5dAqr0AUcY2IrYGjs1bzYzc31XDWbzSTKXJ8pc
         EJf9A0zIovEJjgSs1KzpxfSw4LpsZqSSx8lnI0iQkYyM/Bs0ZMtsm4Bonu3jKmf1EBfY
         Wi5pSVwPCTH98NdVTigoXi0dlAIomHccSgMDR35n6SIZyd7J7AXwI1evwOGj5ilZB5BS
         0A70s6OkFNJa8eTuRY4EAaSK6GYmAW04vlKzGa+NzALIYzGUAlD92rRqDFWg4NcDrbeq
         EJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=w4Wn3RNTMGMHSGIcaDnWZF46O6F/w2tOU2t9TLnBXQQ=;
        b=sM1PQhRYBxTbIGZLYUFqssxD4O/gnBl8z3BaLwxEtMGJOZJoMv+3Y4fU90krpWfQC5
         nWivk90mWlUoveY3SmJNC470nGcHZSdzHqzUaf4oc/0RWK+u78jTi652eZWF2lmYiNwQ
         SF/NLKDb4kQ8X1BAAsSUHs9fvSQYBVEgtFOwP/B68lhAyAcv/T4wuiiWEOGqnssZAh29
         x6xeCQY9zGVVPOTJeZDRQJp/g/22Eck/Ee4QUpSAojyhfK6Nz2OyNtwzMI4RRuYFSjxj
         3JDkrlNjU3qCnP728skXEgfUzH/FVQxsVVuZhkqjHLTX4Lr8cZV8M4JwLsv8Q2WQWBCX
         Ukfg==
X-Gm-Message-State: ACgBeo0ZohMG9DJttGb1ypZVIq5eVUKhATDdKtW1Zg6uk5BgUIVyncBN
	HIi27nSA4w59Wk4PlVZMes8xFDPBvHs6gRJsQUg=
X-Google-Smtp-Source: 
 AA6agR5rilHLcg2T/8Hnv++cNVRZK5tH1o8//x6HrNmqJpzUtDzPKAU5g/r0XAlofrRy0/fCKRoT2dzJ8OhWKEXl7fg=
X-Received: by 2002:a05:6512:1283:b0:499:d0a3:3ca8 with SMTP id
 u3-20020a056512128300b00499d0a33ca8mr5718520lfs.665.1663131058727; Tue, 13
 Sep 2022 21:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
 <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
 <CANNYZj_mTijA18UCxpTVa9V0k7pPakqvAGBLWBS39UDBCHS8RA@mail.gmail.com>
 <0c6e4dbbf24d4221ba58543cfc48a498@axis.com>
In-Reply-To: <0c6e4dbbf24d4221ba58543cfc48a498@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Sep 2022 06:50:47 +0200
Message-ID: 
 <CANNYZj-L_TKTv6tniiRw5-d+Nd9LqpKRcHxcbjN4_f3tgN3ahg@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>,
 Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Sep 2022 04:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3163

On Wed, 14 Sept 2022 at 01:59, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> And I think he documented it exactly as it was intended to be used. See
> Paul Eggleton's comment:
>
>   One way to do it is to set TEMPLATECONF (an environment variable, not a
>   bitbake variable) to point to a directory where the custom conf-notes.txt
>   can be found. In a repository this can be set within a .templateconf file -
>   hopefully we document that somewhere as well."

Paul didn't think it through either when he wrote this. Specifically,
.templateconf must be directly next to oe-init-build-env, which means
it cannot simply be 'in a repository'.

You can't have it both ways: demand that this is kept in the docs, but
without explaining how to actually make it work (using standard
tooling). Also, your setup
is unnecessarily complicated to begin with: just skip the template
assembly altogether, and write directly to build/conf. Eventually
you'll be able to do it in a structured, supported
way with fragments, which is what we should *actually* be talking about.

Alex

