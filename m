Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.2241.1593051842530143359
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 19:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rT1xMjsK;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i3so3474954qtq.13
        for <docs@lists.yoctoproject.org>; Wed, 24 Jun 2020 19:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DYWue7GdOZjXJMTJMb4XJ9bh0WsAOMCfwoxF6S88MTM=;
        b=rT1xMjsKIiYfLgqFt6HEVMvRCl3+6bUZvspK7K6xba73Z7kZabCz89y0Stuj4xeGsd
         4VSaen4iHPAgZXsCax9KNEPTkyv7ZfTVgD/Yxip4dcJq3pATTRfpuYZGyX7Ro6CovVOP
         eFQ+7PeHo4w0cG+8+zI5sIwSTwTz/6ifZFTkluj6giiwRbwaxhvILUgWSaZV7/DDXczb
         4gwmWZZEPu7gCNlOu31Es254k0h6sISro0l1mcVcZ8kc+Dt8VBwkSv6WxKzQBmn28ta1
         aE1UvxHQREhWB/vKnCZ5FI/Jj89D8+Bqpr5aumyTO+3A/M3BJPJDX8s91tLZrJqaooo6
         1W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DYWue7GdOZjXJMTJMb4XJ9bh0WsAOMCfwoxF6S88MTM=;
        b=U2BOuPsUNYRbjLWnnSQA1H9I/l2qpSiO/ItdVvigBhpfThP8a9tyHUaVUXrbi/0hRA
         DQrLJ9YAu2Ye+P5jtzWy4l8iL/wtUrL4B30LxegD3Z3Cb5zgxDxiX1zUpSzYF7TmOQlY
         usBt9tbVWlk0uPJ+7cIylOuxvp7qnFWaSJgQb0DJ1tCxXLMKsPP31mNDcphdbeAe1a6O
         Dkon+SkAWC6IQ+qjiyQNigi60UBHXhC/rfBLw8tz0tg7i6PCoTIeTZ3YUPX8RYPvNJpO
         DnLD5u8yHwnmZ+qE9u5iH4reHK7dbcXNG/b6w/tjqeA1b30e6fj+fQMkBxYapWFzH2Ha
         DlXw==
X-Gm-Message-State: AOAM530k+G2r84+4pxR5ctpn9MHFYMI9vl8Qo+8wY1YujyPTlwiel6BK
	JNvQCCjcW8lT8fBjp0uBnao=
X-Google-Smtp-Source: ABdhPJyid6PIMVluQ2o8ydX8zraEApJnMDxajQmcCu+XFhI6p5LIjLHWvpLvkPfksIockp7DSmDI/A==
X-Received: by 2002:ac8:4982:: with SMTP id f2mr30911334qtq.182.1593051841768;
        Wed, 24 Jun 2020 19:24:01 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from linux-uys3 ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id p125sm4540773qke.78.2020.06.24.19.24.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jun 2020 19:24:01 -0700 (PDT)
Date: Wed, 24 Jun 2020 22:23:58 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: "Morton, Mark" <Mark.Morton@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] New source files and Makefile update for Test Manual
Message-ID: <20200625022358.GB33261@linux-uys3>
References: <20200616211450.8079-1-mark.morton@windriver.com>
 <4279ef01cf93105bdea2e3d56e8df50db18350d2.camel@linuxfoundation.org>
 <DM6PR11MB367626B3068F92C3DD31D883E59D0@DM6PR11MB3676.namprd11.prod.outlook.com>
 <CAHUNapR1azgOund7LtARa-N8mAzm-5H7fnv2==gfNS2yGagq8w@mail.gmail.com>
 <CAHUNapTPp1pnArEserQKzej4chvOnmf21rwcXu_tn-PrfpmC4Q@mail.gmail.com>
 <DM6PR11MB3676665C903900BF80D5125DE5950@DM6PR11MB3676.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB3676665C903900BF80D5125DE5950@DM6PR11MB3676.namprd11.prod.outlook.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed 2020-06-24 @ 07:54:27 PM, Morton, Mark wrote:
> It looks like a duplicate in the ID name – I’ll take a look and try and fix that.

Great! Thanks for the quick reply.

Again, not sure if this is just happening to me or not but in the pdf the
diagram isn't included.
