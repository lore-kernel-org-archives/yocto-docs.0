Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.1868.1620081519261421677
 for <docs@lists.yoctoproject.org>;
 Mon, 03 May 2021 15:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RtBY6/es;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id d11so7223039wrw.8
        for <docs@lists.yoctoproject.org>; Mon, 03 May 2021 15:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=IknyUM4Dg19oeZeCMj8K0kkrJUC4CIPIjin3HSg0+8c=;
        b=RtBY6/es1vep/f427/pg7f1wKK/JwQMQycUE3mGuCK0l5+RR+6+6cUD/8W6wJhmiiU
         dyhs7ask+CFOkIVANTLO2GiahCZieiKZOGfmjEPFu0B6AzZcTW7OEdOHtc2+4S3MPgay
         JHhPCLsUL/+j8jbsDlwSLw7rGDfO4maafgy3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IknyUM4Dg19oeZeCMj8K0kkrJUC4CIPIjin3HSg0+8c=;
        b=JUe/R4tGiP8eU6pzrMLcvoK+hTgDY2FAd2dcBrJXU5hK0yNzR3QNg9jyarHBttysEE
         3l1kYVXl5N+WdUWpidfvsaknLHmhqrcUYyMRB2xp/wdEMcZ3U9xjA/3SiyhTXKvVDJt2
         yomi42UuTdA5A/JR8ITJ6xXyqas85z9UwkqHBZRiFZF4BBhLozhnkuBee4NhduL2CR8O
         CbGeNE3JsoF4bpE6TpLJgEczLWNYVHQOGb/sKk9sFAwMWFbPBhNe7N06uv+zBVgU1sJ+
         2zqkDKMP763sYb3aUToOWst3c5ILHZAgx+iY2tWrS7ELLPKHiQ1y2niB41OnC2BJIxgt
         5nAw==
X-Gm-Message-State: AOAM531D8LaiWBnFP7IrNkNMmRuCHwJUEN7NZp43bzpHju+ZdvbkzbN/
	AB4g1FBbdIWDqmJ4ZVBm3LGgDw==
X-Google-Smtp-Source: ABdhPJwtj+e+IuRJTpc5G4KR+g/QXTYhVcp4eNBRjm7BF6BiY2F1QTa00DL3DeI6ZWr3pE/IPrCPBQ==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr27941044wrv.254.1620081517589;
        Mon, 03 May 2021 15:38:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bb9:ef1f:254c:99f5? ([2001:8b0:aba:5f3c:bb9:ef1f:254c:99f5])
        by smtp.gmail.com with ESMTPSA id h14sm17178016wrq.45.2021.05.03.15.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 15:38:37 -0700 (PDT)
Message-ID: <ff26267bb1afa5ae061c74da9c87231fea0d7559.camel@linuxfoundation.org>
Subject: Re: [docs] sdk manual, how does one simply *use* a pre-built SDK?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 03 May 2021 23:38:36 +0100
In-Reply-To: <50434d1c-369-8679-9a5-91c9d5acb77d@crashcourse.ca>
References: <50434d1c-369-8679-9a5-91c9d5acb77d@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-03 at 17:40 -0400, Robert P. J. Day wrote:
>   having perused the SDK manual and nitpicked here and there (and
> submitted some patches, hi, michael!), it's not clear to me how one
> simply *uses* a pre-built SDK to speed up subsequent builds of
> compatible projects.
> 
>   if i'm focused on building for a particular target, i recall from
> way back there was an option to identify an external toolchain to use
> to speed things. i'm *assuming* you can do the same by building,
> installing and sourcing an SDK, but the SDK manual doesn't seem to
> explain how to do something that basic.
> 
>   am i missing something? if i go to the trouble of building and
> installing a standard SDK, how can i use it to speed up subsequent
> builds?

You don't, we got rid of that. You'd want the eSDK to do anything remotely
like that. Supporting random toolchains for the build was a world of pain
for everyone as it invariably broke in interesting ways. It isn't the point
of an SDK which is t give someone a toolchain to external development.

Cheers,

Richard

