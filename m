Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68106CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:27:39 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.23668.1697707652002656399
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7eXra0S;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c1807f3400so6289581fa.1;
        Thu, 19 Oct 2023 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697707650; x=1698312450; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cNIGsK2agLRPa5+JLrbLK2haNnqWZD6C9uj2AwXwD7g=;
        b=c7eXra0SVDUIKhm1k8rYIIR2Cedp4s+cTYTQH/nH4CxYvkKLSmGF6rh3lmmCH8whAr
         tp2Lyok4mIqfi2FyB92tGIxh/MRkeOqWLlwBZ6XT8W8a+Tf0Mr1QKuWfJZozSaQZ0Fx7
         IMMMF/qtjnzXJ9sjEh8vsHZHlzvgGAUwbK9D2mbqUoO+RYQLNO8ft3cH2GwVd0x4dJRc
         MtrsR6FC9grYCPVTySWbzmV0XMLUszxly10srqro97s5HkZQtN+p/lEK7v04xmwvOBbc
         cwXqg997YGGTFFdJs2tt0q8iJPbtvHo4dOQfb85O3pIn4UpQN2EMcOjI9R/wB+JWvk9D
         Hrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697707650; x=1698312450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNIGsK2agLRPa5+JLrbLK2haNnqWZD6C9uj2AwXwD7g=;
        b=hPy0UFrn7xgUM7moAVL0qGpKbAAn032ibVYeygnoCXjyy3xhuB8eTu28rKb4/AuxXc
         pNKKtmUrY5f90JANfVPN9DtctcuwlZWXX0+YKhuwF35Jf8ZJWBF/njwi6R+gmSkgIgLS
         FcgitKHNF1qDfvjZHSM/tqhud9NIz1NTo7vszXVgnHSMpec75dU4BuDRDaaDYNLa3kup
         C/6hHu0YkQ7ytdcZ5Yn5ucp5L3z5bg83CdvPpqq9k7wqlZpDQzWJ3GNyucdgvqSB8Mpj
         e6CIg9PuL0JB9BCuH3ozbDDyKph6V3KHEGrDpUj8s+jUh0u/AJkld19sHsYfhMSv0WYw
         ZelA==
X-Gm-Message-State: AOJu0YxlQsHRq7cMN1f6Iou7xpKQGnNqWlHNwD0T4sGckc3/CTAcvY7w
	plu5cIVeatTi/3sQKUGBOJ0YSxsx79CFFQHq+DE=
X-Google-Smtp-Source: AGHT+IG97WQV2o7Vw5s7VZSYmsd9G8yDFkwimO8eLuTSywFsnMwgz7ATTy4NE6YW4tOq/aVjVSW19ujj/jQAPpsL4qw=
X-Received: by 2002:a05:651c:4ca:b0:2c0:13d5:e463 with SMTP id
 e10-20020a05651c04ca00b002c013d5e463mr539871lji.7.1697707649884; Thu, 19 Oct
 2023 02:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <6E691FD5-CD71-43FF-9BA5-BC268F3731EA@gmail.com>
In-Reply-To: <6E691FD5-CD71-43FF-9BA5-BC268F3731EA@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Oct 2023 11:27:18 +0200
Message-ID: <CANNYZj-Rrb79fXxTJcmWsiOVBQc7=BFz3AvgWLan9195BuoakA@mail.gmail.com>
Subject: Re: [docs] [yocto-security] Documenting YP processes
To: Rich Persaud <persaur@gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4417

On Thu, 19 Oct 2023 at 11:21, Rich Persaud <persaur@gmail.com> wrote:
> On the broader topic of CVEs, there are thousands of reported security issues in public code, which are never [1] assigned a CVE, due to the workload of teams which assign CVEs.

I have a fairly radical viewpoint here. I think this whole business of
backporting CVEs is an unsustainable dead end, which already misses
out a lot of important security fixes due to many of them being fixed
quietly with no publicity or formal process.

The only way out is for the indutriy to transition to a product
lifecycle where upgrading the software stack regularly (and if needed,
rapidly) to supported, current upstream releases is the norm.

Alex

