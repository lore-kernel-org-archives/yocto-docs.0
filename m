Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.3777.1604005024349205097
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 13:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aEJjKq2T;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id n142so3318232ybf.7
        for <docs@lists.yoctoproject.org>; Thu, 29 Oct 2020 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xuBxWQJL/brkeILFunly07acuQvkPOtcYZojYY8hjEE=;
        b=aEJjKq2TMYgboOcOtTnUuzUTrm4u2Pxn9PTBohq217HiGbsL5IFB2GHkFv8O8b7u/L
         w238C3VCIeC1byfxucZrLQgySWiwPmMJe7o/yem6wBe03aj/MNoYwDZZg0o3efSoICD1
         qh6lw5+bteFxkgALOKLmVU+ubiHpZxXlCXk0fzfmXdjT9XeUCC6XhMM0wuRbUuXGtTy1
         ckvywNFafdU0TqeDt63eAyyeyTfGagPhlKCZBWkZsWKpdupGx20iFWpm5+5kimSrkmqW
         fnhG6WF+c6WIJFL8ZTZ3WZ5fBhnGuJF33+y7vS5ORPpOjGr8sA1ctUixMtfolEmtBjPa
         B1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xuBxWQJL/brkeILFunly07acuQvkPOtcYZojYY8hjEE=;
        b=mUgACKFn0Ejn0bWD/jEKM8v9iWjyScX+zRwqSNZ+0c4zIC9sOv8yXkwUurtrOb/CgR
         Q7sw0BjjljftWqnBXJWUn4tj+yCFOTcVbxlOAxSAZ98R1vxkqTl7nP7i+2lBE+AzzSt3
         r0552EuvGrv0jhAN+iGYxbwOlgrpTXC4OuRPgXyKzWCpSWOP71ZxUfUdwUWdT6YIX7tE
         17K2uFKJQKrdtwYw439L2IeVkWL8uvzDww8EoVQbws/WpJ1sAWyYvRB/nksjNsAtEt68
         L+X3PR9dNxepuOSPCtUzedmpvQmpgi3bTl4VbXsWm0AFgGkENd8vYt/XziKPfh2iLXS+
         Yh3A==
X-Gm-Message-State: AOAM530+55cnpc4TSVt6XIQMqU26fBvxLDmUv5c3iQuwT/Q0McDlg6lx
	iSvYXExjVsDGMnq7uwWVGLbllZ0FpqOj/dYnttL1QQ==
X-Google-Smtp-Source: ABdhPJz6oGUg5kJcuIxdM2+d/GIEceLjjfEoV6evMpvjWVulPRAyu+wkiAzOvW9bN+7GOhs7VZXnxOHX4kHU4+o6t7I=
X-Received: by 2002:a25:8752:: with SMTP id e18mr8559760ybn.133.1604005023501;
 Thu, 29 Oct 2020 13:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <415b35f9-a6-b311-3522-20e76cf6593c@crashcourse.ca>
 <CAP71Wjxe2w+=vh4L3E5MV03DyLPzt9C+9y17T4U+1ezKY8YL0A@mail.gmail.com> <f8af4db-88ce-a093-595-2bb821c1a9cc@crashcourse.ca>
In-Reply-To: <f8af4db-88ce-a093-595-2bb821c1a9cc@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 29 Oct 2020 21:56:52 +0100
Message-ID: <CAP71Wjz3o1imo-WRWt-bX=3SJrqNO73Fyh03P6QefHuQxMBnDQ@mail.gmail.com>
Subject: Re: [docs] is there a rationale for the numerous "^::$" lines:
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2020 at 9:53 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> On Thu, 29 Oct 2020, Nicolas Dechesne wrote:
>
> > On Thu, Oct 29, 2020 at 8:58 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >
> >
> > you are correct, they are equivalent. we've been rushing with these
> > changes, and it's lack of consistency
> >
> > >   just noticed the myriad of .rst content of the form:
> > >
> > >   ... blah blah woof woof:
> > >   ::
> > >
> > >      code snippet
> > >
> > > if memory serves, that would be equivalent to the simpler:
> > >
> > >   ... blah blah woof woof::
> >
> > I tend to prefer this form, and I tried to use this one for the files
> > I edited.. We should agree on which one to use, and fix
> > inconsistencies.
>
>   if no one objects, i can probably whip up a perl script this weekend
> and transmogrify all of this to the shorter form for consistency.

what if I object to doing that with perl ;)

>
> rday
