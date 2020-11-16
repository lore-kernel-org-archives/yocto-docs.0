Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.33689.1605527600329596550
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 03:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dgmcs8+Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id o15so18373903wru.6
        for <docs@lists.yoctoproject.org>; Mon, 16 Nov 2020 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ALuK3hS/874N6I0Ma5lmVVMUdgoTOgTBFZ+wxJV///U=;
        b=Dgmcs8+YfHhB7OhK1dF/y5/VpH4e0h8LXAQ9uK4yGa7s52EvRuMUy3D0Aisl5RtPrd
         XmiDnLazmPWQa+kKFbHPmBJ0om7j8jjNpTBTuoreUkA9Imv3Hy0yDkf5x55wF6ZocGSm
         +UazW650SpnZFJeNBH2Enz+9pxJarCH8CqGMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ALuK3hS/874N6I0Ma5lmVVMUdgoTOgTBFZ+wxJV///U=;
        b=HsjHtIlmno9fXVj140NZ42OZgyX4xTqDEE+uKNGtBmPfX/lR2LIWV18wdUHtH9+ara
         1oj9400xwKJYxO+36a3halkEr4xptZkgmLDE6F4lHXGpbRlJvVVHfCP77TVkJ7+d3vkm
         Iat1derG+A89VxvACLk6CFxN6VbMtRot+rAj275XSc/FONnqWxZ1NQI9Er6meA4v/9Go
         qXTxtZ19LI2hLKZpn7TTKs6s2fISeC5GmvdeYCeXU0PrBgXXZGnLhb8bV6pRr0haAD4v
         EfFudO9V8gpSeudXlBXbGyY8N/xjiS7gtbZOpCFEqIV3IZGbFxF4zFYyn8ED/X3R3tC5
         stVA==
X-Gm-Message-State: AOAM530z4P8cmREgE0gMC3eYLelaPiplHUQtoz9lAZPurqevGs0hafL/
	35KaGoSp8UiKi7kbrk4PwzS4QA==
X-Google-Smtp-Source: ABdhPJz9aJX5XfGO94+TggYiYV5+q4+mBr8ABWYAqrUBrneZcqOto9vXiRw9PI8UtyYGfE9OITxtRA==
X-Received: by 2002:adf:fd0e:: with SMTP id e14mr18543838wrr.119.1605527598600;
        Mon, 16 Nov 2020 03:53:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.2.2.0.7.3.f.1.3.6.f.f.7.9.4.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.2.2.0.7.3.f.1.3.6.f.f.7.9.4.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9497:ff63:1f37:222])
        by smtp.gmail.com with ESMTPSA id n23sm19533370wmk.24.2020.11.16.03.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 03:53:18 -0800 (PST)
Message-ID: <7b59797dab498496b313e5443397d649bb4196a8.camel@linuxfoundation.org>
Subject: Re: [docs] Docs website dropdown menu
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 16 Nov 2020 11:53:15 +0000
In-Reply-To: <CAP71Wjy=BnM6bpSGE+WzW4LiUfHRQrpQCCt4=4_hd3+d0CHFOg@mail.gmail.com>
References: 
	<CAP71Wjy=BnM6bpSGE+WzW4LiUfHRQrpQCCt4=4_hd3+d0CHFOg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-16 at 09:33 +0100, Nicolas Dechesne wrote:
> on the new website, we have the dropdown menu that allows us to
> switch
> back and forth between the 'individual pages' vs 'mega manual' and
> between docs versions.
> 
> It's implemented in a piece of javascript , in file switchers.js.
> That file has a list of docs version to 'show', and it's slightly
> painful (and wrong?) to maintain the list of 'active' versions to
> show
> on the website in docs sources.
> 
> I've been trying to decorelate the list of 'versions' from the
> implementation. Here is something that more or less works (it's not
> fully tested yet), but I wanted to get feedback first to see if it's
> going in the right direction.
> 
> So all_versions becomes a 'table' that includes all information about
> our releases. For each release, we can set attributes:
> * version is the actual version
> * name is an alternate name to show (we use version if name is not
> defined)
> * show is set to 'yes' when we want that version to appear in the
> dropdown menu
> * docbook is set to 'yes' for docs built before sphinx (it's used
> when
> we switch to mega-manual page)
> * state can be 'outdated' or 'obsolete' to display the respective
> warning.
> 
> Then in the .js file, we simply read data from all_versions. The next
> step would be to put the definition of all_versions in another file,
> outside of git. And the release manager would update this file as
> needed.

Seems reasonable to me at a quick glance, I didn't check it in detail
as my js is limited but if it works...

Cheers,

Richard

