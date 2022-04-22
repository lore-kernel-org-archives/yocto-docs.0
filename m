Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED41C54EC4
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.7576.1650629386205602551
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VpXuKguM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id c10so10790135wrb.1
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=64x3FrZrlMEOFecLcW+cb+F/SOjqvTBzIWjzhmqkT98=;
        b=VpXuKguMP1kwVDPiywxhNxjt2k/73Nqqe2FO1awwcV3eZtn7PlgYB/d61TCwi8KSoF
         dNZmSrwc5ZhkxKSe4d/b8pWmFSDupyXIwdO/prRYPBs+Z9Y18VJ1cTj0/+JM4VFNLGHW
         E+bDvOj1Nyr9u/s+wqPoPjK2JPvczC7Rzgx1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=64x3FrZrlMEOFecLcW+cb+F/SOjqvTBzIWjzhmqkT98=;
        b=4KdxbbZmvdrFitANwshgmJlqMH0KaqEsT+7NpewOd5MeYowTfJGzMj5xGiNyAsMzl3
         ZgwTZf/OhViwSjY7DedJiaFrCD+qmsNAKNoDz3d0c3qHrTjblRKTZuGBZXbkDDGD2bWH
         yeNr+hAFQLV0NYAA72trL9I2++yM44rLEEFtzqGYlIEsCaBLHjgHcavCOJeJ0CisqmBl
         F4qXqfIsk9woNsMFLiy/EW7XK3qVzvNLj9ISyexCKV9qK8B2qgwWEHB4Ccz+2l2J8Nxm
         H+bRRheeMu0b2gDgPJtS5NeWOYGcCyChqr9IaI5kBcZiwz9U1vDM8dEec4aMJWVuQEtF
         EITQ==
X-Gm-Message-State: AOAM530NKf5zZSE607JsZEfZDyDi0ZxqYMlvIqiSq6jdvGo54An6HzVL
	JU/RQtBjsNV2ylLNFWaI8bp5YA==
X-Google-Smtp-Source: 
 ABdhPJxXnOls9W0iiLCkFWzWs7eLcz65cXRTu1nuaKUHH7YFATmwqpwUCLQeMbjSEq4+QBPmH5e9kw==
X-Received: by 2002:a05:6000:1a44:b0:20a:ccde:c139 with SMTP id
 t4-20020a0560001a4400b0020accdec139mr1329420wry.320.1650629384518;
        Fri, 22 Apr 2022 05:09:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e?
 ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6091000000b00207a89b952asm1590768wrt.77.2022.04.22.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 05:09:43 -0700 (PDT)
Message-ID: 
 <f4db4ede3dfa2619d094f9b1dacf9dc03c000ec1.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 8/9] migration-guides: complete migration guide
 for 4.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>, Paul Eggleton
	 <paul.eggleton@linux.microsoft.com>, docs@lists.yoctoproject.org
Date: Fri, 22 Apr 2022 13:09:36 +0100
In-Reply-To: <d435d26f-63f0-d92a-bfde-d51a71001f51@theobroma-systems.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <f0106e362d6b4b4e827c1aa8533511a3684df927.1650591341.git.paul.eggleton@linux.microsoft.com>
	 <d435d26f-63f0-d92a-bfde-d51a71001f51@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2846

On Fri, 2022-04-22 at 13:10 +0200, Quentin Schulz wrote:
> On 4/22/22 03:40, Paul Eggleton wrote:
> > -Changes for release notes
> > --------------------------
> > -
> > -- Share State cache: now using `ZStandard (zstd) <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_Zstd&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=NFWUBU2SJa-7sMMP9YjjqDqnazkKmPYZmWozo_Fi3AGUKfgRkBmXN4PM3mfOkZO5&s=V_Vs2jVTKsmqXE6NV545ZU65Zx8CQJeXVIaQKEnPj2w&e= >`__
> > -  instead of Gzip compression, for better performance.
> > -
> > -- BitBake has an improved ``setscene`` task display.
> > +- ``gcc`` version 7.5 is now required at minimum on the build host. For older
> > +  host distributions where this is not available, you can use the
> > +  ``buildtools-extended-tarball`` (easily installable using
> > +  ``scripts/install-buildtools``).
> > +
> > +_append/_prepend in combination with other operators
> 
> s/_/:/

Tweaked in master-next, well spotted, thanks.

Cheers,

Richard


