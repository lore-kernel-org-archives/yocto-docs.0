Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B27DC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 16:51:41 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4826.1742575894409014012
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 09:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgTmQk55;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c59e7039eeso289159385a.2
        for <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 09:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742575893; x=1743180693; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaGEg9bjo3rSRYLeIJUoRmBjdxLagRv5/0aZy/YMLKk=;
        b=KgTmQk55/8O3g97wxlBPY2gXF0/temVsL5XsflFeMpul7Ds2BViss/EgJO5TfQM2xV
         l9uvDuaLv/IR6dm0x/tHDMzoTnRtTf7tKzLQeoImIWRiZbAG1XvNcVmMawHQNRzP0+Y0
         IJz4myuLtYjpFNGA4MfM97OpPSClZa24PG7Ud+zHbzF16TSwov3Jxi2Sp2l/MgTzdUAX
         RD1xZTqdErY8u6tP+otoNNSONR3cL4fFNi32nEXfvhjnwun7mS6gwADz4Mw1MRuvHef9
         MqNsrtzfvhkJoaHyr6iiI241v5UhT8NaIWS66zfoVZq2oBpoZv+Jy6WFkX4pJ1lvdDAo
         Tgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575893; x=1743180693;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaGEg9bjo3rSRYLeIJUoRmBjdxLagRv5/0aZy/YMLKk=;
        b=oLJ2h8SNj3RIKqEnnHKaHFbD10PcNo0iRkHML0+vWRFvBWwIJHue8/wLwYI88YEdSo
         VgL4dE5GABhF2GU4lX4j3laLf+D4YBQKbbJzAznkjDilW9TQPplpOHXIwfmMbNIon8Ml
         JEenlbIWp61izMQCzSfiC3leAUg2nz0n0WyKdx5/eH1VX9pxrslhxpslk+WzacvLZA1f
         FWkbgOBF8Rfrq1TvzINHx0nEur+X6YLrK67Xi0DjQ1C0MJW4NyQ6S/G2BZd2GLtstH8U
         YkRt+z6UN1PeYdOH8klBgvSQ5VKjeOelzgPe9JfY8kcm9QktAfhlzq6L+V7aUfh/7cr3
         pn+w==
X-Gm-Message-State: AOJu0YzNAYCFZPLXdtB9UrzTa0huuinXRwpMHBS0u9hVQy8sn+EdQaeE
	dY0Wufriw5VL3hsyvf4ocvGeOOujowNFwWn7MhtgW0tVwuwNxZSa+783mg==
X-Gm-Gg: ASbGncv7PX3qu+aU7QyL4f1jobjjO6l/798aj4FdsEl83eBDjEl/ujo/Xzfm+Kwvp9l
	quRdKtTRHgrNgP+2mfzlS7cBbnRXkaXWAQMoVsQYEAvaBFCuLMrqM5VAotlj224dJ3dF0HtVPDT
	WqTISANruIkc2/k+2qPcI14EDvEbS1loYZUJ0n+hM/beSrASeNuXacV55VaEUu5nT3PGHcsm0/Q
	qVGsDcZfKtkoir5QhVCKgHBAsPvULt7wCUl+3vgYvATGu6fAjy8aB0RE2tn8/7cjspm1KSxDIda
	lAiXX23JdW00Wfq9mgMtHYLVJHIoaZcxi0pTTIH8M/farEy1FCymCUpXNuIpOdSu2bGVtdfQ
X-Google-Smtp-Source: AGHT+IHVBuvbyUP079aFCEreeD8p6FnYTp8d47B6YVWMVStAZjLAS3/wYzUM/ilpGU1oepbQWBUkxQ==
X-Received: by 2002:a05:620a:1a90:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5ba1f56bemr624439485a.57.1742575893339;
        Fri, 21 Mar 2025 09:51:33 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b935846dsm149568685a.98.2025.03.21.09.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:51:32 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:51:30 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage patch
 version changelogs
Message-ID: <20250321165129.GA12580@localhost>
References: <20250318035605.1221-1-twoerner@gmail.com>
 <D8J8L9OJVWQU.2W2AYKHMLC149@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D8J8L9OJVWQU.2W2AYKHMLC149@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 16:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6603

On Tue 2025-03-18 @ 09:08:12 AM, Antonin Godard wrote:
> Hi Trevor,
> 
> On Tue Mar 18, 2025 at 4:56 AM CET, Trevor Woerner via lists.yoctoproject.org wrote:
> > Add a section after the 'git format-patch' information encouraging developers
> > to add patch version changelogs to their patch updates.
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> > index 0675aac984cf..5ade6ba5cdef 100644
> > --- a/documentation/contributor-guide/submit-changes.rst
> > +++ b/documentation/contributor-guide/submit-changes.rst
> > @@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version number::
> >  
> >     git format-patch -v2 <ref-branch>
> >  
> > +
> > +After generating updated patches (v2, v3, and so on) via ``git
> 
> s/via/with/? (to use simpler phrasings)

Yes, I too ran vale against this text. I saw that suggestion and chose to
ignore it ;-)

> > +format-patch``, ideally developers will add a patch version changelog
> > +to each patch that describes what has changed between each revision of
> > +the patch. Add patch version changelogs after the ``---`` marker in the
> > +patch, indicating that this information is part of this patch, but is not
> > +suitable for inclusion in the commit message (i.e. the git history) itself.
> > +Providing a patch version changelog makes it easier for maintainers and
> > +reviewers to succinctly understand what changed in all versions of the
> > +patch, without having to consult alternate sources of information, such as
> > +searching through messages on a mailing list. For example::
> > +
> > +   <patch title>
> > +
> > +   <commit message>
> > +
> > +   <SoB/etc lines>
> 
> Maybe write "<Signed-off-by/other trailers>" so there is no doubt about the
> meaning of SoB?

Okay.

> > +   ---
> > +   changes in v4:
> > +   - provide a clearer commit message
> > +   - fix spelling mistakes
> > +
> > +   changes in v3:
> > +   - replace func() to use other_func() instead
> > +
> > +   changes in v2:
> > +   - added
> 
> "added return value check for func"?
> to give a more concrete example

It's not uncommon for the v1 series to have N patches, and the v2 series to
have >N patches; in which case one or more patches were added in v2. This
isn't a really bad commit log where the author forgets to say what they added,
it's a message saying "this patch was added in v2".

> I think it would also be nice to also instrict to give the link to the previous
> patch but that might go a bit too far if done manually each time.

That's not something I've seen often, but it could be community-specific.

> > +   ---
> > +   <diffstat output>
> > +
> > +   <unified diff>
> > +
> >  Lastly please ensure that you also test your revised changes. In particular
> >  please don't just edit the patch file written out by ``git format-patch`` and
> >  resend it.
> 
> Otherwise this looks good to me, these are simply suggestions.
> 
> Thank you,
> Antonin
> 
> -- 
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

