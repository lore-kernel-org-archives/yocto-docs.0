Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.5288.1630487086898674060
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 02:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VlW1PMyZ;
 spf=pass (domain: linaro.org, ip: 209.85.208.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f53.google.com with SMTP id s25so2850892edw.0
        for <docs@lists.yoctoproject.org>; Wed, 01 Sep 2021 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WuTA4Xf6xNNJhTq9VgnJb7VnNfoT1ypLFuAidXMeQLo=;
        b=VlW1PMyZpWUBUFRFTHOeteV05Me26uZpcbJIFrQXmToGT+TyQY1cmQ+AYrl6rlSuwz
         EmVLOAlgvS08v9TwD+TfMvC4E5evXuXhPaP4nA08darhtZOdypTGf3WHR8aXgdF8XIUC
         j87+VMoomAPzCqFBgMlEN6ZKYylD8d1wogz1jWp86b1mGZx4fOy0eLP+4SmPjiCFbM2/
         MGfsKipaudu7N8XMvdUptmz2Y0hmpneCc30A3E3CIO/gC2189Wplt6LoDnY7zT2eRcbw
         ksPZS3MDHtKYLc8D9FckjQHofpMV80uOAIJJz3G2dIvl/wL8bm4GbCPzVERXK/WwjEWV
         i/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WuTA4Xf6xNNJhTq9VgnJb7VnNfoT1ypLFuAidXMeQLo=;
        b=S+OYJoIzIb+Wquhcb4NTLGuSFsQimNupw/NGschEs5WKKDWQltoonAFzbflc9sxBqR
         ipa6/qnf3BjlImpmkPtQ6D9MQ4IqfSQNp0xUIE2Orv81xu3ewa+2Z+Gg7bCseBe1PDoK
         heAbjqVUDoYaAyPXX2XjCys1s6Pd1k7OM0ct3ssg1x1tf84O03yXqvlSBpIVRev7ZN5v
         qQk1efexFB7qylvlvKuRNumSXIKkZ+50lkW5lLeMpVrUF1/fV/mvhtDYglKqAt+3i7pQ
         AdRlstJLR1qLDj3oHTPX5JmGDxXFRYn4boDHQf5vYqDWMrYdbLe7o95BSaMhK816PNYj
         lWkg==
X-Gm-Message-State: AOAM531azFwSlU3KKmA0oS6AzgP4+MtYm/z/NOKjeHcZnpozJ+7vmR0P
	+DOjLg3symsjjEU43sZodUQj+uPcQqvSNegqum67j0Uyysk=
X-Google-Smtp-Source: ABdhPJyQ+3xV368dW8yNx8hGgDmZQs0+hQTjq1u+RymXFZLageazO7MDf1INbP2rZ/zZnPFVIYfL1gHxzymjI3pbPvE=
X-Received: by 2002:a05:6402:5108:: with SMTP id m8mr34883800edd.367.1630487085138;
 Wed, 01 Sep 2021 02:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <8b9f384e-81ad-9fdf-a096-e66183284720@crashcourse.ca>
In-Reply-To: <8b9f384e-81ad-9fdf-a096-e66183284720@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 1 Sep 2021 11:04:34 +0200
Message-ID: <CAP71Wjw72JcfAgDM9EzNckA-e1B-f5Lk3i3rCRWpuVyxPeCeAw@mail.gmail.com>
Subject: Re: [docs] did we ever resolve whether sphinx supported "replaceable" markup?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 10:56 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   longer ago than i care to remember, i mentioned that one thing i
> missed about docbook was the notion of the <replaceable> markup, which
> emphasized that something was merely a placeholder for an actual
> value -- this was normally rendered in italics.

This is the discussion you are referring to here:
https://lists.yoctoproject.org/g/docs/topic/77954380#567

It remains a good idea, and I am not aware of anything done since. It
is potentially something that could be brought up with the Sphinx
community as it is a generic question that might be interesting much
beyond our use cases.


>
>   i ask since it would be nice to have the same thing, since in the
> dev manual i am currently proofing, there's this code snippet:
>
>   $ source oe-init-build-env [build_dir]
>
> where "[]" is clearly meant to imply replaceable, and yet, only a few
> lines further down:
>
>   $ bitbake target
>
> where "target" is also clearly meant to be replaceable, but there is
> no markup to imply that, so it's kind of inconsistent.
>
>   i'm guessing there's no easy way to do this, other than perhaps to
> define another sphinx directive if it seems worth it.
>
> rday
>
> 
>
