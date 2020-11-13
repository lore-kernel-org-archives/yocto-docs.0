Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.2116.1605260154295372072
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 01:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bKcG3NHq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id s13so7767653wmh.4
        for <docs@lists.yoctoproject.org>; Fri, 13 Nov 2020 01:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Cm6m4fPc5rc0/KgbMUBU0msLiqSfui4JZIHS+awQtEs=;
        b=bKcG3NHqcRA6+TL92kaWzeUyDWDWQRDc/p91WndIhywkzK0DSqcRkdDAWFLferiShv
         83dK2FbzOlYJ7W00Lxp6Cp60FbP4S+NO5rxJXRqGlHS03llzW9NpLs1ReoGZY9EPYPfD
         RXsBmSN1cm/bSCncUkCzGK00mlq+TuJR0I8ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Cm6m4fPc5rc0/KgbMUBU0msLiqSfui4JZIHS+awQtEs=;
        b=NO/dt+lFAs1xCTVEaNZxLaBMVKSQSLfjgbr90amfujLKgwaUof7Q6NBlxS2V2QtkvJ
         Wo6GDZqn9/alfuec8yTg/IGhhl829YsFvRbdLIkodrF1WYoRCaGslNH9vYzPWHIZ/GuG
         FdG4hPCfNvOBhJIBJ2SBr1kaVRzO6ISwbjmEtesYe/ty+ugglfXz12SamhrWFb9p4Tcn
         gq+5/8Y9ayKfNJqeW+tCw3TOj/DFePjw5WgK/VRCQfwEXV0SnTGlDbNWVYXlkY8qIPk+
         GWawIUJbGAnNBo/Tuyy+uwWTEKBTifu7D2IjhJL9PHjyKUuHUIBcAR/q0wT+nt+fLwsy
         USRA==
X-Gm-Message-State: AOAM532XvWr4/EIoVoNnIJ14NnnibiVcQzDLd76n3usc1eae9UqJRmw4
	nqJIivxr53LZHPFn9fK/VBGLbA==
X-Google-Smtp-Source: ABdhPJwIFWmK8ac4nuUdYnU/qHq3x9tFb1kLiRQg//c3yacn14ghXDZP5AAC6PAOdPQnkBzv73NcjA==
X-Received: by 2002:a05:600c:2110:: with SMTP id u16mr1601880wml.4.1605260152558;
        Fri, 13 Nov 2020 01:35:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (e.3.a.b.8.4.f.3.4.e.5.7.b.c.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:48cb:75e4:3f48:ba3e])
        by smtp.gmail.com with ESMTPSA id o184sm9493542wmo.37.2020.11.13.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 01:35:52 -0800 (PST)
Message-ID: <29331cdb3acac797206206435262c8dd34000c14.camel@linuxfoundation.org>
Subject: Re: [docs] pdf output for Sphinx
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 13 Nov 2020 09:35:49 +0000
In-Reply-To: <CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
References: 
	<CAP71Wjy7eBbs3X4PWtXFeFGM3G1cxC7AejE4g+vtDW=jZwF7HA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-13 at 09:31 +0100, Nicolas Dechesne wrote:
> I just tried for the first time building a PDF from the Sphinx docs..
> it's not bad at all.. Of course it's *different* from what we used to
> have. In the previous docs system, each 'manual' was its own
> standalone 'book' or project, so we had one 'web page' and one 'pdf'
> for each manual or book.
> 
> The approach we decided to follow with Sphinx, is that we have one
> docs project that includes all our document files (books/manual,...).
> 
> Then, obviously, when we generate a PDF output from Sphinx, we get a
> single PDF file with the project's entire documentation, instead of
> many PDF files.
> 
> Just running make latexpdf into the docs folder generated this PDF
> file:
> 
> https://people.linaro.org/~nicolas.dechesne/theyoctoproject.pdf
> 
> It's a 7MB file, with ~800 pages.. My very first impression is that
> it looks really good, and to be honest, having all docs in a single
> file might even be better, from a user perspective.. If you open with
> a PDF viewer, you should see the 'outline' that looks like our 'left
> menu' on the website, you can search any term...
> 
> I have done no customization at all, I am sure we can customize the
> header/footer and improve a few things..
> 
> I had a very large number of warnings during the build, which I have
> ignored for now ;)
> 
> I also ran "make latexpdf" in the bitbake docs..:
> https://people.linaro.org/~nicolas.dechesne/bitbake.pdf
> 
> Feedback?

I think it looks good, I like it. We should start generating and
publishing them.

I was thinking we may want to publish pdfs of the individual manuals
too. I suspect that may be possible with a little creative juggling of
the files but I know how much you love my crazy scripting around things
like this! ;-) 

I'm torn on whether need to or not. 7MB for 800 pages is good going.

Cheers,

Richard



