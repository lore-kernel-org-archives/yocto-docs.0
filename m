Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1CFC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 18:05:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.550.1645207513719196537
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 10:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hf3OP4Bv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso6993416wme.1
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=erXHXnaOO0Tnl5uEBzDVLLULCT6a2/txvrw48E035uc=;
        b=hf3OP4BvWjDMHF9YtPGFE/PgzWgiGEjo62shZUZjqd1uKbNajW5QVeCS3PB45850Jq
         ur8Tisw7vwzCxshG2f/aAXHD/jVdq6aSuJnHnpJDsFGpF/BI/i/DwesBN3IqP6nYfyp8
         P5Itj5rP8by+yFgom9DiBHPL9LlC39fMZCEAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=erXHXnaOO0Tnl5uEBzDVLLULCT6a2/txvrw48E035uc=;
        b=AGHdgTXRtYEeC82v3WbPAzKgZJXgHu/Dkgar7tLQfVoIgXmwVN5TOgt1woJVVKQTBD
         MO5bcdVD448I39JFa/50sGwIDmEDhKr4yoig8sLa/YV9PlPCORbtVnSho+SiI9XToFRZ
         B4yzUl/J81rZVc3gcrBLRLb+0hLwHE7YG0quQZ8wCFC13+NR9u7mO+zB+C0ArqT4ZUcz
         wlFCdVX8qhYpErRKBiCJbr03UFUMGZ5bnMNDOousWuMIRH0Bl4CLMU7gOM4+jLTexAw7
         yEGsll9JmMjLZ4EBqFFbLSuU4IJ56ahqMvllaI9/OWdirfoQP4hZIYcH6qEbzORFiKVC
         Yw/g==
X-Gm-Message-State: AOAM532Fw7Zs+CFd9MbEw0qm0a4FpANA9G5zc8hPwUW0PTo603N4tqfk
	2JI3uTrETYtgfP/STyjeEaHTWw==
X-Google-Smtp-Source: 
 ABdhPJy8Hg9nHS2SimY/PZeMpOQk2pZ5pCgYAmHRDwW9YZLZxV0RWCIy0eLWVbxqK5zA/OCCNVzy4A==
X-Received: by 2002:a05:600c:3503:b0:345:858e:cbe8 with SMTP id
 h3-20020a05600c350300b00345858ecbe8mr11462493wmq.73.1645207512042;
        Fri, 18 Feb 2022 10:05:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bc9:59b:7021:269f?
 ([2001:8b0:aba:5f3c:7bc9:59b:7021:269f])
        by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b0037e9090fb1esm81034wms.24.2022.02.18.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 10:05:11 -0800 (PST)
Message-ID: 
 <61112a287879a271cfb46723e43345d35ba49d94.camel@linuxfoundation.org>
Subject: Re: [docs] [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 18 Feb 2022 18:05:10 +0000
In-Reply-To: <add8d843-ade6-59c1-7844-bc02c206a082@bootlin.com>
References: <288d00ca-e20d-fafa-5962-6086504141ad@bootlin.com>
	 <cfd4049897d8631c458d9ff916b1d956ab55a810.camel@linuxfoundation.org>
	 <16D4F2CEEB1A79AE.28672@lists.yoctoproject.org>
	 <54127154-cef1-101f-bcae-31dc6f380649@bootlin.com>
	 <046477f4c63a2c6f088e65f9cb3916c11d421d2b.camel@linuxfoundation.org>
	 <add8d843-ade6-59c1-7844-bc02c206a082@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Feb 2022 18:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2482

On Fri, 2022-02-18 at 19:03 +0100, Michael Opdenacker wrote:
> On 2/18/22 18:58, Richard Purdie wrote:
> > 
> > Merged, thanks. Not sure if there was an issue with Peter's patch?
> 
> 
> Great, thanks!
> What patch from Peter are you referring to? I hope I didn't miss any...

https://lists.yoctoproject.org/g/docs/topic/patch_1_2_manuals_remove/88760254

Cheers,

Richard


