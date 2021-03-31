Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.8558.1617205199442924782
 for <docs@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 08:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cz7BWOpE;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id l13so14731852qtu.9
        for <docs@lists.yoctoproject.org>; Wed, 31 Mar 2021 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MaRvfNtFJ28/dNLEkbeTvAdwavnXmmQg4vPuWg17Q1s=;
        b=Cz7BWOpEKDSxwtuHELzBjRSqs9Mj8ChlvuWPNHLXT8fyj/m+/u4m+LpB4ZitF6Te2H
         YeuRLhOFF14d1zot09MkLsepYTaTre0TnpK5xSDYYQJ94qkPTZou0huuyqb/6M7pRcHo
         5l9OOqDLZ1m8Cq+AtJY8htRn0oIsEonUnaMJpZdM+z9LamkqoHLcDmLMohLdBkLz/ruj
         YviGVmJVddXrqsDY6n8Y2MtB1RFNhWL0db4ncoH16qb8y0PTtgeVW9qbby8xuTqobpKX
         nyeLlYdN85EemxtKSzifXBdGu9Wi3XvkQ0Ug/kmtdP0oh45Xfvh6RUxp2zaPh/7RV+Zb
         R7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MaRvfNtFJ28/dNLEkbeTvAdwavnXmmQg4vPuWg17Q1s=;
        b=pTweNdxi/LwrwkLq8OIJ+xglTFoJFTB8UhWdCfqEHY/eg8fG7mK+zNAZ/VdD3B/HJC
         1NDHZaeAOTN88vYt5eI6wQdgNdUIiWYZsPvlycoqE+u3QnY4TL2fm6cEB7ywbCTFM7VD
         PctFZbNlJ9uuA2jHhUU7OHmqw5n1cyiNPDtN9JyDGI/d18bxq62zpjI9wZfBKZ3UOkhu
         VE6koYMbLF55ww11Tl3b5mun6Jw5M9DbwrlNgB6chBZdXx4oaTzqpoVGH7cvN/lc6SxR
         HnJzc6AGRxJy3Lb99RE+tz5SkJhz98QvCTpHSzB79WnS3/TXSB44DbxvcoSp8dliV40s
         J3YQ==
X-Gm-Message-State: AOAM532OCQyDxVyS4qbKRB5F8+PFCinURq8mP2UyzofVv5ILWYxHMJqc
	28JP/hrNDhIyuAC8ayqy+E6K62drsY4UmDhE73Fib4FPRME=
X-Google-Smtp-Source: ABdhPJwVQ7mATpmFukSt4zQq/aAYBD4UlgQwTaVH+FUkFATSBeOrB/gLs+MUNlOTHgXxIj8av6e15SQlDcSYVR+gSWI=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr2926977qta.289.1617205198357;
 Wed, 31 Mar 2021 08:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
 <20210330151905.13402-2-michael.opdenacker@bootlin.com> <7d197ec8-75b8-5010-bca8-f9174961609f@gmail.com>
 <81ead373-461c-b6b9-56cf-ed9fd952f553@bootlin.com>
In-Reply-To: <81ead373-461c-b6b9-56cf-ed9fd952f553@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 31 Mar 2021 08:39:31 -0700
Message-ID: <CAMKF1sqNnGQwLVJuZzZqi8TaUm7+XUZsiM=6CgoRhhupnsv9uQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/1] YP overview manual: style improvements
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 2:14 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Khem,
>
> Thanks for your review!
>
> On 3/30/21 9:50 PM, Khem Raj wrote:
> >
> >
> > On 3/30/21 8:19 AM, Michael Opdenacker wrote:
> >> - A few style improvements
> >> - Fix a few typos
> >> - Fix one of these typos happening in ref-manual/migration-2.1.rst
> >>    too
> >>
> >
> > thanks, this looks great, I was curious if the formatting piece will
> > be automatic for display, right ? or do we need some work in that
> > direction too.
>
>
> Oops, I must confess I'm not sure I understand what you mean here. Could
> you elaborate?
>

the left and right margins,  how do they look on epub readers for this
document was
what I was wondering.

> Cheers,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
