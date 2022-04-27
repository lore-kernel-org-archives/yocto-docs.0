Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F782C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:07:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.6316.1651054039530925335
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 03:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KX91E2s+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id q23so1782632wra.1
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FgeRRPwdzk0LyCyk8dqDAmKgqaKVEt/TjYbf8cWE4r8=;
        b=KX91E2s+1XjPlSxFD3rOzQSqygZOWjLbwmmZd43RpuJhhCkDk7lqPmv0L3L1Bo97ej
         /v1QXw4XLypBs37NgxgSmIDexNnHackyM3ZzOR/jwEOzbATWt8kCDT/0AvoIUcqds5D6
         16k8BLwExCFMjFtitMzBxKZzP5sCdTorBOGQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FgeRRPwdzk0LyCyk8dqDAmKgqaKVEt/TjYbf8cWE4r8=;
        b=HfQe9zJEamid+czexvpBEN5PKK98sAo84KHT8JC2VyvF6NikL/QmmN3mhtObChmkKc
         eIiJXgZAouqH4fLxdRgP6ue/A8WpYbKuizBvRVhXpOt9YvPCQ61xn5sZtrhQ73NYDkJq
         kaw/E99OoJYnNC1s4LB8/VBnB3WvVLYPGaKBUeNKMsB5ypQBaAVd3EASQ7IqG3hj2keS
         BaFjq9NpagP5fZOo1/81+8CO8+z4EjUv/ccdDMmZ5+LFMxUOYExkgkGMeyqhOYK1j+Cy
         LZkP85Ow9OwVQaBgBXsEcvQ4kBZKqBKnZCm2wJiG4nwMSLAdvDHtgZpB/yGVhfToKN8l
         OvhQ==
X-Gm-Message-State: AOAM533ge4L6nCocWU44UN95pJwDAWuYvlgJDrS0PVwTa8AGbFBxJQmY
	XiRHFRRSsdx/0jWR4/hMJEq/5A==
X-Google-Smtp-Source: 
 ABdhPJyfxN68Y3M+FmOA/cJyxbCPssHp1BiQsiXSJv2/7vDiyGiBOKMn02Is3/9fliq1goJdEnuVAA==
X-Received: by 2002:a5d:6e0d:0:b0:207:a4d9:7950 with SMTP id
 h13-20020a5d6e0d000000b00207a4d97950mr21371796wrz.477.1651054037815;
        Wed, 27 Apr 2022 03:07:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 j24-20020adfa558000000b0020ae9eafef9sm2514092wrb.92.2022.04.27.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 03:07:17 -0700 (PDT)
Message-ID: 
 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
Subject: Re: [docs] Sstate cache for version 4.0.999?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 27 Apr 2022 11:07:15 +0100
In-Reply-To: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 10:07:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2880

On Wed, 2022-04-27 at 11:34 +0200, Michael Opdenacker via lists.yoctoproject.org
wrote:
> Greetings,
> 
> In https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html, we
> suggest to use:
> 
> SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/4.0.999/PATH;downloadfilename=PATH"
> 
> However, https://sstate.yoctoproject.org/4.0.999/ doesn't seem to exist.
> Could we create it?

It needs to be 4.0 for all releases in the kirkstone series.

Cheers,

Richard


