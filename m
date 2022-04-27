Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EDCC43217
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 12:35:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.7643.1651062894387380636
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 05:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DgE+naMa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u3so2318267wrg.3
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GcjVXoFTCgWDN6HxEU8tG1GDxD37DWgVZrGNnz1dugw=;
        b=DgE+naMajczR0OJwpsin2h+Vf+Cwe2TuDjjUrvKqd+8k6zioABqYTb5I51x6Re2fKy
         i7Qq7kvg4gv06/MHe3rmZe93ez03c1K5h9NMP49R4A+G/P5LXnZeb1+Wza2KclQG44+H
         rx/bOM0Mqz9xVA+pde9XQ6DtiaT+Vw/78P/dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GcjVXoFTCgWDN6HxEU8tG1GDxD37DWgVZrGNnz1dugw=;
        b=fzWTVUSCRrtPhqeXXBjsLQtc4xf/rKIypSWV7Wv+47hszXtRGDOYbuHPPJi2CS0N4u
         rFylyjkUf8rtM5k8n8kC21Kmq6+hGkrD4pHRi34jV8uXXNCJo/9Vri0BzhHnTdB50GWp
         QI/utzjbqR6hY2cBntsX78Q216W35bVwX6JQqwV8MyIaWF/8vINVYI4l9ckhQh5Mf9a5
         CF88kpPIfYiHgLEYPsbD8sooX92r1JO31jyCakba3SsCAxlPjPN1JK6cm6nWGFKqLYzk
         BzKjzG0wgzNk06pJcfxn/PYezFtK0Vmogw78XCAJ39zDcDelUXbHKY4+l1DLuZY4LgEo
         BDag==
X-Gm-Message-State: AOAM5318HVqbrLXA84SSjlR+UBW/1k6wSE/8E9JORGxTsZVdCpu3W+7O
	cnd2b1ABUZy/zjbGCTOdc748qg==
X-Google-Smtp-Source: 
 ABdhPJw5jM8CgKXY5iJH+TYlhHOFGzeFa+I6zDG48uU7Q1C4dl4ARxXvnD4v4f/7tyJ2tVeIhwafaw==
X-Received: by 2002:a5d:5983:0:b0:20a:8c8d:3e1b with SMTP id
 n3-20020a5d5983000000b0020a8c8d3e1bmr22501934wri.389.1651062892646;
        Wed, 27 Apr 2022 05:34:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm14210489wri.4.2022.04.27.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 05:34:52 -0700 (PDT)
Message-ID: 
 <ef98909a68e430037723f50dd17e2bac3291cb34.camel@linuxfoundation.org>
Subject: Re: [docs] Sstate cache for version 4.0.999?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Michael
 Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing list
 <docs@lists.yoctoproject.org>
Date: Wed, 27 Apr 2022 13:34:50 +0100
In-Reply-To: <683a9036-f436-66fc-f093-57234546844a@theobroma-systems.com>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
	 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
	 <d6938cec-65a0-b2de-619d-a21bbf1d7bd5@bootlin.com>
	 <7fd8456b6a72c1990a0f1008d88335276de5d808.camel@linuxfoundation.org>
	 <683a9036-f436-66fc-f093-57234546844a@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 12:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2889

On Wed, 2022-04-27 at 13:38 +0200, Quentin Schulz wrote:
> Hi all,
> 
> On 4/27/22 12:24, Richard Purdie wrote:
> > On Wed, 2022-04-27 at 12:23 +0200, Michael Opdenacker wrote:
> > > Hi Richard,
> > > 
> > > On 4/27/22 12:07, Richard Purdie wrote:
> > > > On Wed, 2022-04-27 at 11:34 +0200, Michael Opdenacker via lists.yoctoproject.org
> > > > wrote:
> > > > > Greetings,
> > > > > 
> > > > > In https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_brief-2Dyoctoprojectqs_index.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=CODaCOFarKzmVKW6oZ6KXyqtBSKtrUnzsHftrVzOvuo&e= , we
> > > > > suggest to use:
> > > > > 
> > > > > SSTATE_MIRRORS ?= "file://.* https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_PATH-3Bdownloadfilename-3DPATH&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=l8IYvM7AWJwXbzc2csFiERnsApA-RPSvBI9onBSHdXU&e= "
> > > > > 
> > > > > However, https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=OJMppY4I4Tdj_tKNPvS5Tzq52W-bscW1iuxv4y3hpfc&e=  doesn't seem to exist.
> > > > > Could we create it?
> > > > It needs to be 4.0 for all releases in the kirkstone series.
> > > 
> 
> Mmm.. we do have 3.1.x directories on sstate.yoctoproject.org so I 
> assume we should just point to the latest tag (3.1.15, 4.0 until 4.0.1 
> is released) of a given series instead of the original tag (3.1, 4.0).

Hmm, you're right. I'm confusing the backend non-release build configuration
which is by release series with the published sstate which is done per release.

I'm not convinced it should be by release but you're right about how it works
today. We should look at tweaking that as I'm not sure the current setup is
great.

> 
> > > 
> > > Unfortunately, I see no variable in poky.yaml.in for this. Could we have
> > > something like a "DISTRO_SERIES" variable which would be "DISTRO" but
> > > without the point release number?
> > 
> > Or a specific PUBLIC_SSTATE_VERSION variable or similar?
> > 
> 
> I think we actually should have DISTRO set to the latest tag available 
> in the series and not have the YOCTO_DOC_VERSION used in sphinx files 
> (it's necessary for conf.py though).
> 
> What do you think?

I'm ok with that.

Cheers,

Richard



