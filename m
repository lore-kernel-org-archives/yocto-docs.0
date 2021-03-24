Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.3571.1616621351365634675
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 14:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MiPPf+xB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id k8so250939wrc.3
        for <docs@lists.yoctoproject.org>; Wed, 24 Mar 2021 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nN+xboHTZozwtpEJ5Rx9s7nEHGvMXvPqFPzzwVBSmxo=;
        b=MiPPf+xBDLuO3QAENdUgGEeT/+ahnqxatIfHFwUqYgvkGZgiW9PkOxud/rk3u9b36A
         bOlokPI3c6KrQPXqQmvAdQqsi54+M+ki1jgWGtstqfmY+fb0R4zgVzu+sNUqfpO/Lhyo
         oK7fsOJgiTQYEChKbogdsPGmCLz+5Vr2dTmls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nN+xboHTZozwtpEJ5Rx9s7nEHGvMXvPqFPzzwVBSmxo=;
        b=VowXx9CQFX/RysaASZIP1kyizwcWA4AOtTaRBqIhdHVgJL8BkSajtw0BlMjyq6VBP6
         +h+wsGL6QamAbVrVNiAKjFtq4CTKsdYte22TFz26iVV4/UGSBvI486xhZIICgLJP4K9C
         CJ8sgfWPPklMm/MMjQtVsNvWzyPqPgL/LUxjO17VrNBZB++7kAc/Afx48jRaijl9nhuB
         WLXP6NdX0jhdJrHq+vTwGBZ91651r+24J0FK8A6iQms/FkU1VoRDizD5YeR/305ySZAC
         5J5Ichv8imNZpghpXTcTZOlCxt8zVWkkn/dvmmkRO1iAsQR/f1ScNXn1/UTstbxkV6mC
         aYPQ==
X-Gm-Message-State: AOAM530cGe/JGaLtRTSikb5Ug65Dvlf9fgE3tM4GmvyK4bRmcfT6g9Ds
	ewSMUqjeN9q++wDNjEWciOSUD71BJ+/KAQ==
X-Google-Smtp-Source: ABdhPJysz4PYbUsknXsHNI5LA5Y7eceljhWkgIgcXwXe484nt2Ru8lS8CNr3iQexYG6pKMeffZ5Naw==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr5521029wru.214.1616621349495;
        Wed, 24 Mar 2021 14:29:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id x23sm3748639wmi.33.2021.03.24.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 14:29:09 -0700 (PDT)
Message-ID: <ae4571fe0938c3e093a982f896c5d10606f9edf2.camel@linuxfoundation.org>
Subject: Re: [docs] HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 24 Mar 2021 21:29:07 +0000
In-Reply-To: <a8f08050-fcfa-444f-0e7-9074a2e7c430@crashcourse.ca>
References: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>
	  <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>
	  <b0edd6d-7221-1f7d-cb6-6068c6963e23@crashcourse.ca>
	 <abc98a06c805118148fb3dd5539b785d748aa24f.camel@linuxfoundation.org>
	 <a8f08050-fcfa-444f-0e7-9074a2e7c430@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 16:06 -0400, Robert P. J. Day wrote:
> On Wed, 24 Mar 2021, Richard Purdie wrote:
> 
> > On Wed, 2021-03-24 at 12:49 -0400, Robert P. J. Day wrote:
> > > On Wed, 24 Mar 2021, Richard Purdie wrote:
> > > > On Wed, 2021-03-24 at 12:06 -0400, Robert P. J. Day wrote:
> > > > >  yes, i realize the end of that entry gets around to that, but
> > > > > that should be emphasized from the beginning. i might even throw
> > > > > in a link for the reader to here:
> > > > > 
> > > > > https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host
> > > > > 
> > > > >   also, the required presence of those tools on the host is
> > > > > totally independent of whatever ASSUME_PROVIDED is set to; the
> > > > > setup_hosttools_dir() routine in base.bbclass has no interest in
> > > > > the value of ASSUME_PROVIDED. so even if some of those tools had
> > > > > been built natively by the OE build, they would be ignored
> > > > > entirely.
> > > > 
> > > > No, they would not. If they are built natively, they would be injected
> > > > into PATH ahead of HOSTTOOLS and used.
> > > 
> > >   really? i was unaware of that, i should have checked more carefully.
> > > i find that confusing -- effectively, this is saying that certain
> > > tools *must* exist on the build host, but even if they do, they might
> > > not be the ones used? that seems counter-intuitive.
> > 
> > If you add something into DEPENDS, it is used instead of what is on
> > the host as long as it is not in ASSUME_PROVIDED.
> > 
> > Adding something to DEPENDS and it not being used instead replaced
> > by the host's tools would seem worse...
> 
>   i was about to say that makes no sense until i think i finally clued
> in, so let me try to summarize what seems logical (i'll eventually
> verify this against the actual code ... someday).
> 
>   obviously, HOSTTOOLS represents what absolutely has to be on the
> build system -- effectively, minimal host requirements to bootstrap
> the build. so the very early part of the build verifies the existence
> of these tools on the host, then downloads and configures enough to
> start the real part of the build.
> 
>   at this point, the search path is extended (prepended) to now start
> using the tools built natively. (if i was explaining this to someone
> else, i'd say something like, "you need the host git executable to
> grab source code, including git itself, but once you build those
> tools natively, you'll switch to the natively-built git.")
> 
>   *now* that makes sense since, while the host tools might vary in
> terms of version, tools compiled by the build will be absolutely
> predictable, thereby guaranteeing a stable build environment. in
> short, the stuff specified in HOSTTOOLS is needed only early on, then
> it's superseded by the built native tools.
> 
>   except where ASSUME_PROVIDED comes in, but i think that's clear as
> well.

Right. We switch to our native tools in some cases and not others, it 
depends how stable/predictable those tools are. In general we don't use 
git-native but some recipes have a specific make-native DEPENDS for example.

You'd think make was stable, but no...

Cheers,

Richard

