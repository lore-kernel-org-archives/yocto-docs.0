Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A532DC48BCF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.6662.1650455165216248191
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NHZ5LHCJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id y21so1016064wmi.2
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JvQkfFK0s5pr6P201URCCcPxZsmerjde4X2IGmPZteI=;
        b=NHZ5LHCJnAAvQrVbjYBRKGwdShgIEAzaIXHmLODGAeaeOZBu+fYsg8Sa4I/hLJOUWP
         aaOeLU7fv3iEHb9v7jJGMKH4aqlyiXywnlV22RkKhtVn1iYQ8ydNG6XEkPrv6D2Np/mR
         JRRgJFdGgYdhMpP5BI5vb0VLBIhRSltER5DJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JvQkfFK0s5pr6P201URCCcPxZsmerjde4X2IGmPZteI=;
        b=XSgri77eQdf1QraqBgX9u+MFVkLiABepffsyegt+3DHi0g2drdi3Y/kO6PeQeD0rET
         pdhUN83ZpC+X1OgXBHvK2IMX49LQkqqLjlxPgKrjRzGhl0TvIcPMcsE/B5gqiTkd0Fus
         I0nJZyd2fz0QG4WuWvNAwT7zewsZkKYELfMltguzn0TUvEzhYTT44TaHxcunZ2UGDIEp
         s53/e7d8Ad77OHoT+R9jKq50AnM9T3ujIzrbXxHgLsIaxPPPa/V5lPrMriYHblaiRgG6
         S8GiscTSzLOo47K0hBOpSYuAAcBwjhd3ABfyMofSE7+vxneLlu6GQdDEd9q2EnuElwJC
         lsqw==
X-Gm-Message-State: AOAM531xnq0Vk/VdhtNxOD5+/cDvo6q3HmKKT7qJvQfstatGtSLF6pUY
	ef7P5EoALwlgl0ON1HYTWto1WQ==
X-Google-Smtp-Source: 
 ABdhPJzxkzgjjaJPnSCvV87AtLpsRXotoTHj1TegTSurs3ClDL08EabVHT+GV+HK8MVDuEs1B1y6nw==
X-Received: by 2002:a1c:acc6:0:b0:38e:b184:7721 with SMTP id
 v189-20020a1cacc6000000b0038eb1847721mr3283985wme.94.1650455163645;
        Wed, 20 Apr 2022 04:46:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9745:8b8f:81da:af07?
 ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 bk1-20020a0560001d8100b002061d6bdfd0sm16921489wrb.63.2022.04.20.04.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:46:03 -0700 (PDT)
Message-ID: 
 <87dba8b55b99a41137705e01f5db06ae5ba8b8f4.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/3] docs: set_versions.py: mark as obsolete only
 branches or not-latest tags which are from an obsolete release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Quentin Schulz
	 <foss+yocto@0leil.net>
Date: Wed, 20 Apr 2022 12:46:01 +0100
In-Reply-To: <20220420112402.151968-1-foss+yocto@0leil.net>
References: <20220420112402.151968-1-foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2805

On Wed, 2022-04-20 at 13:24 +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Branches are identified by their .999 version suffix which means they
> will never be matched in the forloop above this git context. Therefore,
> branches will match the condition. However, branches are not necessarily
> obsolete (e.g. dunfell, honister and kirkstone today), so let's mark as
> obsolete the branches which are from obsolete releases.
> 
> The same applies to not-latest tags of supported releases. The obsolete
> and outdate warning messages are handled separately and only obsolete is
> handled here, and not-latest tags of supported releases are technically
> not obsolete, so let's not mark them as so.

I'm struggling to parse that last sentence. I think it needs a small tweak to
break it up into two pieces:

The obsolete and outdate warning messages are handled separately and only
obsolete is handled here. The not-latest tags of supported releases are
technically not obsolete, so let's not mark them as so.

Cheers,

Richard


