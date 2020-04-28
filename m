Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.917.1588107353081777343
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Apr 2020 13:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WovoIeu+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id v8so3296228wma.0
        for <docs@lists.yoctoproject.org>; Tue, 28 Apr 2020 13:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=b995w2vNT3m7ad/caoA+2EIfvNRRWIQB0rUMgCqGu+A=;
        b=WovoIeu+put3dktTg8HSKOrI2OtG8dAPTEomyosBI78kqRjaim+2s2t649UmYOfBoX
         GCDYYBBetK3MdIKFF5d/jVRsiEauIYZBAxqSk2tocLIqnFB990ICQXC5l0hQEDP7GdaI
         0AGTJ9rbSY4cPLSgcTEqCb0q+fpYOX5YN5T8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b995w2vNT3m7ad/caoA+2EIfvNRRWIQB0rUMgCqGu+A=;
        b=NC1SdsJ4Pn0HO/1zg3+nRPQDqIz9RFepjhJZwA8Or2V33tUHBbH0jVD+BnJhYCgO5s
         jG6k3uAH4uwQk6JLmFPzKJOHBFMeFdKXx67d2WqaA4HBvoDwdcIPo/1dstm32Tlrx9gI
         zd8SLC7Yu8pYfsHVafobc7HTe7hzQnzdc32V0QELy57y6eqOy8rXC30pt5yiokhcYcgK
         /GiiCBXTLqjrgFpStKO8UwRpma5jAvDFcmTghHcztTVkByWYbXcL+R67AEcJmHcjA83D
         n9wMYuxXv0CbXQSGDawP5OZY+ywldZvwOckmVrEy21ukhkOgA19bWWygDKS+fcVeXfC4
         1P9w==
X-Gm-Message-State: AGi0PuZQYGliXpqwBszZ1/AK9Hwb5UpbZpOZy8GIkM5Dcn9pbJ0YYnFx
	zvbNN1v4+tZDzoK9xTjqcs7W6RwqAu0=
X-Google-Smtp-Source: APiQypK2KsF54Ii9mCt3YdSoV5rfOlrDVuQL3bkR6hjQNubd2ced5mO86s/VUT2O9ti7hrduZ/qJzQ==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr7028567wmi.52.1588107351012;
        Tue, 28 Apr 2020 13:55:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l5sm4537115wmi.22.2020.04.28.13.55.50
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 13:55:50 -0700 (PDT)
Message-ID: <1b306deae4fd33a2284c0a2df9a054bfed9f5ac3.camel@linuxfoundation.org>
Subject: Re: [docs] inconsistencies between poky and yocto-docs trees
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Tue, 28 Apr 2020 21:55:49 +0100
In-Reply-To: <CAP71WjwQiXmHKxjpRtJofo6ekyLOob9oABsYptj2=i9mmiqKoQ@mail.gmail.com>
References: 
	<CAP71WjwQiXmHKxjpRtJofo6ekyLOob9oABsYptj2=i9mmiqKoQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-04-28 at 22:47 +0200, Nicolas Dechesne wrote:
> hi,
> 
> i just noticed that some documentation commits have made it to poky
> tree, but they are not in yocto-docs tree. 
> 
> The last 5 commits in yocto-docs:
> $ git log --oneline -5
> 77e8a9e03 dev-manual: remove postinst false statement
> dda137617 ref-manual: add migration section for 3.1
> bc0923354 dev-manual: basic updates for npm fetcher changes
> af9bf61a5 ref-manual: update PACKAGECONFIG glossary entry
> d40485a7e overview-manual: fix obvious typo "ORHNAME"
> 
> The last 5 'doc' commits in yocto:
> $ git log -5 --oneline  -- documentation/
> f9e1127643 Updated patch for publishing
> cd25abf777 Added usrmerge to distro-features for Bug 13494
> fe25ef9871 ref-manual: correct "script" dirname to "scripts"
> a44b8d2856 dev-manual: remove postinst false statement
> c31ddaba1f ref-manual: add migration section for 3.1
> 
> The top 3 patches are missing in yocto-docs.. 

I think I'd missed a "push", my workflow is special cased around the
way Scott handled things. I've just manually done it and will beat my
scripts up a bit more...

Cheers,

Richard

