Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.2168.1593051746432809263
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 19:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyOAnhaO;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id z63so3979772qkb.8
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 19:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1jv8O5UFhaevcxZ9mWtOGUhOlLMkSLL1gwa16IhVVVU=;
        b=gyOAnhaOabLIJoYlWlW0la/5aEUI4rxH08x+snS1mg9MCZc68fNCNzdTlYT7rUJ1Ol
         KA2t+EuHQZJAlBEfDy+VMjJ6put83D1YyHXnSSUPs8xcNsnix6qsjYJHKe0usra5EgM5
         aJBhbh4Wv3BtaKWSvRlv5HdTviIFpB9SOYhvKhCzhcSOHYubqoKNqbifKkxlHu8Fq89r
         gIiadXLIK1AIhHvbMaaprqu4aulGx9qKxb4G7fU04DOHJI5+g8wWbRDD+lDhshqZ8qWk
         n99OU0Ax/W2KtPcj1DMtqM0O1v4mAK7FljhToHgZAnqzYPr9zI+H1uRKa2JQUHRWcW20
         /v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1jv8O5UFhaevcxZ9mWtOGUhOlLMkSLL1gwa16IhVVVU=;
        b=sFTBIfvxYJgg5M0aEk7j5JSk2d+Nsp1VZJ0KmeWeUvQ+ycS+0Vgn6W1nYCx1CdinOh
         qOcdeATJZu3DPjU4Ho+8hCZqIvDXeYYwMkGGSwetEU5kY+3pk/SOTM645vC/x57fA6Tj
         TViHMk7MU3bWzEZzPY42cKslkyFKuxyt48puX7TVfBA7WTEiuqrqxZ8c4gVZvWay+w3g
         w3NJ1L6R3ygwG9V5pVtYJm+bq1AEVuvCf1svyPUHmSlrdwV8wCtpchTTxTWcG0Nx+o23
         /ADG+J4O/FAYLm7VwKaArMas1RyM2fZ13A+UA7G5sdavTi44fPXqUNI9lvBjR3NJAkdL
         JCtw==
X-Gm-Message-State: AOAM5317SRMOjhlNHiGX5XQ1qi7a601tRoTn28Hi6Zyi8901YQv5FMC1
	QKJnBrPpitFcraDPb6L53So=
X-Google-Smtp-Source: ABdhPJxLuuNDarcbVVKexJIKV85YCiv3cvk5rtQa3M92X4voqzU0OvP1mLYsLL0FEq8iYcJuPMt4TQ==
X-Received: by 2002:a37:bb43:: with SMTP id l64mr27701895qkf.271.1593051745590;
        Wed, 24 Jun 2020 19:22:25 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from linux-uys3 ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id j16sm4783869qtp.92.2020.06.24.19.22.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jun 2020 19:22:24 -0700 (PDT)
Date: Wed, 24 Jun 2020 22:22:22 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: Mark Morton <Mark.Morton@windriver.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Fixed PDF build issue caused by duplicate IDs
Message-ID: <20200625022222.GA33261@linux-uys3>
References: <20200624235352.18790-1-mark.morton@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200624235352.18790-1-mark.morton@windriver.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

works for me!

On Wed 2020-06-24 @ 04:53:52 PM, Mark Morton wrote:
> Signed-off-by: Mark Morton <mark.morton@windriver.com>
Tested-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  documentation/test-manual/test-manual-test-process.xml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/documentation/test-manual/test-manual-test-process.xml b/documentation/test-manual/test-manual-test-process.xml
> index 6e2157c62..15bf420a0 100644
> --- a/documentation/test-manual/test-manual-test-process.xml
> +++ b/documentation/test-manual/test-manual-test-process.xml
> @@ -1,7 +1,6 @@
>  <!DOCTYPE chapter PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
>  "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
>  [<!ENTITY % poky SYSTEM "../poky.ent"> %poky; ] >
> -<!--SPDX-License-Identifier: CC-BY-2.0-UK-->
>  
>  <chapter id='test-manual-test-process'>
>  
> @@ -46,7 +45,7 @@
>              The full build includes all these things and is slower but more comprehensive.</para>
>      </section>
>  
> -    <section id='test-yocto-project-autobuilder-overview'>
> +    <section id='test-release-builds'>
>          <title>Release Builds</title>
>  
>          <para>The project typically has two major releases a year with a six month cadence in April
> -- 
> 2.17.1
> 

> 

