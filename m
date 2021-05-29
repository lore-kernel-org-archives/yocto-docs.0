Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20769.1622294831454306570
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 06:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b9Kkoh+9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id g204so339640wmf.5
        for <docs@lists.yoctoproject.org>; Sat, 29 May 2021 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Cd15P6cWgdgh+L4MZkurDAn/y7Oiii0m/M+R8ynr4vg=;
        b=b9Kkoh+9TLTeZ+TVreluT0Ytpgw0CRdFzjgmFxoccMIlVI7KWWtiakbX166j2yb2Mq
         LFDPgk7lNEqY8vnABtpYEzPmkf86RIg++gZK6LYb2zJcZuFHryoNsZdnwBRSZgTmP4r1
         EDhB+SJEivltIP6sB0UPFsassUiF6P4lptBIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Cd15P6cWgdgh+L4MZkurDAn/y7Oiii0m/M+R8ynr4vg=;
        b=sN0J2SakmfaNZJvGGqjw5wV45SY40rVdoWf7PngwfLJsVdbm9B9tjTOXOipU/HeC84
         VfZMMOgCcrOU5vZm8DwUB8kV5C1S1+2cp7arOjOWgmLXC1EcBp9LKhNnDH6oNCAX0NVx
         53JSN+LASOwAbsrviDtYdJ2MBZZL23ztCP/uYlLOU/wwAg9Gjhsuog1i7EOtT4YyBmcL
         9WxPevJjOWLzbi+hzz3UWWh4BC1zAnoZEZo1si1ufDPK9+JfAlPpJJKrNhdvxNZSZe9h
         1mRS/7MnPYsdCBb8dKeLcitzgROzSnU2AGTGl00rv1suOlKx2ercIFNvyVM7r5YdXY5T
         PbcQ==
X-Gm-Message-State: AOAM533xDyn6qTx0JXtuGu+Texp2CQdLHCaVaJ/OAaQqfPtOgzT/kGxy
	1NAYR6A/H2vQYoCs5UvoF5LI4g==
X-Google-Smtp-Source: ABdhPJzoIqhGIfUOusvg05F/AyQbjwaVFo/4C89Wwq9u0dr5xOgEk/LJv+QkbFkuBpmZpLOSn68D/Q==
X-Received: by 2002:a05:600c:2d56:: with SMTP id a22mr12639772wmg.105.1622294829778;
        Sat, 29 May 2021 06:27:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:314e:6a46:a163:7356? ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id m7sm11769175wrv.35.2021.05.29.06.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 06:27:09 -0700 (PDT)
Message-ID: <2d60c162d6569a07e3da820fd322c4b5abd18b3d.camel@linuxfoundation.org>
Subject: Re: [docs] a more focused YP FAQ?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Sat, 29 May 2021 14:27:05 +0100
In-Reply-To: <0482e68-66d3-855-4da7-eaec59f4e9ec@crashcourse.ca>
References: <0482e68-66d3-855-4da7-eaec59f4e9ec@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-05-29 at 07:18 -0400, Robert P. J. Day wrote:
>   i was perusing the YP ref manual FAQ and i was reminded of the
> brilliant foreword from the subversion book by o'reilly, particularly
> this part:
> 
> 
> "A bad Frequently Asked Questions (FAQ) sheet is one that is composed
> not of the questions people actually ask, but of the questions the
> FAQ's author wishes people would ask. Perhaps you've seen the type
> before:
> 
>   Q: How can I use Glorbosoft XYZ to maximize team productivity?
> 
>   A: Many of our customers want to know how they can maximize
>      productivity through our patented office groupware innovations.
>      The answer is simple. First, click on the File menu, scroll down
>      to Increase Productivity, then…
> 
> "The problem with such FAQs is that they are not, in a literal sense,
> FAQs at all. No one ever called the tech support line and asked, “How
> can we maximize productivity?” Rather, people asked highly specific
> questions, such as “How can we change the calendaring system to send
> reminders two days in advance instead of one?” and so on. But it's a
> lot easier to make up imaginary Frequently Asked Questions than it is
> to discover the real ones. Compiling a true FAQ sheet requires a
> sustained, organized effort: over the lifetime of the software,
> incoming questions must be tracked, responses monitored, and all
> gathered into a coherent, searchable whole that reflects the
> collective experience of users in the wild. It calls for the patient,
> observant attitude of a field naturalist. No grand hypothesizing, no
> visionary pronouncements here—open eyes and accurate note-taking are
> what's needed most.
> 
> "What I love about this book is that it grew out of just such a
> process, and shows it on every page. It is the direct result of the
> authors' encounters with users. It began with Ben Collins-Sussman's
> observation that people were asking the same basic questions over and
> over on the Subversion mailing lists: what are the standard workflows
> to use with Subversion? Do branches and tags work the same way as in
> other version control systems? How can I find out who made a
> particular change?"
> 
>   some of the YP FAQ is clearly relevant, while other parts of it seem
> to fall into the grey area described above. is it worth spending some
> time canvassing people and collecting truly Frequently Asked
> Questions?

Many of the questions there have been there for a long time. Some were 
generated by answering questions asked by people on the irc channel.

The trouble is the world moves on and changes and not many new ones
have been added in a long time. We'd very much welcome new entries 
for there (and removal of anything which is now too old/obscure if
appropriate).

If anyone has the time and wants to figure out new entries, please do!

Cheers,

Richard


