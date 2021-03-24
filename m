Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.6491.1616595048320224531
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 07:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+mCpkqj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so1265357wmf.5
        for <docs@lists.yoctoproject.org>; Wed, 24 Mar 2021 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=OBh3fwjo0LYxvT/tSU5H1qSqr08utceQy+eJHoIV/T4=;
        b=K+mCpkqjl29PO1GOn0EdxsO/ScoAcmN/GSuhdtTKiP9buDuJTtAVPKCoshVUZWaQUy
         CP3wUbZlzvJNDye5ymTiyT/GAC38EmTTqv2P+0PcAA1UWdWu1seMm+XQZ/t8RH+/Tfm0
         cGqpr5LOOaJcVRAEeAfPhTVGgEcNFSde6G6lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OBh3fwjo0LYxvT/tSU5H1qSqr08utceQy+eJHoIV/T4=;
        b=TKiZXeLEiwoa20UwfmiEOYEAzmfHKwTM1AwWjLDx3gfmR8IVQXNl8N7CJBLXPUTyy7
         B0eg2lH+cP7NnGK9M3S5TgMqqlMhmQb7Zb36efn1cEuAfXdUglIh1D7Go/YioOg6hm9v
         uVr7bnzopn1DBiN6+B2wgxTJds8FFKY6SMyb1jooIjPzGiLonyleks33OJBVtdI/qLVH
         8jRTIUZl3ftzE9cRc9h0Y5oml0OyZta3F4iLMRdAZ2nHXH8so+nBgxX79T7H6kUZd3IY
         dlPE/zGe4B8976WrSh/1G1rkXmtswkcTxEcOw8zXuqOxShGPToyg0f4ZuUU2TxL//8EI
         fXaA==
X-Gm-Message-State: AOAM530Yq6+EfiKBkbiYeOoDgzOkBEJSMA4IW9IKoiLgK6W+9CJ4cRY0
	cTbTxTuOYAGpT2nLlVkvcaubAw==
X-Google-Smtp-Source: ABdhPJxD1rTLZhgXbFoQZSSDBkaZtJibVlGj3v/WkNhYtgjQQR+tI5CZtPELFxrYoqIloUd+xFByfA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr3200335wmc.51.1616595046138;
        Wed, 24 Mar 2021 07:10:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id w22sm2608190wmi.22.2021.03.24.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:10:45 -0700 (PDT)
Message-ID: <8928ef60d3acc30cf81a11016a697f76dadf0307.camel@linuxfoundation.org>
Subject: Re: [docs] trying to clarify meaning of ASSUME_PROVIDED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 24 Mar 2021 14:10:42 +0000
In-Reply-To: <23422e6f-1232-0e1-a2aa-5e85af3d493@crashcourse.ca>
References: <23422e6f-1232-0e1-a2aa-5e85af3d493@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 09:02 -0400, Robert P. J. Day wrote:
>   i've asked about this before, but i'd like to really nail this down
> and perhaps update the documentation.
> 
>   current definition of ASSUME_PROVIDED in ref manual:
> 
> "Lists recipe names (PN values) BitBake does not attempt to build.
> Instead, BitBake assumes these recipes have already been built.
> 
> "In OpenEmbedded-Core, ASSUME_PROVIDED mostly specifies native tools
> that should not be built. An example is git-native, which when
> specified, allows for the Git binary from the host to be used rather
> than building git-native."
> 
>   re: that first paragraph, what does it mean to say that BB assumes
> these recipes have already been built? does that mean that, without
> building that recipe, the build should expect to find on the host
> *all* of the executables that should have been produced by the native
> build of the recipe?
>
>   for example, consider recipe "zip," which produces four executables:
> zip, zipnote, zipcloak and zipsplit. if i add "zip-native" to
> ASSUME_PROVIDED, am i implicitly stating that the host is expected to
> provide all four of the executables that would have come from
> zip-native? and note that, on the host, even if those four executables
> exist, it's possible they came from a package or packages other than
> "zip."

The definition is a little fuzzy and you're not going to like it ;-)

ASSUME_PROVIDED = "zip-native" is generally thought to mean "zip" itself
and not the others. HOSTTOOLS can clarify what might be meant.

This means that anything requiring zipsplit would have a challenge
obtaining it. That is unfortunate and why we have file-native and 
file-replacement-native. The reason being that libmagic comes from 
file-replacement-native.

There is no easy 100% foolproof way you can determine exactly what 
is/isn't covered by ASSUME_PROVIDED. Our bootstrapping requirements were
established by trail and error to "document" an existing system.

>   in short, if i ASSUME_PROVIDED "fubar-native", am i saying nothing
> more than, "all of the executables that would have been provided by
> building and installing fubar-native exist on the host, regardless of
> how they got there"?

Roughly speaking. There are exceptions, e.g. libsdl-native.

Cheers,

Richard

