Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5ABC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 16:54:31 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.4729.1742576068034134491
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 09:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjXYf5UX;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5b2472969so210227285a.1
        for <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576067; x=1743180867; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMEdDNvn0qaZEKPGQjW2ax3B0WZvPqLh94BQ7SD+e7Y=;
        b=TjXYf5UXjRXuWzUvSoGcLEKqP5nvOx0Zpe04y544U132xX0s/65XU3q1+tPsD3MCB2
         JfVHPcn6MpGYxODheGomJcj4Uih9xI1dLoUIWmsEwrqgIJkSPKHPtiDgCsSJx1Cp73fh
         oUEnLLgGakagU8Kh0BZVA2jgT/8aPdkIDNunpjHSLVcxHz8zX96toRT+ML6zjsohFF5+
         j+vlbS00uiFnXEJb9DqLtuOV7g1ThDwcfmLwvcXFqgxbOhqPgcywlBCdCcx912EXdN72
         rpuz661vTu2MnyW1UmNdCFEXpcx8MO3V8mLrVRop86Mq978JTKrsA2ApSeBoMhy0hvuT
         vtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576067; x=1743180867;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMEdDNvn0qaZEKPGQjW2ax3B0WZvPqLh94BQ7SD+e7Y=;
        b=Omfzpv9PtARVvQrjlUls4o9DHL2AndYMWksFmhqhjGsuU80FlsYPwiNBFw7Yu04uvo
         IgxMvLuU8njP1nDh3jOTvchht1ECcpOoJH40h//XM0LTVCxYvLRGCCaEL7IFKggc4Vkr
         /ULz6Fb9p6wv93xB78zNmiMWBHjI4doQ8rayf+aQancbnMhp6qzZ6MWHwnN0+vyeBdZ/
         PNbn2H94WkZV5HSrT7/7yvezxnHv0qN3nk8RXuw3sUT95mdSk4otOu5G50X4qxj8MgZx
         JML6W+vk7f9JEGHPoWZr0Laf1OK74YTU/4DLxC/djxDv3JzkGu9MYpobSE3nxFKvA1kx
         YTiw==
X-Gm-Message-State: AOJu0Yx5KWzeRvXDwelXas+izM/raqSnpD3qdZBygkrTYWmReBkioZWz
	PlUjGdZ9GRC828/ZKZWF8FY71NO8s8y8xi1Q55K48Lfc3VKUIvqB1QCc4Q==
X-Gm-Gg: ASbGncuLPRICUvIAC89CM32RJ+c/G1UN400NW/cu+0RUSpY0IlVMP9pzVux9nd5PUGv
	8gM0Zve2lPfeV6lnwAbKr4bdQoe+Z0hjqKg5rMz8uYH2UxmWJJOQNfmNx745QdL7NnHm+iRmy1T
	s8FFrZ730GptlzHqRPK1uxN2F1Afjlw2L4/XT4by4LfRFldwEMT6jCD7UkWXPwqa/lf8A6azm4K
	lrGH9EObovI4gcdKzDY/mf7a9MHdF9n5OFq9m34/kkoWao/fck6MTCP1ABDuSQWSAW/amtKpcX6
	CZ86ljLMA0buiRxzyn1bh4V5kSpB6Hc+DgXBVah1zEar6q2jY4eh/5a0Vtx8G0hF7tZedjjA
X-Google-Smtp-Source: AGHT+IEnMj4Tq78s9jWPkdHks7z4nFpiE5A9f6pyfvBDlLzvXkFNb8d26C6fyt4jdiPVj2ICKPegiQ==
X-Received: by 2002:a05:620a:28c5:b0:7c5:49d6:733a with SMTP id af79cd13be357-7c5ba1840admr563161785a.21.1742576066859;
        Fri, 21 Mar 2025 09:54:26 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92d7ca1sm149876585a.47.2025.03.21.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:54:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:54:24 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: encourage patch
 version changelogs
Message-ID: <20250321165424.GB12580@localhost>
References: <20250318035605.1221-1-twoerner@gmail.com>
 <f7fa065f-8a8a-4768-9c63-fdcaca4602af@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7fa065f-8a8a-4768-9c63-fdcaca4602af@cherry.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 16:54:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6604

On Tue 2025-03-18 @ 11:56:47 AM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 3/18/25 4:56 AM, Trevor Woerner via lists.yoctoproject.org wrote:
> > Add a section after the 'git format-patch' information encouraging developers
> > to add patch version changelogs to their patch updates.
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   .../contributor-guide/submit-changes.rst      | 32 +++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
> > index 0675aac984cf..5ade6ba5cdef 100644
> > --- a/documentation/contributor-guide/submit-changes.rst
> > +++ b/documentation/contributor-guide/submit-changes.rst
> > @@ -776,6 +776,38 @@ argument to ``git format-patch`` with a version number::
> >      git format-patch -v2 <ref-branch>
> > +
> > +After generating updated patches (v2, v3, and so on) via ``git
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
> 
> If you're looking at this from a maintainer perspective, maybe consider
> using b4.
> 
> For reviewing stuff, I sometimes do
> 
> b4 diff -v 1 2 -- <lore.kernel.org URL to v2>
> 
> and that helps.
> 
> This is orthogonal to this patch though but just wanted to mention it :)

Thanks for the reminder! I've been meaning to force myself to start using b4.
We're pretty lucky that our repositories are hosted on lore.kernel.org. We
even have our own lore repository at work internally, so b4 would be useful
there too.

