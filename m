Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.7147.1615374319674251783
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 03:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VLhcrJkT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n22so6841377wmc.2
        for <docs@lists.yoctoproject.org>; Wed, 10 Mar 2021 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u1C8+s/SAQg4eZU/9fZZtw9VsUJaUDY6GTI4pmJt0eI=;
        b=VLhcrJkTzinXXnWPYFkXqB3AZXcw6hqurSMeDg0yFN2zRUBcJSJsl/UEyI/gqGNZOW
         T2lJEg27Tllrhkyhq6ALKymHY5UIRhmR9CQWRpC6ge6tkqYkepsMtujborrcgSCKB/Ve
         bLSD9osERX6DCVth6YyH6x/7MVgqTNdtUsFZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u1C8+s/SAQg4eZU/9fZZtw9VsUJaUDY6GTI4pmJt0eI=;
        b=hRrmU4cvxXy3ngTUtnJqi+UZAO3f9vux0NzLQ8Cxc9QrK8T7u6TfgCMh35vPksVI6Z
         qJW7pS+auv4tDFtSoxKkTYp7joU3SwdX9MzdWCmkc0en9lMB2W+g9RmlHupiSpuqVwlg
         T9w0M7rHKms7P1avQW59VwAltqAbep/nuST9+icsccnJTHulNQCxu5sWVWFcwuwbhlGB
         4XvfMV6IXxEKTvmHgsPzWv+daQrpK8xBcLPnUeiQbpIRhzNgv47DtDI/9WTt33X7kbS5
         GhYokMJqDsH9qPVlknEhF5PC+ls3y6SLtyfIhwp+H8lDZ3XIfDCuF6sjp+QpT4jxIyKv
         xUpw==
X-Gm-Message-State: AOAM530031t+IMxE8ABEXsY390k63nRnFXqbnen/BTetI3Wv/YDZM0H4
	ODJhGot0WSk1zoqfIzeLXRyCtw==
X-Google-Smtp-Source: ABdhPJx53rMkDn5LQogCA8Tp+2MY05q+/emZmdQfqjcLbE7nDCVu8Qu7QS89DScykN3t/ebheSP4uA==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr2750792wma.71.1615374318072;
        Wed, 10 Mar 2021 03:05:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b? ([2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b])
        by smtp.gmail.com with ESMTPSA id x13sm28600965wrt.75.2021.03.10.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 03:05:17 -0800 (PST)
Message-ID: <754622d326a04bce07f02a18d0c2e85bd184fc06.camel@linuxfoundation.org>
Subject: Re: [docs] rendering double dashes more emphatically
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Quentin Schulz
	 <quentin.schulz@streamunlimited.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 10 Mar 2021 11:05:16 +0000
In-Reply-To: <CAP71WjwZR85PzS-dZBsFDGhto+HY1rmXyAe=4VjqTRaycVyjYQ@mail.gmail.com>
References: <b1323c30-5681-20cc-af2b-e38f56c1d22f@crashcourse.ca>
	 <20210309101702.g6y4lvp2b3wnfakn@qschulz>
	 <544513ce-f46d-14e2-dff9-bf394f315d@crashcourse.ca>
	 <20210309103055.cfqkohjoxq635r2g@qschulz>
	 <CAP71WjwZR85PzS-dZBsFDGhto+HY1rmXyAe=4VjqTRaycVyjYQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-03-09 at 12:00 +0100, Nicolas Dechesne wrote:
> On Tue, Mar 9, 2021 at 11:31 AM Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> > 
> > 
> > I don't remember seeing patches for bitbake docs in my mailbox. I'm not
> > subscribed to bitbake-devel ML, so I'd guess you should send to
> > bitbake-devel :)
> > 
> > Send a patch and people will tell you anyway :)
> 
> It's bitbake-devel for bitbake. Though I wouldn't be against sending
> to yocto-docs as well to get more visibility from our sphinx local
> experts!
> Richard?

Technically it is bitbake-devel as the docs are in bitbake's repo but sending
to both might not be a bad idea even if it is cross posting.

Cheers,

Richard

