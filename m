Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB29C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 10:24:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.6427.1651055079661663215
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 03:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DmDD3oQN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t6so1829717wra.4
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=56Mn20hBX+NM0tRL2M8VK5GduZTdLteUYc41VE6B/EQ=;
        b=DmDD3oQNC0taQHWLM8vYU+hHoSmb7AehETPI9V4hH4aYx3MF4MlJdxQKzOySFFGSSM
         NF9S04CkJvZrLj6XgM3PDuXubaTsrvj9u3bKVlDQsDnr2K5k4i+6DmlVPvgL7a/KJbFJ
         NjiPVhlN7chYr6q+VDuI5QzJHHTwC62IKB/uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=56Mn20hBX+NM0tRL2M8VK5GduZTdLteUYc41VE6B/EQ=;
        b=TamioXkFrvwvGIB3GaCaX1SfxhhlBbFwo0+AG+Z+19LE/x+wGDkQceUZcLwOfNxBhL
         RB5b5rhnImIqOYlm/mDBWql7xChe+rh7TIHeMlmyVslz36A+SCuhTqKtqjjuhk+kQRJv
         ks3x+I71+QO1+2VZNC7oreQRA4Jh5dvtlOqwoSBe6haXlabVU0edC+t2ybsmgdDCtSM4
         lcwconibF/u/J5MHgL32b9BxziumVksX0vBZJXByfWzRmDdS1NCrIGooqgLAZ63modYP
         oYgaIAlqYhA6YaLoqyJ+t5hbrou5n/C8VZ0dIleK4RDzXx0JPR7e2wLSJULPMNfHcKiE
         TxaA==
X-Gm-Message-State: AOAM532bU5j9Xuh2HGx90v2rtN0KgefJl68yVTqpxjeGpLZ9g/3GrDo1
	BaOyqCFetOC5CEZb23ufJGLElQ==
X-Google-Smtp-Source: 
 ABdhPJyHQBUl59MNmsP2UTKp8cYkSM/7T6TiHyXgZBcwFxLwTtSEbLofnGc9+FLMVMVIgi5OYkevrQ==
X-Received: by 2002:a05:6000:1acc:b0:20a:a00a:47b0 with SMTP id
 i12-20020a0560001acc00b0020aa00a47b0mr21890262wry.132.1651055078073;
        Wed, 27 Apr 2022 03:24:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a83f00487sm18653728wrr.9.2022.04.27.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 03:24:37 -0700 (PDT)
Message-ID: 
 <7fd8456b6a72c1990a0f1008d88335276de5d808.camel@linuxfoundation.org>
Subject: Re: [docs] Sstate cache for version 4.0.999?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Date: Wed, 27 Apr 2022 11:24:36 +0100
In-Reply-To: <d6938cec-65a0-b2de-619d-a21bbf1d7bd5@bootlin.com>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
	 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
	 <d6938cec-65a0-b2de-619d-a21bbf1d7bd5@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 10:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2882

On Wed, 2022-04-27 at 12:23 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 4/27/22 12:07, Richard Purdie wrote:
> > On Wed, 2022-04-27 at 11:34 +0200, Michael Opdenacker via lists.yoctoproject.org
> > wrote:
> > > Greetings,
> > > 
> > > In https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html, we
> > > suggest to use:
> > > 
> > > SSTATE_MIRRORS ?= "file://.* https://sstate.yoctoproject.org/4.0.999/PATH;downloadfilename=PATH"
> > > 
> > > However, https://sstate.yoctoproject.org/4.0.999/ doesn't seem to exist.
> > > Could we create it?
> > It needs to be 4.0 for all releases in the kirkstone series.
> 
> 
> Unfortunately, I see no variable in poky.yaml.in for this. Could we have
> something like a "DISTRO_SERIES" variable which would be "DISTRO" but
> without the point release number?

Or a specific PUBLIC_SSTATE_VERSION variable or similar?

Cheers,

Richard


