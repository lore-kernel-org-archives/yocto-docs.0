Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FE0C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:45:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.10502.1638960346516639415
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dilpgxoV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o29so1468439wms.2
        for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 02:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ChgxpRodIpQ+ikylUsKGZi8P5Rel2IR7qXsyo4zjaNo=;
        b=dilpgxoVP3djFO3oDbox+9AWugP36b4ay+G47VghfuRTsO4xcNxigQoaG/zCc2gAvG
         8zNjbMPlUan3lA09JILZAzUvFJ193XHlb+SMeN799OpkvGHtSWFzr3qA8DdvzBJvGd3Z
         qIHKNdHHA9Etsx/4wMHGqz+K/5csU0/tAnBQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ChgxpRodIpQ+ikylUsKGZi8P5Rel2IR7qXsyo4zjaNo=;
        b=1MNhDAal5x8j3gozJC4e6sL1AtZq9ESDo0vAN4P8q1feMO8Ba9MgS7eW1UKliW1OTY
         foBadRlX9882kGU5y2trQg50CowPC1wbAPiTNLMjyNX8MOGZSA/fyRYHEwWxBTNWWsUq
         YvxyY2hT8xbNECp4GriV+lFZ4X40FhctyVW89mEjpnT5+IYcW24WOnxMfUKuALB5fd5N
         J0XfVu1fXLMVHS4APa8uoKUJA2fkNtc+/i7FyNlM878AC3u4zy8Vo5S5lpccF99Pen/s
         eKU71W+UIRAOY10ZdMmS+8ObwpT9qe9T31ILB6eR1ZGi0HYBTXne/4Zxu2ISbNtq1bGK
         XbsQ==
X-Gm-Message-State: AOAM531tKMJMnL78cqb5+BCQkGvfqc/eHFMvvbaynS1e6+7AZSVM5OIp
	QDtiiKULHfb5CJTWNL/FH8/Kow==
X-Google-Smtp-Source: 
 ABdhPJznNN/204bZY7J2kzO1CYEoHZTQHHvFj+5u62wcZuF7YWbRaKWXx9XFT5oEI+3rTCb4AG4eMw==
X-Received: by 2002:a05:600c:4f4b:: with SMTP id
 m11mr14843834wmq.151.1638960344824;
        Wed, 08 Dec 2021 02:45:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1bd:cff7:4306:4546?
 ([2001:8b0:aba:5f3c:e1bd:cff7:4306:4546])
        by smtp.gmail.com with ESMTPSA id
 m1sm2223496wme.39.2021.12.08.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 02:45:44 -0800 (PST)
Message-ID: 
 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 08 Dec 2021 10:45:41 +0000
In-Reply-To: <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
References: <20211206150401.30444-1-foss+yocto@0leil.net>
	 <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 10:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2228

On Wed, 2021-12-08 at 11:41 +0100, Michael Opdenacker wrote:
> Quentin, Peter,
> 
> Many thanks for the long patch and review !
> See my comments below...
> 
> On 12/6/21 4:04 PM, Quentin Schulz wrote:
> > -For automated deployment, a "master image" is installed onto the
> > +For automated deployment, a "golden image" is installed onto the
> 
> 
> I was about to suggest "reference image", but all things considered,
> "golden image" seems to work better.

I don't know if it is just me but "golden image" really doesn't work that well
for me. "controller" would be the terminology we use elsewhere, e.g. the
autobuilder. It says what it does...

Cheers,

Richard



