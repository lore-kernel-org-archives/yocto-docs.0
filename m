Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web12.15147.1590681079302616417
 for <docs@lists.yoctoproject.org>;
 Thu, 28 May 2020 08:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOof08Df;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id y85so402984oie.11
        for <docs@lists.yoctoproject.org>; Thu, 28 May 2020 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=DHhY00yndd2C0/BQ5qA8SkUAtjQ0XBrkOZwmFamOM6k=;
        b=WOof08DfVabf6HQFTtFAwjnWSWrzgivWfqetocJtfsmtu10FFv0pBbZMFLrtRPRR3Y
         1VNruVjrVsxKrdVhuwCijHQrnYsHTZ0PCn7Oxc/w8HvLEwg454Ix9LrHT/ka8W8VFVLf
         8hu/KpDmnN3HdlrNeMZYzeyk6CHTnb2J3Vg09NBqmqjsFm7N8lPnkiPmQxNBb/911Pr9
         iy6v4ENNRyjrnc3gyiaEqvHNIKxVyBAHX81RMEiXvWtsYw2hp2N2wGnxiksdlXniZmrA
         LQdVZ9yM3G4RyhIJnQmh52Tfc2u3XXKGovMoWWOc1Ken1bLjrF9ATZJI2w1XqYvS0s6o
         LNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DHhY00yndd2C0/BQ5qA8SkUAtjQ0XBrkOZwmFamOM6k=;
        b=KEh/wx3ITSLGDhM1yUVWnU3DeS8yetBOTn8W7AhfYtfSXD57GxMwoMsTjhI85waIuO
         jCu+aLPP0QZ4q7K3puA8aH59VDtpqQc52c+45fwt6ku0AuspclOtNvrmiUtk9KgD+fmD
         oF2gear5anMvJVN9sDjXF70uUjV5RVqBnBo0zk/SV6iBZ4Jdo/ZPQgWaIT5F7S3loiXC
         Xd6w8z8NsH1VbbHONAMqWzypeDnh5j5wy7L+kXccgASFfsOlLpKv5xY52Im4w0kUS8Y8
         aY50yx+h6JU1BXPsH3yXNq791uve0J0yHpGJoX8WqjwCrp0zdYKHVyVmuQl6hWsidTa0
         WY/w==
X-Gm-Message-State: AOAM530Mk5lcsFmo6mBLnc2ZrNmEk+J6p0tcxPLQ32UdyYpWIBzjjEaU
	Nmt3Jj4BycOUBW+3wHeTeU9ob0KGKC0=
X-Google-Smtp-Source: ABdhPJzX2v3HyhUXvfJ8yuVNqD7oOlg7a5pumZnJOWUtf9KmYFYZ0fyggsT3TLBnWSwCdpyqCve/hA==
X-Received: by 2002:aca:c485:: with SMTP id u127mr2627678oif.156.1590681078090;
        Thu, 28 May 2020 08:51:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id b16sm1824698ooj.17.2020.05.28.08.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 08:51:17 -0700 (PDT)
Subject: Re: [docs] Documentation Linter
To: Mark Van De Vyver <mark@taqtiqa.com>, docs@lists.yoctoproject.org
References: <XszS.1590638412302404292.hla4@lists.yoctoproject.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8248cc35-5e90-0222-eedd-b0c2c8ff4f6a@gmail.com>
Date: Thu, 28 May 2020 08:51:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <XszS.1590638412302404292.hla4@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 5/27/20 9:00 PM, Mark Van De Vyver wrote:
> Hi,
> As mentioned in my previous message - which hasn't shown up yet - I'm 
> new to Yocto and thought to try contribute via the docs.
> I've made my comment on the conversion from DocBook, and this proposal 
> will be impacted by that effort - hopefully a part of the conversion, 
> and in a way that does not block or interfere.
> 
> The idea I had was to introduce a prose linting tool.  Specifically, 
> [Vale](https://errata-ai.gitbook.io/vale/).
> 
> Before going into the details, lets first establish if any of the 
> following would be of use/value?
> 
> It would allow the project to achieve some consistency across 
> paragraphs/pages/documents/repositories.
> This would become more important if the project decided to exploit 
> [Antora's](https://antora.org) ability to create a document from 
> different repositories.
> In such a case a repo could ensure its documentation had a closer 'fit' 
> within the wider project documentation by ensuring it passed the same 
> lint settings.
> After the inital run/port is complete the documentation lint step could 
> be added to the githooks that verify any new commit is green.
> 
> Thoughts?

I really like the idea of linter.

> -- 
> Kind regards
> Mark
> Mark Van de Vyver, B.Bus(Hons), PhD(Dist)
> 
> 
> 
