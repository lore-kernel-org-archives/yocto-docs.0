Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.16333.1604074646945358930
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 09:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GR5j6CvB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i16so1676991wrv.1
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PPMvnl041I6fNzx0oAyIseeEFJCyuQB1he0tFZI/5tE=;
        b=GR5j6CvBR/1aEzJKGY2ziIMr1rAm1tmuZAVLvAeK5xELYwXb3XmuGu6F4bdz9UzLJS
         bCg2H7RVCmPu5l5rHHdvXQkMWqYFEyIwEN63VhFl0/BoGJ25Zi5BtAd+gtgWZ3sIhJjf
         +3ieGX7BOIEgDPyavAKhgXt/pe/IZt+C+lCg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PPMvnl041I6fNzx0oAyIseeEFJCyuQB1he0tFZI/5tE=;
        b=oa26qK67R2hVK0MGzjbzY2fyAcXeFP0T0nsw4Evcs2imuXC0OPYDUUBFVnoBl0WNnW
         ilFoKqgZ3aNNjoHQTYBgDeZx2L88Av9dzRbpchvSOCRNqPVGJVn76u28bileS1b2gbeH
         NuaO6XspmnB11UQJZDZFVJCZoL/TOJmZFTZx1xaai8n6yNGRw2uuuAeWZ2MKib3R1n3u
         K7R9EJDK4TbQHKo/a1fB8qL1GoV4iH/bEGu72qvB+6TPha5pQU5/D/VDq5mF9mJ9QzfA
         W6aJ//jrQTcgChOZum0KeOyP+04Z7w0fk7ERLHpbGYz4LEIrzLj4bi1OKnGtp0OsTJFj
         yjUg==
X-Gm-Message-State: AOAM530HAICH8FSVhxQVcz/XVD0ixLXplX8AGDZ1SEWMKaGt9ICRcXfE
	dlZz6/zy/ckejPBlTwDPN13xeQ==
X-Google-Smtp-Source: ABdhPJwdHUngIOHql7wTbLzhtnVFidgcdlOB4m8qHhKUQZme9aYj6yzKCmVT6G6gb5fUHYd5aWHEGg==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr3889529wrp.44.1604074645440;
        Fri, 30 Oct 2020 09:17:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d442:f240:38e1:1bf4])
        by smtp.gmail.com with ESMTPSA id o7sm11229399wrp.23.2020.10.30.09.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:17:24 -0700 (PDT)
Message-ID: <bd954407f7c1237bbc1c1f74328e8cfcfe65a2f7.camel@linuxfoundation.org>
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, "Robert P. J. Day"
	 <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 30 Oct 2020 16:17:22 +0000
In-Reply-To: <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com>
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca>
	 <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 17:03 +0100, Nicolas Dechesne wrote:
> On Fri, Oct 30, 2020 at 4:07 PM Robert P. J. Day <
> rpjday@crashcourse.ca> wrote:
> > 
> >   in the midst of messing with "::" markers, i just noticed that
> > there
> > is a *ton* of literal code block markers of the form:
> > 
> >   ... blah blah: ::
> > 
> >      code stuff
> > 
> > this seems clearly overkill as the trailing "::" obviously starts a
> > literal block, while the definition of the marker includes the
> > explanation:
> > 
> >   If it is preceded by whitespace, the marker is removed.
> > 
> > in short, this appears to be *exactly* equivalent as if you had
> > simply
> > written:
> > 
> >   ... blah blah::
> > 
> >      code stuff
> > 
> > the apparent effect in the original being to start a literal block
> > while leaving the preceding colon there -- just what ending with
> > "::"
> > provides. does that seem about right? one suspects there is a pile
> > of
> > marker simplification could be done.
> 
> You are correct. all instances of ": ::" can be replaced with "::".
> If
> you make the change, you will notice that the generated HTML is not
> changing.
> So it's a style question. I would prefer the short "::" form, let's
> check with RP and Quentin first as they have been the main
> contributors so far!

:: is probably neater so I'm fine with that. Its a learning curve for
us all.

Cheers,

Richard

