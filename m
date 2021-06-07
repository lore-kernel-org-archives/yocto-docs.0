Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.549.1623082608250418270
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 09:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gdBnVso6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id e11so8079554wrg.3
        for <docs@lists.yoctoproject.org>; Mon, 07 Jun 2021 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vyun70Y1lWRBaXe70T59Hr6oMc7TqEmiSpCnbgLv0yo=;
        b=gdBnVso6+NW3kGlTitGs8Jn+EXRndM3lL8esUXOrQrVHh6rkgSXFkmty4H66h5AKcL
         e2Te+9/NbH9KxSGYDjVLHFrrcRO/zPj2UQbPxUHLI4sYeQgd7Ttr+tTn0jHNpqZ+Fp7/
         jnyqXp5nIUZ0ibAgadWNtxP5/5KfFVRDShsQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vyun70Y1lWRBaXe70T59Hr6oMc7TqEmiSpCnbgLv0yo=;
        b=JPApFPNN3WyiXdFkGetbJ7KIvmDJyr+vD6UW1Ayu29CYzhx2RUndVU71Qxcy88jMkC
         Z9ipqic/hNMjua0ovtZRHJh5hsaLDxiSdczFL/VqrUGnoAz2j6/dVDiOI++q0F40Yjvr
         6HQqeDRCcD59uvkx2lPGil5x7OttpVZS+fJobR2r1VBZzr/9zjwo82h9VAXeDdWUqlex
         VF6UyEefmpagEd23bmc5yOiZx+EdhBoX+9wwGp1d6eIPrtQTizQ+t0HR0j6fsnkI8Ibk
         E6UrRNEP1kozhTynHJrBJoIxz6Wrv8RqUzZ1RZXQSfpnN6GSw4eWChVwlhyF1NzIUlEF
         xo0g==
X-Gm-Message-State: AOAM531D7wkiJXffgaCWVgkm4taBjC1i4Zk6WUPpvkVTvH1hDGJTcXwq
	B6TafFsHto0HJFMmMHRkC8TnTw==
X-Google-Smtp-Source: ABdhPJzYwMexjAZFgZN4lOPpSOhTSbM0PfB8CX3t+Nn1EwcLfhVY/f+fgcGHmG+Mn7CLvQCT38aPNQ==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr8684554wrb.289.1623082606618;
        Mon, 07 Jun 2021 09:16:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27? ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27])
        by smtp.gmail.com with ESMTPSA id r2sm16838627wrv.39.2021.06.07.09.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 09:16:46 -0700 (PDT)
Message-ID: <d986d79263894ada0e1bf2e5777419ecc6b6f18f.camel@linuxfoundation.org>
Subject: Re: [docs] [poky] [PATCH] README.poky: Update to switch to markdown format and update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: docs <docs@lists.yoctoproject.org>
Date: Mon, 07 Jun 2021 17:16:43 +0100
In-Reply-To: <20210607155906.3hgtcl6fsyedstrh@qschulz>
References: <16865661A55682C8.7118@lists.yoctoproject.org>
	 <3c7b1f74d4b989316e24be08db75f34720198e2d.camel@linuxfoundation.org>
	 <20210607155906.3hgtcl6fsyedstrh@qschulz>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-06-07 at 17:59 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Mon, Jun 07, 2021 at 04:36:22PM +0100, Richard Purdie wrote:
> > Mentioning on the docs list.
> > 
> > I a plan is forming to migrate the various READMEs in the repos to markdown
> > format and display these in the git web interface in the about page. If this
> 
> Does it need to be in MarkDown format to be displayed in the About
> section?

No, but it does help a little and see below.

> > merges I'll work with MichaelH to make sure it displays properly on the
> > about page.
> > 
> > I've had a go at improving the poky one which needed a bit of modernisation
> > anyway. Help with others welcome.
> > 
> 
> Anyway to have those two changes separate so we can properly review each
> separately?

I can reverse engineer them back apart I guess, I just couldn't bring myself
to leave it as it was as it needed reformatting and so on anyway.

> > I am a little torn on this as it does make the README harder to read
> > outside of rendered interfaces.
> > 
> 
> But it'd be displayed correctly in the Github mirror and Gitlab for
> those using it I guess.
> 
> Most projects hosted on Github/Gitlab use MarkDown so I don't think it's
> such a bad idea, I'm just not sure it has as much benefit on cgit since
> it's not the landing page of the repo (the summary page is).
> 
> If we can display the non-MD version in the about page, I don't think
> there's a huge benefit of migrating to MD?
> 
> If we absolutely need MD for the about page, go for it as it'll cover
> Github, Gitlab and probably others.
> 
> We might want to modify bitbake-layers create-layer to provide a
> README.md too instead of the current template?

There is the issue of needing to display a best practices badge somewhere
for the project which only really makes sense in markdown format which
kind of pushed me into this.

Cheers,

Richard

