Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C34CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 14:23:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.282872.1697639025811820615
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Oct 2023 07:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBcergGG;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c51388ccebso58953311fa.3;
        Wed, 18 Oct 2023 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697639022; x=1698243822; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4B2xfyHhLL+0mPU2ZrkI0D5a0w3NgZcz9RIbj6EVneU=;
        b=QBcergGG6pfzV+JV3rGpSo/0ztfo2D4LVb9uT88P+bio2YA8pkrIIqvX1PFqVMz302
         rmmmIYiZrysskp2H3BLbTTn0weqGBZNNRrZdUZ0vUAf7hKuIYNJw7ic0vKEvKNuryTRn
         q0Q4zPIfvDt3w5Og/Gx0r95r4rQtIa0lNn30BFMeD8YphT/t7U9sw1fOhSqY5DBgwzQ+
         OikgE6v2Wbl8urkHaLlIg/KZlB0hp6urN7vxIX9uJaFsQhR9exKOtf7XGKp+Cghs/k+Z
         1+6f/CexjD4m9n+DfJmrR874fdvxmhEQOjplDXZQdjtSbj/xD4FQQI9VgW06tF95ZCiU
         L/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697639022; x=1698243822;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4B2xfyHhLL+0mPU2ZrkI0D5a0w3NgZcz9RIbj6EVneU=;
        b=ISZ7AmR68okGsxTTqChaIQjultSfd2hXMCZlo6KK8lWqgZ7EIh+Eaaqqh9Zl1RVos8
         Zn9lDgXlQ6j4JQNB9SLpViHUYncA16RbSDu6tngU3Uffv4bUnI9kdsY/SDYBozs4ouaT
         vHgXfecv2hnkik3GoBQYrWhea2cJHdEM/w89z6l2+BLlmRBIIVlr9//MwQV7qOO0BlFm
         dgF2UZ+JSTzbP/QiA3PIOasfh88DaJMjBnj9mVNaDXFlRnyQQU0WIjg/eDK/pQPhYA9u
         14Q57cPlT5UU1iXxRyvt9I6JSrR/EFO3oBOrQDLxTIaXwt//SWvlhvimk/5ywRNoMjIP
         s7VQ==
X-Gm-Message-State: AOJu0Ywf5PzlvJVgG1mmMcMZtVXvnz/QIwRwbn0o1OkayikEB6uyALAD
	nKYrNTFskfVpWuVFNnJ+Fph4qPE6CXUbdFEAf+Z9e395USo=
X-Google-Smtp-Source: AGHT+IH04B007yq1/4BLIeoMOqE1wWO7FNnip3QGbyYSi6RX+eHDtFksy8ekkvnJgrx0wshYvCWvsYE5zsT5nkRylNE=
X-Received: by 2002:a2e:99da:0:b0:2c5:19ab:726e with SMTP id
 l26-20020a2e99da000000b002c519ab726emr4342724ljj.47.1697639022064; Wed, 18
 Oct 2023 07:23:42 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 18 Oct 2023 16:23:30 +0200
Message-ID: <CAApg2=TOJg06EP3JJmaoC-mxzPM3=4WkW0y3ADuuXRVsccoefw@mail.gmail.com>
Subject: Documenting YP processes
To: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Oct 2023 14:23:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4408

Hello,
I'm writing the "official" documentation for the YP security processes
and I'm realizing that I do not know which document to put it into.
There is no "YP Processes" manual. What about adding a "Security
manual"? It can then include:
- security processes
- a single place describing how to submit CVE fixes
- links to other manuals for relevant material and/or rewrites if necessary

What do you think?

Kind regards,
Marta

