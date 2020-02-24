Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.1825.1582585506274720665
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 15:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WBKIeevJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id r11so12427980wrq.10
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2020 15:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1Qn06LLXUxDX7MyclAf45X2ifq5UpD1vaCx5syiqSFw=;
        b=WBKIeevJSQD3AFEsHX6yXZz1JzZV8h6ZPBeKWO1jSSsi+sUKpmzf6wqUffRGwicnTH
         R0B59ri8ukyosuDt59GNqtouQdrXH1EJ+GDJ9JzS0sSaYo6OFTk79RuM1AYv4Y6xkM7e
         DDXqIg7wzvpGe0jTRHc2iZXmux7YE4UXX69OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1Qn06LLXUxDX7MyclAf45X2ifq5UpD1vaCx5syiqSFw=;
        b=p+56JYwQ6T3TnDGRk+4KRWFcmdQaWFfgCXGN1kBbM0Ytk4FQv3y6ggRpJ6pBv1gYJQ
         hmDHXzsSB9uC+QLui4UuZ1tZAboqBnvEIpvTOvyBJX/KTScyK7HrwEA/EOBuV9ioSOYk
         nBwvUlbmr2fjpW4AMsFvDNdOQqc/MbBRk1RiOdYbqdUYPoiGTTYi6SV1vAdQaK18LcP8
         Udvu9U//HBl8NFOU7LRcCWUZ0BxlKj1aAvgYUBaaH+anVKLj1/X1odwK0AkOF943gOS5
         WiGs6XScbtkZVfhi2qpkZqAtBom51MAjgwTp5NWjqw4K+q7wPo/zZo4SVT7t9mVb54Us
         25OA==
X-Gm-Message-State: APjAAAUYfizUrGoivSVAhn+y3TaU4ccsGnoGjO7GV9pBJad5bHh+CNs/
	17VYjAc6dzY+de05QeVFdMKPDyYt7io=
X-Google-Smtp-Source: APXvYqwFErfWsU4p3jcS6BEO1XqDu8Ng8mLy3P9fzW9ahGRDB8uKRyvo2Lbjrkn6FZQ82leFTZ0KAg==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr74675677wrw.60.1582585504548;
        Mon, 24 Feb 2020 15:05:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id p15sm1206497wma.40.2020.02.24.15.05.02
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 15:05:03 -0800 (PST)
Message-ID: <2165d950c394dbf10655f33ea62a40b74708f0f9.camel@linuxfoundation.org>
Subject: Re: [docs] not sure why my patches to master-next don't include my real name
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Mon, 24 Feb 2020 23:05:01 +0000
In-Reply-To: <alpine.LFD.2.21.2002241715440.6444@localhost.localdomain>
References: <alpine.LFD.2.21.2002241715440.6444@localhost.localdomain>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-02-24 at 17:18 -0500, rpjday@crashcourse.ca wrote:
>   my apologies for bugging the list with this, but i just noticed
> that
> a couple of my patches that were applied to master-next list only my
> email address (twice), and not my real name.
> 
>   earlier patches applied contain this in the log:
> 
>   Author: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> but a couple recently-applied patches contain instead:
> 
>   Author: rpjday@crashcourse.ca <rpjday@crashcourse.ca>
> 
> pretty sure i haven't changed anything on my end ... i'm open to
> suggestions as to how to fix this. willing to believe i screwed
> something up, i just don't know what.

I'd perhaps have a look at your account subscription settings on
groups.io and see what its set to there.

What is in the commits is what you're posting as to the lists...

Cheers,

Richard

