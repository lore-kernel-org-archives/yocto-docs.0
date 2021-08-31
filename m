Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.8618.1630429139138246297
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Aug 2021 09:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TRK/wXU2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so2697069wmd.3
        for <docs@lists.yoctoproject.org>; Tue, 31 Aug 2021 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2O/9H1/Y6E1MgGl6Lv6LFOkG2CrvdKWEGiO12pX/j6Y=;
        b=TRK/wXU23Q3JaIpyjm8pC90VhqhZu4zXIfW/yd/YM1tiz7pDGkpVnoGw6X5SH/9SW9
         8i6Lb9pbDpBB/CPA8tbmSnNP8Tyhupl4zKie2lLhjqASxbwfSbXivkRas6PJhlbkfE85
         k2gQf56gVSZmHs8jdHRCCDJKXrYlDTQUBUkYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2O/9H1/Y6E1MgGl6Lv6LFOkG2CrvdKWEGiO12pX/j6Y=;
        b=KvGBIXoKiFTNnyrV0/6Ak0lz5Cjkbg/RFiq2JtFqrHXz700dtBQZV7dDCbWB0ZeemA
         mWoxgOjQy3X4g0zXljVSTh7ipJ09/wqCPmytfhwdEziqyxOelC+yWPGZ41fC8FBDqOjX
         u0D1IJw0/pa8wqw17PwhQoHGJWE9yqkDJGLeh2/frK+jLGhOWf5/axnE1RE301b9V6LE
         nbYSvV0JCPAgsEvNfWIg2tyv8neDE318562tTjgEqDSSVBkGr9RbWSf9XCvctysz2gPA
         Yto8cQsIGDjazBXTQkYRfPq2FAxKesl/7e9AlgyuFXrJVoDqzrMOd5YInQSmqyjf4HTX
         8YGw==
X-Gm-Message-State: AOAM531PFseuRVYildcu9+jgK7tmzuPvVXf0lCUZmZ8dPVRzt8ecKI6Y
	+r+4RsiGQjbJo6X/pVjfyGjShg==
X-Google-Smtp-Source: ABdhPJwgsCGF6v3sjL6+OfcM1FERch2TSRYvt6xMaJE+hpK7bGfEkKvhSsTzS7l3VS5usX32bbKm0g==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr5253940wmj.63.1630429137624;
        Tue, 31 Aug 2021 09:58:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e840:dd4f:b947:28bf? ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id n8sm18933568wra.24.2021.08.31.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 09:58:57 -0700 (PDT)
Message-ID: <d4b3543f48d2bb3704e8597aee0d1f82d09e9483.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] dev-manual: correct note about virtual providers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, "Robert P . J . Day" <rpjday@crashcourse.ca>
Date: Tue, 31 Aug 2021 17:58:54 +0100
In-Reply-To: <d0a37a8d-58d4-1675-90d5-42df39b4d956@bootlin.com>
References: <20210830153720.68398-1-michael.opdenacker@bootlin.com>
	 <795cdbf31208231b7ab001464b7247524aa6b459.camel@linuxfoundation.org>
	 <20210831094951.syxtrwtk65jziwbk@fedora>
	 <c5458825b741ce1fad5737d46a0a5210cabc4548.camel@linuxfoundation.org>
	 <d0a37a8d-58d4-1675-90d5-42df39b4d956@bootlin.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-31 at 18:56 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 8/31/21 12:01 PM, Richard Purdie wrote:
> > 
> > > How Bitbake chooses between two recipes creating a package RPROVIDES'ing the 
> > > same "virtual/something" is something I have no knowledge in 
> > You don't set that. It doesn't work. It isn't supported. This is what that
> > manual section is trying to say. Making the manual pretend it does doesn't
> > change this.
> > 
> > > but I feel like it's something that
> > > should be explained here, or at least explicit why it does not apply to
> > > runtime dependencies or point to where the providers for runtime
> > > dependencies are explained in the docs.
> > I've explained this many times before but let me try once again.
> > 
> > Bitbake is the interpreter of DEPENDS and PROVIDES and it can see multiple
> > providers and choose between them. We have full control over that piece of the
> > process.
> > 
> > Bitbake picks the combination it thinks the user wants and then bakes it into
> > the task graph. For any given configuration, one task graph should result.
> > 
> > The runtime namespace is quite different. RPROVIDES are written into the
> > packages and they are interpreted by the package managers. We have no way to
> > tell the package manager that when it sees "virtual/shell", it should be bash.
> > It would be something different for each package manager and at best it is badly
> > supported by the distros and packaging backends (e.g. dpkg-reconfigure). We've
> > therefore not gone there.
> 
> Thank you for the clarification. I got confused by the below definitions
> in recipes:
> 
> poky$ git grep virtual | grep RDEPENDS
> meta/recipes-bsp/grub/grub-efi_2.06.bb:RDEPENDS:${PN} = "grub-common
> virtual/grub-bootconf"
> meta/recipes-core/systemd/systemd-boot_249.3.bb:RDEPENDS:${PN} +=
> "virtual/systemd-bootconf"
> 
> poky$ git grep virtual | grep RPROVIDES
> meta/recipes-bsp/grub/grub-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/grub-bootconf"
> meta/recipes-core/glibc/glibc-package.inc:RPROVIDES:${PN}-dev =
> "eglibc-dev libc6-dev virtual-libc-dev"
> meta/recipes-core/musl/musl_git.bb:RPROVIDES:${PN}-dev += "libc-dev
> virtual-libc-dev"
> meta/recipes-core/systemd/systemd-bootconf_1.00.bb:RPROVIDES:${PN} +=
> "virtual/systemd-bootconf"
> 
> In these cases, if I understand correctly, "virtual/xxx" are just
> regular strings with no special meaning that the package managers will
> use, right? Should such packages avoid the use of "virtual/" RPROVIDES?

The virtual/xxx should not be there and yes, are just strings.

Cheers,

Richard

