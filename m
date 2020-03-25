Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.19201.1585159897521254345
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K4U+6uiQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id z5so3547235wml.5
        for <docs@lists.yoctoproject.org>; Wed, 25 Mar 2020 11:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7V8nmEtbrLg2SRf1LI+/mKWpdaOqU21aHE2HY64u848=;
        b=K4U+6uiQSNYIm959HO0cKNSaTiCjLS+JSgt2/2HOjQFjP8D6tHcDK35FhbR1g4yQPi
         uUpHZQOzfo/tUEesh+yXEfWikIB8TawJ6T4zNH89uyqpZkrqx6uAZCW2+nblGJPoIZxS
         X0wc9OmAyw7yPJBtFx9qvWM/zAtSdPg7XM0ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7V8nmEtbrLg2SRf1LI+/mKWpdaOqU21aHE2HY64u848=;
        b=ePFrSBObJ3soYJysIq9DroFEN/Y9L+p/6i8MQO6lTYhCl3JfQktOOAusqTZemnczEB
         ILvRibBdjP7lnmw+N1xU/c8q0dKqlCvFq/EGq1178pNh4myrmMiGtHzoJUtboI/oN+6g
         lTHbWZRC445OpQivv4K0WUUFNw08C6eYU+rC4oI+4rbUQ5b6hwM7//RwugU8Ag1SPUbS
         kPD88Bcd6Lx7adJV3c3xLEbQriN+lTKM4PRd4luskxc63W0Gkj7CJUAC/HrX46WVfDl5
         eAYvPJFx91KikhmWNRJVyU4N/0OkdU2frqt5lwOOFGNYUR4MgY00N7+TWAX7Doyx0Af9
         6kNg==
X-Gm-Message-State: ANhLgQ3rrJM67Z5gr1GChA12fTpC/YBOliZWMmOUNhYtZ5/Ar8MvyGXA
	wI2epjSRM7TwOZAcrxtgX/12RV2HNc4=
X-Google-Smtp-Source: ADFU+vsD1uvayZ1raKhL1a2jPxI1qG72y8LDj0TuMe/fPEOCx06+/26fFAiKGxX92eSpmnY0kjm12Q==
X-Received: by 2002:a7b:cc72:: with SMTP id n18mr4731166wmj.71.1585159894374;
        Wed, 25 Mar 2020 11:11:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f187sm10323706wme.31.2020.03.25.11.11.32
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 11:11:33 -0700 (PDT)
Message-ID: <938f27c0948b5a6f3d8c032d97482a01a8c141bd.camel@linuxfoundation.org>
Subject: Re: [docs] bitbake variable glossary versus YP (ref manual) variable glossary?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Date: Wed, 25 Mar 2020 18:11:32 +0000
In-Reply-To: <alpine.LFD.2.21.2003251331320.25486@localhost.localdomain>
References: <alpine.LFD.2.21.2003251331320.25486@localhost.localdomain>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-03-25 at 13:45 -0400, rpjday@crashcourse.ca wrote:
>   was puzzled over a lack of some important BB_* variables in the ref
> manual variable glossary, until i remembered the bitbake user manual,
> where i can find them, but there is an inconsistency between the two
> manuals in that *some* of the BB_* variables are listed in the ref
> manual variable glossary (eg., BB_NUMBER_THREADS) but not others
> (eg.,
> BB_NO_NETWORK), which could lead to some confusion.
> 
>   even weirder, some are in the ref manual while *not* in the bitbake
> user manual variable glossary (eg., BB_SERVER_TIMEOUT). is there some
> sort of pattern as to which variables go in which variable glossary?
> as it is, it's definitely inconsistent, requiring one to bounce back
> and forth for a complete coverage.

I think this is just incorrect. The bitbake manual should define the
variables implemented in bitbake, particularly the BB* namespace.

Cheers,

Richard

