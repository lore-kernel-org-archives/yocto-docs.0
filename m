Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.7000.1628072128762454117
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 03:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R5QFyUy3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b13so1620488wrs.3
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 03:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hfoWpyhs1X2KVo4WaOutnzqHaZcF3OF7DdLi9ja9pjA=;
        b=R5QFyUy3QbFMjleTCFFbScNG9C+GgFgjSVZ03l5tnyS+ck78Sw/V5JFpkqRLbi+QFs
         kXIov9s1Mzw8iyFAwU+Hehi0MmoRAT/i8qC/TF0TrQy7qNrNXP4g2g0JSoSI174RBJzX
         sXUKVhAVD/NTjDl2z1TzSqrhBojkO6KWcScU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hfoWpyhs1X2KVo4WaOutnzqHaZcF3OF7DdLi9ja9pjA=;
        b=qsKVsxbsncZDtnX0XRhHFg5ukA4cJyHEWwrl1TSx/dH/dnJaf7MG1xQtafu44nyZiG
         lbIieO/C2Fnc4xQxzoHmYNX+CAxzWzr81LKJ2sJYpbJDN1cpMbUKEhOa0mCNS4ATXx1F
         dK1tyxthZy0WjTj13gMVSn5DNDmlr6Kug4BSd2nmIC0B7aZsM7xQcbPNjdTa7bzchwCR
         48bTfy+ikBzDeMbT/XhuhLRBUtUsef+NZ6dJwpogpafgPgnIS2x53ZSREr3sVKDfMsy5
         +BvYsnx6pc3mKZBcWL/syBML0teDGytRBAOuzv3VaQCOprlm9CK46Q6vV6Wm5Ctmlgyq
         fc9w==
X-Gm-Message-State: AOAM532wCsniXLbeF/8+7XeWAL9HpKHIBr7iENR7sAyeubsrTv7GKmdX
	ksalYtm/P9VEIyYXkrhHPHVv7A==
X-Google-Smtp-Source: ABdhPJx3hfMJFt2i610NJbKLg8fPfHViwUqZyc8asv4QwRirnOqLJbedw3WnnE/1/YHtLFpt3TBCnQ==
X-Received: by 2002:a05:6000:1148:: with SMTP id d8mr25217335wrx.119.1628072127105;
        Wed, 04 Aug 2021 03:15:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id n186sm6274376wme.40.2021.08.04.03.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:15:26 -0700 (PDT)
Message-ID: <e3e42e73f4b5e84cf3674e5a7448c1b24532561f.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 04 Aug 2021 11:15:26 +0100
In-Reply-To: <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
	 <d982b722-9fd8-035f-878e-62ce7da99e9c@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-04 at 12:04 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> Thanks for the documentation patch!
> 
> On 8/4/21 11:47 AM, Richard Purdie wrote:
> > Add a note about documenting where a layer doesn't support 'core'
> > functionality.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  documentation/test-manual/yocto-project-compatible.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
> > index a7897469f..b83a0f12b 100644
> > --- a/documentation/test-manual/yocto-project-compatible.rst
> > +++ b/documentation/test-manual/yocto-project-compatible.rst
> > @@ -115,6 +115,11 @@ Here are key best practices the program tries to encourage:
> >     user changes a configuration setting to activate the layer, by selecting
> >     a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` setting.
> >  
> > 
> > +-  Layers should be documenting where they don’t support normal 'core'
> > +   functionality such as where debug symbols are disabled or missing, where
> > +   development headers and on-target library usage may not work or where
> 
> 
> Replaced "or" by "and" here, as we are dealing with a list of examples,
> rather than with a list of alternatives.
> https://forum.oxforddictionaries.com/en/discussion/27/such-as-or-or-and

I think it was more correct with "or". From your link, "If you are choosing from 
a list of alternatives, then OR precedes the last item." from that link applies 
here since you are not choosing a list of items and only one of the list may apply. 

> > +   functionality like the SDK/eSDK would not be execpted to work.
> 
> 
> s/execpted/expected/
> 
> This sounded like a system call, too much work with glibc, I guess ;-)
> I took care of this change too, and will merge the change into
> master-next (though extra reviews are still possible).

Thanks :)

Cheers,

Richard





