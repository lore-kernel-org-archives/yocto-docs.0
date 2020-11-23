Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web12.38252.1606151240852129180
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 09:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jSYMkIzm;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id b8so1094847ila.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gnyE4u/Q3AbcaMY135p9H8M/aAONUCOoifl4n/QfdtE=;
        b=jSYMkIzmDC4BGLzmB19iALKQ56wfw3BoQB3YcBjBBxBEKyaSXDlYEqM8UXVKAj+8Vr
         woXdj1Ooi44iH0WU+9ogBaHnrTyVmXG/RENoV8CZiF6TyTdNwda1jSFkeOhfOuvwQYEu
         N3jqP3xysO7Q+yFC51mpudgcInq1ef/fMGVqmRKyaRO5vTOBxcvbjr8UJNO6rsqOh/86
         U+YR86kSYQ4Gma+tITJpz92P83wKJPa2Ju2qEkMpYtb71jUT8f4km7mOCrcMU7hMS5eE
         tPY7a/+fyxisf10pSYlmLqI5z8yzQqB9M5FrnXlNDzJ/i4meMLI0O0oFoiYUeayXOu2J
         Mreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gnyE4u/Q3AbcaMY135p9H8M/aAONUCOoifl4n/QfdtE=;
        b=CEwa1dtAHzMQIXZrAe/tcw3Xy3BXQk0T//xzsBShj4twki/yYrUPJKRMNeYyqRATvR
         UrXCsIk9ZYMf81Mi4SIhWG2TpvDeKRQAY9PKnjPSUUyeRI9vYFmxlcgaMv9/ss48VmS2
         Ta+Vai7qqnHCTXii6+AgltATjQUXtTHbGkg2tXzBUBJZBiWewm3Of0BO48J156hIUmhU
         MLuQZzKGTbzA3KMUulFbibhcnUfDmG/mrwBPatjGdgNjlPwH54QNWEbiSDRQ3htNPG0G
         R55yLIosQgnGb3rsTTugz+501qdeZGjgwuFsaAY2abn110sfziJ4vTlPkWTVC3NPK5pf
         IcBw==
X-Gm-Message-State: AOAM530+HivjYFD7A2vQPJqyxBhGGzIYbQvan4+V9zi9AXROjtjBXjWL
	w0cj2NMm5CGjGxNSrjaP+ZFTb4C6021vEtUNuu6R9g==
X-Google-Smtp-Source: ABdhPJxTEdE7MQm3dbMtXF7rsOFVvkVLh0m6eDCuhL9OhUskxSNUqWclD9KB3lrFBaeI3IclngJavsPvQQCBUo1ci9w=
X-Received: by 2002:a92:c64b:: with SMTP id 11mr686073ill.224.1606151240142;
 Mon, 23 Nov 2020 09:07:20 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
In-Reply-To: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 23 Nov 2020 07:07:07 -1000
Message-ID: <CAOSpxdZAJw-mYmz=W=GZBevc1viqu0rhgDdKH-2BY5vgFzeqKw@mail.gmail.com>
Subject: Re: Sphinx 'backport' for Dunfell LTS
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Nico,

This looks reasonable to me.  I *really* appreciate all the effort you
put into this.  Thanks!

Steve

On Fri, Nov 20, 2020 at 12:20 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> Steve, RP,
>
> I think I am "done" with the 'backport' of Sphinx docs in both
> yocto-docs and bitbake. The backport process isn't straightforward..
> here is what I did in each case:
>
> 1. take all sphinx commits from master branch and squash them into
> dunfell. that's a large commit that brings sphinx and removes docbook.
> 2. because of #1 there are changes that we 'imported' which needed to
> be undo'd (e.g. a doc change that was applied to master, but is not
> needed in dunfell). To get the list of such changes, I look at each
> patch in dunfell vs master.
> 3. in yocto-docs, I had to 'revert' some patches first before I could
> cherry-pick all the sphinx changes, and I have then 're-applied' the
> changes later in the branch (of course when I say re-apply, i mean i
> did it again in sphinx instead of docbook)
> 4. Then I took as many patches as possible from 'master' which apply to dunfell.
>
> I understand this is a complex 'merge', and I must admit I have gone
> back and forth on whether we should do it..  I couldn't find a simpler
> way, but if we merge it and use Sphinx for the next LTS release
> (3.1.5), then all active releases docs would now be based on Sphinx.
>
> I have pushed the branches here:
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=sphinx&id=488a421fea826a2cff27dd009768430769f25ab0
> and
> https://git.openembedded.org/bitbake/commit/?h=sphinx&id=fe9dde75fa55da08fddd0cce778d3eb6303b2124
>
> It's rather inconvenient to review the series by email (the first
> patch is huge), But we can discuss here..
>
> enjoy... or not ;)
>
> nico
