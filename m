Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.44168.1606172342188194856
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 14:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=glFcq3Iy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id g14so5238337wrm.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 14:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iNgQvzG/pN6fzHA6YU1Qnn8O/7IEbAXQ6PHuqeBefRY=;
        b=glFcq3IyLSwOiLFIdV9WoXwzeiy2+kEJ17WLKK02Kng9ioFVqe+eZMzfsY35wlmX99
         1Eo+ICvUUbAndiaWDfLIW5QIJAwUziBLU5jRa3bbgqlX5inOn0q9OpZcJDrMBuiyft1z
         kp0jW420hxtdm5TckGnzhG7Mp1kSi3kNB5Ies=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iNgQvzG/pN6fzHA6YU1Qnn8O/7IEbAXQ6PHuqeBefRY=;
        b=G7uBWNPG0KDkNBt/Qc0M/9g5kAkYiay1wgL0nJWqX9G3AX2wjeXkobtGTZWyDYGG2+
         jMYaaoBCKbeNnztPjvf/lnr/T8qK8mYRtUr+43Oi+SdgpcOZjYbkWJ5POCkOaVx+uCQE
         ekrQy7OBrO06QTlBm0xguXhI7yIyyfDzycZMs4ABGe+DJX2Dxn8DfyY0f1FxwEV6BzHz
         4KTmIRApo1nfcwGGrC0mYqekGoh1fHGL6u0CWmX3Cu9Mwpqe/lKtJSCym8557HyRVxQ0
         wL0xFYBID47l1g/q4VLkLKbUEEkfAsD1Zh/J5sH3xGOUiWXg0nNcoVmRuzeq5NmvpRCN
         YXDg==
X-Gm-Message-State: AOAM533u7zaWkE5f7YOoN8RtIl5n4Jxf3P/2+Az82L8NYTlwnx/dU/IC
	RzJv1CQ6XD4Z1QaJiNyiBf+M7g==
X-Google-Smtp-Source: ABdhPJyHhgZ+HFMPqccwYD2otby0N4CJ94Dj3X6W0ejivI+ckiJTe1Fkc9BvcRTcs64lNnVXd3qrIg==
X-Received: by 2002:a5d:604e:: with SMTP id j14mr2111362wrt.164.1606172340610;
        Mon, 23 Nov 2020 14:59:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id n23sm1441202wmk.24.2020.11.23.14.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 14:58:59 -0800 (PST)
Message-ID: <3f2097a08c323b05c32013bc0d7f84c1142f0838.camel@linuxfoundation.org>
Subject: Re: Sphinx 'backport' for Dunfell LTS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, YP docs mailing list
	 <docs@lists.yoctoproject.org>, Steve Sakoman <steve@sakoman.com>
Date: Mon, 23 Nov 2020 22:58:57 +0000
In-Reply-To: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
References: 
	<CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 23:20 +0100, Nicolas Dechesne wrote:
> I think I am "done" with the 'backport' of Sphinx docs in both
> yocto-docs and bitbake. The backport process isn't straightforward..
> here is what I did in each case:
> 
> 1. take all sphinx commits from master branch and squash them into
> dunfell. that's a large commit that brings sphinx and removes
> docbook.
> 2. because of #1 there are changes that we 'imported' which needed to
> be undo'd (e.g. a doc change that was applied to master, but is not
> needed in dunfell). To get the list of such changes, I look at each
> patch in dunfell vs master.
> 3. in yocto-docs, I had to 'revert' some patches first before I could
> cherry-pick all the sphinx changes, and I have then 're-applied' the
> changes later in the branch (of course when I say re-apply, i mean i
> did it again in sphinx instead of docbook)
> 4. Then I took as many patches as possible from 'master' which apply
> to dunfell.
> 
> I understand this is a complex 'merge', and I must admit I have gone
> back and forth on whether we should do it..  I couldn't find a
> simpler
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

Thanks for working on this. I'm in favour of merging and then handling
any issues we find as they arise...

Steve: How/when do we want to do this?

Cheers,

Richard

