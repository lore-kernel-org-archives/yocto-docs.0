Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.4810.1585861471639213755
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 14:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b3m2xHwK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id 31so5914909wrs.3
        for <docs@lists.yoctoproject.org>; Thu, 02 Apr 2020 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k5QHgzHU3PJIyjIcItKJeaGueNSu/85+2jREEW4bLAA=;
        b=b3m2xHwKChLsanXLa1rQg3fdO3vyLxZO4tNv8w1xoSxcXxHL71EwS805HQVJ3l/RAV
         1b10ovEXCgiFU16y4Jny9rRdpaKkDWaB58CHvWdjAgwe4JBb8ntpmVU7FCdOxqZtahD3
         PmIWWd8gMEyp9AhlnnkIf9pS5fuAchzlvByC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k5QHgzHU3PJIyjIcItKJeaGueNSu/85+2jREEW4bLAA=;
        b=GQBNl8mHJKSdLT2SXvLxZGvc853sWS6lJ1FNPWtCLXaIFlOwPxV6Iw6wn3p1Z7NJM/
         FkfqI1Obu19Lke6FJaX81eK+69blDdAHqQ9pj9obJb8yNgcxu0hXH3yfDZHTglWCf8nq
         J1Bti+dPse5uBRCwaJB/PKIyAtrxGqylHBzsmCFADIW2tLIB0RMyoFs7Uxw9BTRUm2D4
         fsqV4ShpDAl6RH/wYPxsCGqBPCwfxQj6ShONo/eEyQIW75jFDscml5MEvYlPy8g4e6lu
         2lJIs/PhKMshp+Pxk3s86Wia7PZtq62wBdxWAqef6I92EDufBG48Z9u24F6nmk6Aq8oz
         IjjQ==
X-Gm-Message-State: AGi0PuZKvB9aXmZRwoWvwhTkNbKPYo5jgws613tWHt6N6g1Ilzxdlyfu
	CqHM0IuiadCMS+3qL6w5I/PdKV08mqM=
X-Google-Smtp-Source: APiQypI78rS7/kMOcWkSnyjUx0Svp1+pM/Ddy2UYa0U+EKUd7RyPYUH5q1W6xwIIlsVjdueCUcQnTA==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr5227495wrl.397.1585861469728;
        Thu, 02 Apr 2020 14:04:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t17sm4067613wrv.53.2020.04.02.14.04.28
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 14:04:29 -0700 (PDT)
Message-ID: <a66c660c2c932861e23464a31fee0f886cf32b13.camel@linuxfoundation.org>
Subject: Re: [docs] what is the deadline to get docs patches in before next release?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Thu, 02 Apr 2020 22:04:28 +0100
In-Reply-To: <alpine.LFD.2.21.2004021701310.6665@localhost.localdomain>
References: <alpine.LFD.2.21.2004021701310.6665@localhost.localdomain>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-02 at 17:02 -0400, rpjday@crashcourse.ca wrote:
>   i have some time this weekend to do more editing, but only if
> there's a good chance that it gets in for the next official release;
> otherwise, it's not such a high priority.

We tend to update the docs on the website fairly late in the process,
even after release as things develop on the stable branch so I'd rate
the chances of changes being visible as being good. We have some tricky
problems left to resolve too :(

Cheers,

Richard

