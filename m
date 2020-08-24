Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.472.1598286405186057645
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 09:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UBvdUc/L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id c15so9333882wrs.11
        for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2020 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xWP6e8zTku45IgQXRrWRFIBjflJjbmyu4wIdOqQJRT0=;
        b=UBvdUc/L9/SEpMNZsSU3rw+q4Wa0xxDJX5ent6D4mzkepvXWxnRx6xe2VC2UvOGbLi
         2/sr1qAIQhEQzZdSoBGozijDEh7okxoAvBpn/Bh6W5WIJoDOlaNS6BL+x9fIst6qlG3H
         6p7KoliqOP+HXvMPUhHHheb4LexK0jiSC9W6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xWP6e8zTku45IgQXRrWRFIBjflJjbmyu4wIdOqQJRT0=;
        b=jR7db4xXAkrnSDessZb5cPdIKfMNjZxaJ60JGDSa55zmN3xxZ5Qy86zYWK3GDpDn6p
         53epgDIr7E8u2aFgcI5hzCknE0drv7M31D6JDeinqV8ZjCqxaSD6g0xnYU/wbtOy/WX8
         1ahv4JuDAIgZLw5RAoDuByithhlVvzMEvPRYP2hf/W69hiHxZ+pgY7hSDbTvsxuhGOSA
         YHnNPX7LuGVmIDOB4bVMNPXqwdfRwe83dvDt4uTq3jb9rkIzwyUWG5XbWTkotJB2qm2S
         N05jG5VSCPqjNSsyk+p+/csvoCjYXkdXObFe7Ol588Yu9oHsMuofpP7vh5W1waPST5Ir
         j41A==
X-Gm-Message-State: AOAM532Ks38daG8IUZ3xek17R9Gkfr3v5cI2buWGHaeDgLMkwU6vx8eM
	omTBxXcPT7vJj+a7smPwAlr31g==
X-Google-Smtp-Source: ABdhPJzAP2YjD/IFDVYc/3crSGG56ufCIzeSPqJ6E6e9w/rH7dAavsh7THDMT5IyyTtEsUOf/8Vrfg==
X-Received: by 2002:adf:ee11:: with SMTP id y17mr6493499wrn.294.1598286403486;
        Mon, 24 Aug 2020 09:26:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id 5sm86844wmg.32.2020.08.24.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 09:26:42 -0700 (PDT)
Message-ID: <26281b762962ee37caf4f537d0c90f832cf49a5b.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Date: Mon, 24 Aug 2020 17:26:39 +0100
In-Reply-To: <CAP71WjzK3G1DPZPzoNrcK61n2duRoKsFN94dJoYyzQ0VAMdhGQ@mail.gmail.com>
References: 
	<CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
	 <c05381ddd372bc0e82e6b24ce45df4ae2df90e1a.camel@linuxfoundation.org>
	 <CAP71WjzK3G1DPZPzoNrcK61n2duRoKsFN94dJoYyzQ0VAMdhGQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Nico,

On Mon, 2020-08-24 at 17:48 +0200, Nicolas Dechesne wrote:
> On Thu, Aug 20, 2020 at 12:59 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I hope you're having some good away time! I'm sending this while I
> > have
> > the context in my head ready for when you get back. Its taken me a
> > lot
> > more work than I thought but I think I have something ready to
> > share in
> > this area now. I've published some sample output at:
> > 
> > https://www.rpsys.net/yocto-docs/
> 
> I really like the output, and the added features. I don't like as
> much how it's done though (the Makefile changes and the multi-pass
> sphinx runs..) but that's an implementation detail ;-) But with the
> current output we can create a standalone YP documentation 'web site'
> that contains all our old docs (for all releases) independently of
> DocBook vs Sphinx!

I don't particularly like what I did to make that happen either. It
felt like I just hacked sphinx to make it do what we wanted. They are
separate "doc" entities in their own right with no connection with each
other apart from the links so that seemed to require separate sphinx
build runs.

Obviously we can separate out the make target, probably use more
makefile magic to generate the files rather than my horrific for loop
and so on so even if we're stuck with this, it can be neater. I was
focusing on making it generate something which looked like what I think
we need.

> > Basically this combines the existing docbooks docs into a structure
> > with the new sphinx generated manual such that you can select and
> > nagivate around and see the different versions/options.
> > 
> > I'd ultimately like to replace what we have at
> > https://www.yoctoproject.org/docs/ with this. I appreciate there
> > are
> > four links there we still need to add into the new docs page:
> > 
> > https://www.yoctoproject.org/docs/what-i-wish-id-known/
> > https://www.yoctoproject.org/docs/transitioning-to-a-custom-environment
> 
> These 2 could potentially be converted into Sphinx RST files,
> assuming we don't need them on the YP 'website'.

I ended up adding links to these on the top level index page so I
effectively handled that. They're docs Tracey wrote and I think wants
as part of the website but we can discuss that in due course if needed.

> > https://www.yoctoproject.org/software-overview/
> > https://wiki.yoctoproject.org/wiki/TipsAndTricks

I also worked links to those into the index page since I sent this
email.

> > but other than that I think its much more navigable and usable for
> > users. Features/changes include:
> > 
> > * Clearly showing which version you've viewing (yes, css needs
> > work)
> > * Drop down selection of recent versions
> > * Drop down selection of the format you want
> >   (individual web pages or all in one mega manual)
> > * Older documents with newer point releases show a warning in red
> > at
> >   the top
> > * Obsolete releases show a warning in red at the top
> > * All the releases are listed on the main page for search engine
> >   visibility which should improve their indexing and avoid some of
> > the
> >   version issues we've had (I've gone back to sumo at present) and
> >   make it clear to users how 'behind' a given version is
> > 
> > I know the sphinx transition isn't complete so the "dev" manual
> > version
> > has all the issues still needing to be resolved with the
> > transition.
> > The CSS also needs a little more work to help with the
> > colours/layout.
> > 
> > I'm interested to hear what people think of this...
> > 
> > Code is in the yocto-docs repo on the sphinx-rp branch. "make -f
> > Makefile.sphinx" will generate the docs I've shared and the
> > generated
> > output in _build/final is designed to overlay the existing docbook
> > docs
> > and all fit together correctly.
> 
> Sphinx has a fairly advanced extension mechanism support. My gut
> feeling tells me that a lot of what you did can be achieved with a
> nice extension.. I will need to think about that.
> See 
> https://www.sphinx-doc.org/en/master/extdev/index.html#dev-extensions

I will take a look, the challenge is that the way I've done it, they're
each their own document and I think they perhaps need to be to keep the
navigation working the way we need it.

> For example, here is a simple extension used in the kernel doc
> project:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sphinx/maintainers_include.py
> 
> But we can interact with the Sphinx builder at any stage of the
> process. For example the whole generation of the 'old' index files
> could be done this way. I would like to figure out how to produce
> what you have in a single Sphinx run... But for now let's focus on
> the actual output you have and get some feedback from the users as
> much as possible, whether this is useful.

I did mention it in a few of the meetings last week and so far its had
positive reviews and is something people would seem to find useful.

Cheers,

Richard

